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
    const AMOUNT_COLUMN = 'total_amount';
    const DISCOUNT_COLUMN = 'discount';
    const PAID_COLUMN = 'total_paid';

    /**
     * Build DataTable.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addIndexColumn()

            // Date
            ->editColumn('date', function ($row) {
                return $row->date
                    ? date('d-m-Y', strtotime($row->date))
                    : '';
            })

            // Client
            ->addColumn('client_name', function ($row) {
                return $row->client->name ?? '';
            })

            // Store
            ->addColumn('store_name', function ($row) {
                return $row->store->name ?? '';
            })

            // Staff
            ->addColumn('staff_name', function ($row) {
                return $row->staff->name ?? '';
            })

            // Amount
            ->editColumn(self::AMOUNT_COLUMN, function ($row) {
                return number_format(
                    (float) ($row->total_amount ?? 0),
                    2,
                    '.',
                    ','
                );
            })

            // Discount
            ->editColumn(self::DISCOUNT_COLUMN, function ($row) {
                return number_format(
                    (float) ($row->discount ?? 0),
                    2,
                    '.',
                    ','
                );
            })

            // Net Total = Amount - Discount
            ->addColumn('net_total', function ($row) {
                $amount = (float) ($row->total_amount ?? 0);
                $discount = (float) ($row->discount ?? 0);

                return number_format(
                    $amount - $discount,
                    2,
                    '.',
                    ','
                );
            })

            // Total Paid
            ->editColumn(self::PAID_COLUMN, function ($row) {
                return number_format(
                    (float) ($row->total_paid ?? 0),
                    2,
                    '.',
                    ','
                );
            })

            // Total Amount Sum
            ->with('total_amount_sum', function () use ($query) {
                return number_format(
                    (clone $query)->reorder()->sum(self::AMOUNT_COLUMN),
                    2,
                    '.',
                    ','
                );
            })

            // Total Discount Sum
            ->with('total_discount_sum', function () use ($query) {
                return number_format(
                    (clone $query)->reorder()->sum(self::DISCOUNT_COLUMN),
                    2,
                    '.',
                    ','
                );
            })

            // Net Total Sum = Total Amount - Total Discount
            ->with('net_total_sum', function () use ($query) {
                $sum = (clone $query)
                    ->reorder()
                    ->selectRaw(
                        'COALESCE(SUM(COALESCE(total_amount, 0) - COALESCE(discount, 0)), 0) as net_total'
                    )
                    ->value('net_total');

                return number_format(
                    (float) $sum,
                    2,
                    '.',
                    ','
                );
            })

            // Total Paid Sum
            ->with('total_paid_sum', function () use ($query) {
                return number_format(
                    (clone $query)->reorder()->sum(self::PAID_COLUMN),
                    2,
                    '.',
                    ','
                );
            });
    }

    /**
     * Query with filters.
     */
    public function query(Request $request, Sales $model): QueryBuilder
    {
        $query = $model->newQuery()->with([
            'client',
            'store',
            'staff'
        ]);

        $client_id = array_filter((array) $request->client_id);
        $staff_id = array_filter((array) $request->staff_id);

        // Date Filter
        if ($request->filled('date_range')) {
            $range = array_map(
                'trim',
                explode(' to ', $request->date_range)
            );

            $start = date('Y-m-d', strtotime($range[0]));
            $end = date('Y-m-d', strtotime($range[1] ?? $range[0]));

            $query->whereDate('date', '>=', $start)
                ->whereDate('date', '<=', $end);
        }

        // Client Filter
        if (!empty($client_id)) {
            $query->whereIn('client_id', $client_id);
        }

        // Staff Filter
        if (!empty($staff_id)) {
            $query->whereIn('staff_id', $staff_id);
        }

        return $query->orderBy('date', 'desc')
            ->orderBy('id', 'desc');
    }

    /**
     * HTML Builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('dataTable')
            ->columns($this->getColumns())

            ->ajax([
                'url' => route('admin.sales-history.index'),
                'type' => 'GET',
                'data' => 'function(d) {
                    d.date_range = $("#date_range").val();
                    d.client_id = $("#client_id").val() || [];
                    d.staff_id = $("#staff_id").val() || [];
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
                        'text' => '<i class="fal fa-file-spreadsheet"></i> Excel',
                    ],

                    [
                        'text' => '<i class="fal fa-file-pdf"></i> Print',
                        'className' => 'getPdf',
                    ],
                ],

                'responsive' => true,

                'drawCallback' => 'function() {

                    var json = this.api().ajax.json() || {};

                    $("#total_amount").html(json.total_amount_sum || "0.00");

                    $("#total_discount").html(json.total_discount_sum || "0.00");

                    $("#net_total").html(json.net_total_sum || "0.00");

                    $("#total_paid").html(json.total_paid_sum || "0.00");

                }',
            ]);
    }

    /**
     * Columns.
     */
    public function getColumns(): array
    {
        return [
            // SL
            Column::make([
                'data' => 'DT_RowIndex',
                'name' => 'DT_RowIndex',
                'title' => 'SL#',
                'orderable' => false,
                'searchable' => false,
                'exportable' => false,
                'printable' => false,
                'width' => '60',
                'class' => 'text-center',
            ]),

            // Date
            Column::make([
                'data' => 'date',
                'name' => 'date',
                'title' => 'Date',
                'class' => 'text-nowrap'
            ]),

            // Invoice
            Column::make([
                'data' => 'invoice',
                'name' => 'invoice',
                'title' => 'Invoice',
                'class' => 'text-nowrap'
            ]),

            // Client
            Column::make([
                'data' => 'client_name',
                'name' => 'client_name',
                'title' => 'Client',
                'orderable' => false,
                'searchable' => false
            ]),

            // Store
            Column::make([
                'data' => 'store_name',
                'name' => 'store_name',
                'title' => 'Store',
                'orderable' => false,
                'searchable' => false
            ]),

            // Staff
            Column::make([
                'data' => 'staff_name',
                'name' => 'staff_name',
                'title' => 'Staff',
                'orderable' => false,
                'searchable' => false
            ]),

            // Amount
            Column::make([
                'data' => 'total_amount',
                'name' => 'total_amount',
                'title' => 'Amount',
                'class' => 'text-nowrap text-end',
                'footer' => '<span id="total_amount"></span>',
            ]),

            // Discount
            Column::make([
                'data' => 'discount',
                'name' => 'discount',
                'title' => 'Discount',
                'class' => 'text-nowrap text-end',
                'footer' => '<span id="total_discount"></span>',
            ]),

            // Net Total (Calculated)
            Column::make([
                'data' => 'net_total',
                'name' => 'net_total',
                'title' => 'Net Total',
                'class' => 'text-nowrap text-end fw-bold',
                'orderable' => false,
                'searchable' => false,
                'footer' => '<span id="net_total"></span>',
            ]),

            // Total Paid
            Column::make([
                'data' => 'total_paid',
                'name' => 'total_paid',
                'title' => 'Total Paid',
                'class' => 'text-nowrap text-end',
                'footer' => '<span id="total_paid"></span>',
            ]),
        ];
    }

    /**
     * Export filename.
     */
    protected function filename(): string
    {
        return 'sales_history_' . date('d_m_Y_h_i_s_A');
    }
}