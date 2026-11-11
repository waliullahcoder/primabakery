<?php

namespace App\DataTables;

use App\Models\Sales;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Illuminate\Http\Request;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class SalesHistoryDataTable extends DataTable
{
    // sales table er total amount column
    const AMOUNT_COLUMN = 'total_amount';

    /**
     * Build the DataTable class.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addIndexColumn()
            ->editColumn('date', function ($row) {
                return date('d-m-Y', strtotime($row->date));
            })
            ->addColumn('client_name', function ($row) {
                return $row->client->name ?? '';
            })
            ->addColumn('store_name', function ($row) {
                return $row->store->name ?? '';
            })
            ->addColumn('staff_name', function ($row) {
                return $row->staff->name ?? '';
            })
            ->editColumn(self::AMOUNT_COLUMN, function ($row) {
                return number_format($row->{self::AMOUNT_COLUMN}, 2, '.', ',');
            })
            ->with('total_amount_sum', function () use ($query) {
                return number_format((clone $query)->reorder()->sum(self::AMOUNT_COLUMN), 2, '.', ',');
            });
    }

    /**
     * Filter: Date, Client, Staff. Kichu na dile shob sales ashbe.
     * (Print er somoyo controller theke eta-i call hoy)
     */
    public function query(Request $request, Sales $model): QueryBuilder
    {
        $query = $model->newQuery()->with(['client', 'store', 'staff']);

        $client_id = array_filter((array) $request->client_id);
        $staff_id  = array_filter((array) $request->staff_id);

        if ($request->filled('date_range')) {
            $range = array_map('trim', explode(' to ', $request->date_range));
            $start = date('Y-m-d', strtotime($range[0]));
            $end   = date('Y-m-d', strtotime($range[1] ?? $range[0]));
            $query->whereDate('date', '>=', $start)->whereDate('date', '<=', $end);
        }
        if (!empty($client_id)) {
            $query->whereIn('client_id', $client_id);
        }
        if (!empty($staff_id)) {
            $query->whereIn('staff_id', $staff_id);
        }

        return $query->orderBy('date', 'desc')->orderBy('id', 'desc');
    }

    /**
     * Html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('dataTable')
            ->columns($this->getColumns())
            ->ajax([
                'url'  => route('admin.sales-history.index'),
                'type' => 'GET',
                'data' => 'function(d) {
                    d.date_range = $("#date_range").val();
                    d.client_id  = $("#client_id").val() || [];
                    d.staff_id   = $("#staff_id").val() || [];
                }',
            ])
            ->orderBy(1, 'desc')
            ->dom('Bfrtip')
            ->selectStyleSingle()
            ->parameters([
                'buttons' => [
                    Button::make('reload'),
                    [
                        'extend' => 'excel',
                        'text'   => '<i class="fal fa-file-spreadsheet"></i> Excel',
                    ],
                    [
                        'text'      => '<i class="fal fa-file-pdf"></i> Print',
                        'className' => 'getPdf',
                    ],
                ],
                'responsive'   => true,
                'drawCallback' => 'function() {
                    var json = this.api().ajax.json();
                    $("#total_amount").html(json && json.total_amount_sum ? json.total_amount_sum : "0.00");
                }',
            ]);
    }

    /**
     * Columns.
     */
    public function getColumns(): array
    {
        return [
            Column::make([
                'data'       => 'DT_RowIndex',
                'name'       => 'DT_RowIndex',
                'title'      => 'SL#',
                'orderable'  => false,
                'searchable' => false,
                'exportable' => false,
                'printable'  => false,
                'width'      => '60',
                'class'      => 'text-center',
            ]),
            Column::make(['data' => 'date', 'name' => 'date', 'title' => 'Date', 'class' => 'text-nowrap']),
            Column::make(['data' => 'invoice', 'name' => 'invoice', 'title' => 'Invoice', 'class' => 'text-nowrap']),
            Column::make(['data' => 'client_name', 'name' => 'client_name', 'title' => 'Client', 'class' => 'text-nowrap', 'orderable' => false, 'searchable' => false]),
            Column::make(['data' => 'store_name', 'name' => 'store_name', 'title' => 'Store', 'class' => 'text-nowrap', 'orderable' => false, 'searchable' => false]),
            Column::make(['data' => 'staff_name', 'name' => 'staff_name', 'title' => 'Staff', 'class' => 'text-nowrap', 'orderable' => false, 'searchable' => false]),
            Column::make([
                'data'   => self::AMOUNT_COLUMN,
                'name'   => self::AMOUNT_COLUMN,
                'title'  => 'Amount',
                'class'  => 'text-nowrap text-end',
                'footer' => '<span id="total_amount"></span>',
            ]),
        ];
    }

    protected function filename(): string
    {
        return 'sales_history_' . date('d_m_Y_h_i_s_A');
    }
}