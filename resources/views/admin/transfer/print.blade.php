@extends('layouts.admin.print_app')
@section('content')
    <table class="table mb-2 info-table" style="background-color: #ddd;">
        <tr>
            <td style="padding-bottom: 0px !important">
                <b class="d-inline-block">Transfer Invoice: </b>
                <span class="d-inline-block">#{{ $data->transfer_no }}</span>
            </td>
            <td style="padding-bottom: 0px !important" class="text-right">
                <b class="d-inline-block text-left">Transfer Date:</b>
                <span class="d-inline-block">{{ date('d-m-Y', strtotime($data->date)) }}</span>
            </td>
        </tr>
    </table>

    <table class="table mb-3 info-table" style="border-bottom: 1px solid #ddd;">
        <tr>
            <td>
                <b class="d-inline-block" style="min-width: 120px;">From Store :</b>
                <span class="d-inline-block" style="min-width: 200px;">{{ @$data->host->name }}</span>
            </td>
            <td class="text-right">
                <b class="d-inline-block text-left">To Store :</b>
                <span class="d-inline-block" style="min-width: 200px;">{{ @$data->destination->name }}</span>
            </td>
        </tr>
        <tr>
            <td>
                <div class="overflow-hidden">
                    <b class="d-inline-block" style="min-width: 120px;">Send By :</b>
                    <span class="d-inline-block"
                        style="min-width: 200px;">{{ date('d-m-Y', strtotime($data->date)) }}</span>
                </div>
            </td>
            <td class="text-right">
                <div class="overflow-hidden">
                    <b class="d-inline-block text-left">Received By :</b>
                    <span class="d-inline-block" style="min-width: 200px;">{{ @$data->approveBy->name }}</span>
                </div>
            </td>
        </tr>
    </table>

    <table class="table table-bordered table-condensed table-striped align-middle mb-3">
        <thead>
            <tr>
                <th class="text-center">SL#</th>
                <th>Product Category</th>
                <th>Product Name (Code)</th>
                <th class="text-center">Quantity</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data->list as $row)
                <tr>
                    <td class="text-center"><b>{{ $loop->iteration }}</b></td>
                    <td>{{ @$row->product->category->name }}</td>
                    <td>{{ @$row->product->name }} ({{ $row->product->code }})</td>
                    <td class="text-center">
                        {{ number_format($row->qty, 2, '.', ',') . '(' . @$row->product->attribute->name . ')' }} </td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td class="text-right" colspan="3"><b>Total Summary</b></td>
                <td class="text-center" colspan="1"><b>{{ number_format($data->list->sum('qty'), 2, '.', ',') }}</b></td>
            </tr>
        </tfoot>
    </table>

    <div style="padding-top: 50px;">Print Date & Time : {{ date('d-m-Y h:i:s A') }}</div>
@endsection
