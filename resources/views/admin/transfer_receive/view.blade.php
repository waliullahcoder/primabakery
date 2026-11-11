@extends('layouts.admin.print_app')
@section('content')
    <table class="table mb-3 info-table">
        <tr>
            <td>
                <div class="d-flex align-items-center"><b
                        style="flex-shrink: 0; width: 110px; display: inline-block;">Transfer No.</b> :
                    {{ $data->transfer_no }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b
                        style="flex-shrink: 0; width: 110px; display: inline-block;">Transfer Date.</b> :
                    {{ date('d-m-Y', strtotime($data->date)) }}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center"><b
                        style="flex-shrink: 0; width: 110px; display: inline-block;">From</b> :
                    {{ $data->host->name }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">To </b>
                    :
                    {{ $data->destination->name }}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Send
                        By</b> :
                    {{ $data->staff->name }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b
                        style="flex-shrink: 0; width: 110px; display: inline-block;">Receive By</b> :
                    {{ $data->approveBy ? $data->approveBy->name : 'Not Approved' }}</div>
            </td>
        </tr>
    </table>
    <table class="table table-bordered table-condensed table-striped align-middle mb-3">
        <thead>
            <tr class="align-middle">
                <th class="text-center">SL#</th>
                <th>Product Category</th>
                <th>Product Name (Code)</th>
                <th class="text-center">Expiry Date</th>
                <th class="text-right">Qty</th>
                <th class="text-start">Approve Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data->list as $key => $row)
                <tr class="align-middle">
                    <td class="text-center"><b>{{ $key + 1 }}</b></td>
                    <td>{{ $row->lifting_product->product->category->name }}</td>
                    <td>{{ $row->lifting_product->product->name }} ({{ $row->lifting_product->product->code }})</td>
                    <td class="text-center">{{ date('d-m-Y', strtotime($row->lifting_product->expiry_date)) }} </td>
                    <td class="text-right">{{ $row->qty }}</td>
                    <td class="text-start">{{ $data->approve == 1 ? 'Approved' : 'Not Approved' }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div style="padding-top: 50px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
