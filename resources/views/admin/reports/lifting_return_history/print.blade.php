@extends('layouts.admin.print_app')
@section('content')
    @if ($report_type == 'summary')
        <table class="table table-bordered table-condensed table-striped align-middle mb-3">
            <thead>
                <tr>
                    <th class="text-center">SL#</th>
                    <th>Vendor</th>
                    <th>Product Category</th>
                    <th>Product Name (Code)</th>
                    <th class="text-center">Quantity</th>
                    <th class="text-right">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $total_qty = 0;
                    $total_amount = 0;
                @endphp
                @foreach ($data as $key => $row)
                    <tr>
                        <td class="text-center"><b>{{ $key + 1 }}</b></td>
                        <td>{{ $row->vendor->name }}</td>
                        <td>{{ $row->product->category->name }}</td>
                        <td>{{ $row->product->name }} ({{ $row->product->code }})</td>
                        <td class="text-center">{{ number_format($row->total_qty, 2, '.', ',') }}</td>
                        <td class="text-right">{{ number_format($row->total_price, 2, '.', ',') }}</td>
                    </tr>
                    @php
                        $total_qty += $row->total_qty;
                        $total_amount += $row->total_price;
                    @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-right" colspan="4"><b>Total Summary</b></td>
                    <td class="text-center" colspan="1"><b>{{ number_format($total_qty, 2, '.', ',') }}</b></td>
                    <td class="text-right" colspan="1"><b>{{ number_format($total_amount, 2, '.', ',') }}</b></td>
                </tr>
            </tfoot>
        </table>
    @elseif ($report_type == 'history')
        <table class="table table-bordered table-condensed table-striped align-middle mb-3">
            <thead>
                <tr>
                    <th class="text-center">SL#</th>
                    <th>Date</th>
                    <th>Return No.</th>
                    <th>Vendor</th>
                    <th>Product Category</th>
                    <th>Product Name (Code)</th>
                    <th class="text-center">Qty</th>
                    <th class="text-center">Rate</th>
                    <th class="text-right">Amount</th>
                </tr>
            </thead>
            <tbody>
                @php
                    $total_qty = 0;
                    $total_amount = 0;
                @endphp
                @foreach ($data as $key => $row)
                    <tr>
                        <td class="text-center"><b>{{ $key + 1 }}</b></td>
                        <td>{{ date('d-m-Y', strtotime($row->return->date)) }}</td>
                        <td>{{ @$row->return->return_no }}</td>
                        <td>{{ @$row->vendor->name }}</td>
                        <td>{{ @$row->product->category->name }}</td>
                        <td>{{ @$row->product->name }} ({{ @$row->product->code }})</td>
                        <td class="text-center">{{ number_format($row->qty, 2, '.', ',') }} </td>
                        <td class="text-center">{{ number_format($row->lifting_price, 2, '.', ',') }}</td>
                        <td class="text-right">{{ number_format($row->amount, 2, '.', ',') }}</td>
                    </tr>
                    @php
                        $total_qty += $row->qty;
                        $total_amount += $row->amount;
                    @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <td class="text-right" colspan="6"><b>Total Summary</b></td>
                    <td class="text-center" colspan="1"><b>{{ number_format($total_qty, 2, '.', ',') }}</b></td>
                    <td class="text-center" colspan="1"></td>
                    <td class="text-right" colspan="1"><b>{{ number_format($total_amount, 2, '.', ',') }}</b></td>
                </tr>
            </tfoot>
        </table>
    @endif
    <div style="padding-top: 30px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
