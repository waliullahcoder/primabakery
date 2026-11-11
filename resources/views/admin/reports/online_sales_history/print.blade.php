@extends('layouts.admin.print_app')

@section('content')
    @if ($report_type == 'product_summary')
        <table class="table table-bordered table-condensed table-striped align-middle mb-3">
            <thead>
                <tr>
                    <th class="text-center">SL#</th>
                    <th>Product Name</th>
                    <th>Product Code</th>
                    <th class="text-right">Quantity</th>
                    <th class="text-right">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $total_amount = 0;
                @endphp
                @foreach ($data as $key => $row)
                    <tr>
                        <td class="text-center"><b>{{ $key + 1 }}</b></td>
                        <td>{{ @$row->product->name }}</td>
                        <td>{{ @$row->product->code }}</td>
                        <td class="text-right">{{ number_format($row->total_qty) }}</td>
                        <td class="text-right">{{ number_format($row->total_amount) }}</td>
                    </tr>
                    @php
                        $total_amount += $row->total_amount;
                    @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-right" colspan="4"><b>Total Summary</b></td>
                    <td class="text-right" colspan="1"><b>{{ number_format($total_amount) }}</b></td>
                </tr>
            </tfoot>
        </table>
    @elseif ($report_type == 'history')
        <table class="table table-bordered table-condensed table-striped align-middle mb-3">
            <thead>
                <tr>
                    <th class="text-center">SL#</th>
                    <th>Date</th>
                    <th>Order ID</th>
                    <th>Product Name</th>
                    <th class="text-right">Quantity</th>
                    <th class="text-right">Price</th>
                    <th class="text-right">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $total_amount = 0;
                @endphp
                @foreach ($data as $row)
                    <tr>
                        <td class="text-center"><b>{{ $loop->iteration }}</b></td>
                        <td>{{ date('d-m-Y', strtotime($row->created_at)) }}</td>
                        <td>{{ @$row->order->order_code }}</td>
                        <td>{{ @$row->product->name }}</td>
                        <td class="text-right">{{ $row->quanity }}</td>
                        <td class="text-right">{{ $row->sale_price }}</td>
                        <td class="text-right">{{ $row->order_price }}</td>
                    </tr>
                    @php
                        $total_amount += $row->order_price;
                    @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-right" colspan="6"><b>Total Summary</b></td>
                    <td class="text-right" colspan="1"><b>{{ number_format($total_amount) }}</b></td>
                </tr>
            </tfoot>
        </table>
    @endif
    <div style="padding-top: 30px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
