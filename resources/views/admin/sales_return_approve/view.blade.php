@extends('layouts.admin.print_app')
@section('content')
    <table class="table mb-3 info-table">
        <tr>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Return
                        No.</b> :
                    {{ $data->return_no }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Return
                        Date</b> :
                    {{ date('d-m-Y', strtotime($data->date)) }}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Client
                        Name.</b> :
                    {{ $data->client->name }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b
                        style="flex-shrink: 0; width: 110px; display: inline-block;">Destination Store</b> :
                    {{ $data->store->name }}</div>
            </td>
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Return
                        By</b> :
                    {{ $data->staff->name }}</div>
            </td>
            <td>
                <div class="d-flex align-items-center"><b style="flex-shrink: 0; width: 110px; display: inline-block;">Store
                        Approve</b> :
                    {{ $data->approveBy ? $data->approveBy->name : 'Not Approved' }}</div>
            </td>
        </tr>
    </table>
    <table class="table table-bordered table-condensed table-striped align-middle mb-3">
        <thead>
            <tr>
                <th class="text-center">SL#</th>
                <th>Product Category</th>
                <th>Product Name (Code)</th>
                {{-- <th class="text-center">Expiry Date</th> --}}
                <th class="text-right">Qty</th>
                <th class="text-start">Approve Status</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data->list as $key => $row)
                <tr class="align-middle">
                    <td class="text-center"><b>{{ $key + 1 }}</b></td>
                    <td>{{ $row->product->category->name }}</td>
                    <td>{{ $row->product->name }} ({{ $row->product->code }})</td>
                    {{-- <td class="text-center">{{ date('d-m-Y', strtotime($row->sales_list->lifting_product->expiry_date)) }} </td> --}}
                    <td class="text-right">{{ $row->qty }}</td>
                    <td class="text-start">{{ $data->approve == 1 ? 'Approved' : 'Not Approved' }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>
    <div style="padding-top: 50px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
