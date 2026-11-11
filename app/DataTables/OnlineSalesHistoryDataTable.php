<?php

namespace App\DataTables;

use App\Models\OrderProduct;
use Illuminate\Database\Eloquent\Builder as QueryBuilder;
use Yajra\DataTables\EloquentDataTable;
use Yajra\DataTables\Html\Builder as HtmlBuilder;
use Yajra\DataTables\Html\Button;
use Yajra\DataTables\Html\Column;
use Yajra\DataTables\Services\DataTable;

class OnlineSalesHistoryDataTable extends DataTable
{
    /**
     * Build the DataTable class.
     *
     * @param QueryBuilder $query Results from query() method.
     */
    public function dataTable(QueryBuilder $query): EloquentDataTable
    {
        return (new EloquentDataTable($query))
            ->addIndexColumn()
            ->addColumn('date', function ($row) {
                return date('d-m-Y', strtotime($row->created_at));
            });
    }

    /**
     * Get the query source of dataTable.
     */
    public function query(OrderProduct $model): QueryBuilder
    {
        $query = $model->with(['order', 'product']);
        $date_range = explode('to', request('date_range'));
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
        $category_id = request('category_id');
        $product_id = request('product_id');

        if (!is_null($product_id)) {
            $query->whereIn('product_id', $product_id);
        }
        if (!is_null($category_id)) {
            $query->whereHas('product', function ($squery) use ($category_id) {
                $squery->whereIn('category_id', $category_id);
            });
        }
        if (!is_null($start_date) && !is_null($end_date)) {
            $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
            });
        } else {
            $start_date = date('Y-m-01');
            $end_date = date('Y-m-t');
            $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
            });
        }

        return $query->orderBy('id', 'desc');
    }

    /**
     * Optional method if you want to use the html builder.
     */
    public function html(): HtmlBuilder
    {
        return $this->builder()
            ->setTableId('dataTable')
            ->columns($this->getColumns())
            ->minifiedAjax()
            ->dom('Bfrtip')
            ->selectStyleSingle()
            ->parameters([
                'buttons'      => [
                    Button::make('reload'),
                    [
                        'extend'  => 'excel',
                        'text'    => '<i class="fal fa-file-spreadsheet"></i> Exel',
                    ],
                    [
                        'text'    => '<i class="fal fa-file-pdf"></i> Print',
                        'className' => 'getPdf',
                    ],
                ],
                'responsive' => true,
                'pageLength' => 20,
            ]);
    }

    /**
     * Get the dataTable columns definition.
     */
    public function getColumns(): array
    {
        return [
            Column::make([
                'data'      => "DT_RowIndex",
                'name'      => "DT_RowIndex",
                'title'     => 'SL#',
                'orderable' => false,
                'searchable' => false,
                'width'     => '60',
                'class'     => 'text-center',
            ]),
            Column::make([
                'data'      => 'date',
                'name'      => 'date',
                'title'     => 'Date',
                'class'     => 'text-nowrap',
                'orderable' => false,
                'searchable' => false,
            ]),
            Column::make([
                'data'      => 'order.order_code',
                'name'      => 'order.order_code',
                'title'     => 'Order ID',
                'class'     => 'text-nowrap',
                'orderable' => false,
                'searchable' => false,
            ]),
            Column::make([
                'data'      => 'product.name',
                'name'      => 'product.name',
                'title'     => 'Product Name',
                'class'     => 'text-nowrap',
                'orderable' => false,
                'searchable' => false,
            ]),
            Column::make([
                'data'      => 'quantity',
                'name'      => 'quantity',
                'title'     => 'Quantity',
                'class'     => 'text-nowrap',
            ]),
            Column::make([
                'data'      => 'sale_price',
                'name'      => 'sale_price',
                'title'     => 'Price',
                'class'     => 'text-nowrap',
            ]),
            Column::make([
                'data'      => 'order_price',
                'name'      => 'order_price',
                'title'     => 'Amount',
                'class'     => 'text-nowrap',
            ]),
        ];
    }

    /**
     * Get the filename for export.
     */
    protected function filename(): string
    {
        return 'online_sales_history_' . date('d_m_Y_h_i_s_A');
    }
}
