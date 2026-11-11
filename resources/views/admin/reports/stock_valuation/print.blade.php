@extends('layouts.admin.print_app')

@section('content')
    <table class="table table-bordered table-condensed table-striped align-middle mb-3">
        <thead>
            <tr>
                <th width="20px" rowspan="2">SL#</th>
                <th rowspan="2">Category</th>
                <th rowspan="2">Product Name</th>
                <th rowspan="2">Product Code</th>
                <th rowspan="2">UOM</th>
                <th rowspan="2" class="text-right">Quantity</th>
                <th colspan="2" class="text-center">Purchase value</th>
                <th colspan="2" class="text-center">Sales value</th>
            </tr>
            <tr>
                <th class="text-right">Cost</th>
                <th class="text-right">Value</th>
                <th class="text-right">Rate</th>
                <th class="text-right">Value</th>
            </tr>
        </thead>
        <tbody>
            @if (count($data) > 0)
                @php
                    $total_lifting_amount = 0;
                    $total_sales_amount = 0;
                @endphp
                @foreach ($data['product_prices'] as $row)
                    @php
                        $liftings = $data['liftings']->where('product_id', $row->product_id)->sum('qty');
                        $lifting_amount = $data['liftings']->where('product_id', $row->product_id)->sum('amount');
                        $avarage_lifting_price = $lifting_amount / $liftings;

                        $lifting_returns = $data['lifting_returns']->where('product_id', $row->product_id)->sum('qty');
                        $sales = $data['sales']->where('product_id', $row->product_id)->sum('qty');
                        $sales_returns = $data['sales_returns']->where('product_id', $row->product_id)->sum('qty');
                        $online_sales = $data['online_sales']->where('product_id', $row->product_id)->sum('qty');
                        $transfers = $data['transfer_or_receives']
                            ->whereIn('host_id', $data['store_id'])
                            ->where('product_id', $row->product_id)
                            ->sum('qty');
                        $receives = $data['transfer_or_receives']
                            ->whereIn('destination_id', $data['store_id'])
                            ->where('product_id', $row->product_id)
                            ->sum('qty');
                        $balance_qty = $liftings + $sales_returns + $receives - $lifting_returns - $sales - $transfers - $online_sales;

                        $total_lifting_amount += $balance_qty * $avarage_lifting_price;
                        $total_sales_amount += $balance_qty * $row->sale_price;
                    @endphp

                    @if ($balance_qty == 0)
                        @continue
                    @endif
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $row->category_name }}</td>
                        <td>{{ $row->name }}</td>
                        <td>{{ $row->code }}</td>
                        <td>{{ $row->attribute_name }}</td>
                        <td class="text-right">{{ number_format($balance_qty, 2, '.', ',') }}</td>
                        <td class="text-right">
                            {{ number_format($avarage_lifting_price, 2, '.', ',') }}</td>
                        <td class="text-right">
                            {{ number_format($balance_qty * $avarage_lifting_price, 2, '.', ',') }}
                        </td>
                        <td class="text-right">{{ number_format($row->sale_price, 2, '.', ',') }}</td>
                        <td class="text-right">
                            {{ number_format($balance_qty * $row->sale_price, 2, '.', ',') }}
                        </td>
                    </tr>
                @endforeach
            @endif
        </tbody>
        @if (count($data) > 0)
            <tfoot>
                <tr>
                    <th colspan="7" class="text-right">Total Summary</th>
                    <th colspan="1" class="text-center">
                        {{ number_format($total_lifting_amount, 2, '.', '') }}</th>
                    <th colspan="1" class="text-center"></th>
                    <th colspan="1" class="text-center">
                        {{ number_format($total_sales_amount, 2, '.', '') }}
                    </th>
                </tr>
            </tfoot>
        @endif
    </table>
    <div style="padding-top: 30px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
