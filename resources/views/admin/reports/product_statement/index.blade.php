@extends('layouts.admin.report_app')

@section('form')
    <div class="row g-3">
        <input type="hidden" name="filter" value="1">
        <div class="col-md-4 col-sm-6">
            <label for="store_id" class="form-label"><b>Store</b></label>
            <select name="store_id" id="store_id" class="form-select select" data-placeholder="Select Store">
                <option value=""></option>
                @foreach ($stores as $store)
                    <option value="{{ $store->id }}" {{ $store->id == $store_id ? 'selected' : '' }}>
                        {{ $store->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="date_range" class="form-label"><b>Date</b></label>
            <input type="text" class="form-control date-range" name="date_range" id="date_range"
                placeholder="{{ __('Select Date Range') }}" data-time-picker="true" data-format="DD-MM-Y"
                data-separator=" to " autocomplete="off" required
                value="{{ !is_null($start_date) && !is_null($end_date) ? date('d-m-Y', strtotime($start_date)) . ' to ' . date('d-m-Y', strtotime($end_date)) : date('01-m-Y') . ' to ' . date('t-m-Y') }}">
        </div>
        <div class="col-md-4 col-sm-6">
            <label for="product_id" class="form-label"><b>Product</b></label>
            <select name="product_id" id="product_id" class="form-select select" data-placeholder="Select Product" required>
                <option value=""></option>
                @foreach ($products as $product)
                    <option value="{{ $product->id }}" {{ $product->id == $product_id ? 'selected' : '' }}>
                        {{ $product->name }} - {{ $product->code }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    <form action="{{ $filter_link }}" id="print-form" method="GET" target="_blank">
        <input type="hidden" name="print" value="true">
        <input type="hidden" name="filter" value="1">
        <input type="hidden" name="store_id" class="store_id">
        <input type="hidden" name="product_id" class="product_id">
        <input type="hidden" name="date_range" class="date_range">
    </form>
    <div class="table-responsive">
        <table id="dataTable" class="table table-bordered table-sm">
            <thead>
                <tr>
                    <th class="px-3"></th>
                    <th class="px-3"></th>
                    <th class="px-3"></th>
                    <th class="px-3 text-end" colspan="2">Previous Balance</th>
                    <th class="px-3 text-end">{{ number_format($data['opening'], 2, '.', ',') }}</th>
                </tr>
                <tr>
                    <th class="px-3 text-center" width="40px">Sl#</th>
                    <th class="px-3">Date</th>
                    <th class="px-3">Description</th>
                    <th class="px-3 text-end">Stock In</th>
                    <th class="px-3 text-end">Stock Out</th>
                    <th class="px-3 text-end">Balance</th>
                </tr>
            </thead>
            @php
                $ballance = $data['opening'];
                $total_stock_in = 0;
                $total_stock_out = 0;
            @endphp
            @if (count($data['statements']) > 0)
                <tbody>
                    @foreach ($data['statements'] as $row)
                        <tr>
                            <td class="text-center px-3">{{ $loop->iteration }}</td>
                            <td class="px-3">{{ $row['date'] }}</td>
                            <td class="px-3">{{ $row['particulars'] }}</td>
                            <td class="px-3 text-end">{{ number_format($row['stock_in'], 2, '.', ',') }}</td>
                            <td class="px-3 text-end">{{ number_format($row['stock_out'], 2, '.', ',') }}</td>
                            <td class="px-3 text-end">{{ number_format($row['balance'], 2, '.', ',') }}</td>
                        </tr>
                        @php
                            $ballance = $row['balance'];
                            $total_stock_in += $row['stock_in'];
                            $total_stock_out += $row['stock_out'];
                        @endphp
                    @endforeach
                </tbody>
            @endif
            <tfoot>
                <tr class="bg-primary text-white">
                    <th colspan="3" class="text-end px-3 text-white">Total Summary</th>
                    <th class="text-end px-3 text-white">{{ number_format($total_stock_in, 2, '.', ',') }}</th>
                    <th class="text-end px-3 text-white">{{ number_format($total_stock_out, 2, '.', ',') }}</th>
                    <th class="text-end px-3 text-white">{{ number_format($ballance, 2, '.', ',') }}</th>
                </tr>
            </tfoot>
        </table>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $('#dataTable').DataTable({
                "order": false,
                dom: 'Bfrtip',
                buttons: [
                    'excelHtml5',
                    {
                        'text': '<i class="fal fa-file-pdf"></i> Print',
                        'className': 'getPdf',
                    },
                ]
            });

            $(document).on('click', '.getPdf', function(e) {
                e.preventDefault();
                var store_id = $('#store_id').val();
                var product_id = $('#product_id').val();
                var date_range = $('#date_range').val();
                $('.store_id').val(store_id);
                $('.product_id').val(product_id);
                $('.date_range').val(date_range);
                $('#print-form').submit();
            });
        });
    </script>
@endpush
