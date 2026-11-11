@extends('layouts.admin.report_app')

@section('form')
    <div class="row g-3">
        <div class="col-sm-6">
            <label for="report_type" class="form-label"><b>Report Type</b></label>
            <select name="report_type" id="report_type" class="form-select select" data-placeholder="Report Type">
                <option value="history" {{ $report_type == 'history' ? 'selected' : '' }}>History</option>
                <option value="summary" {{ $report_type == 'summary' ? 'selected' : '' }}>Summary</option>
            </select>
        </div>
        <div class="col-sm-6">
            <label for="vendor_id" class="form-label"><b>Vendor</b></label>
            <select name="vendor_id[]" id="vendor_id" class="form-select select" data-placeholder="Select Vendor" multiple>
                <option value=""></option>
                @foreach ($vendors as $vendor)
                    <option value="{{ $vendor->id }}"
                        {{ !is_null($vendor_ids) && in_array($vendor->id, $vendor_ids) ? 'selected' : '' }}>
                        {{ $vendor->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-sm-6">
            <label for="date_range" class="form-label"><b>Date</b></label>
            <input type="text" class="form-control date-range" name="date_range" id="date_range"
                placeholder="{{ __('Select Date Range') }}" data-time-picker="true" data-format="DD-MM-Y"
                data-separator=" to " autocomplete="off" required
                value="{{ !is_null($start_date) && !is_null($end_date) ? $start_date . ' to ' . $end_date : date('01-m-Y') . ' to ' . date('t-m-Y') }}">
        </div>
        <div class="col-sm-6">
            <label for="category_id" class="form-label"><b>Product Type</b></label>
            <select name="category_id[]" id="category_id" class="form-select select" data-placeholder="Select Category"
                multiple>
                <option value=""></option>
                @foreach ($categories as $category)
                    <option value="{{ $category->id }}"
                        {{ !is_null($category_ids) && in_array($category->id, $category_ids) ? 'selected' : '' }}>
                        {{ $category->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-sm-6">
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
        <div class="col-sm-6">
            <label for="product_id" class="form-label"><b>Products</b></label>
            <select name="product_id[]" id="product_id" class="form-select select" data-placeholder="Select Product"
                multiple>
                <option value=""></option>
                @foreach ($products as $product)
                    <option value="{{ $product->id }}"
                        {{ !is_null($product_ids) && in_array($product->id, $product_ids) ? 'selected' : '' }}>
                        {{ $product->name }} ({{ $product->code }})</option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    <form action="{{ Route('admin.lifting-return-history.index') }}" id="print-form" method="GET" target="_blank">
        <input type="hidden" name="print" value="true">
        <input type="hidden" name="report_type" class="report_type">
        <input type="hidden" name="vendor_id" class="vendor_id">
        <input type="hidden" name="category_id" class="category_id">
        <input type="hidden" name="date_range" class="date_range">
        <input type="hidden" name="product_id" class="product_id">
        <input type="hidden" name="store_id" class="store_id">
        <input type="hidden" name="product_id" class="product_id">
    </form>
    {!! $dataTable->table() !!}
@endsection

@push('js')
    <script type="text/javascript" src="{{ asset('vendor/datatables/buttons.server-side.js') }}"></script>
    {!! $dataTable->scripts() !!}

    <script type="text/javascript">
        $(document).on('click', '.getPdf', function(e) {
            e.preventDefault();
            var report_type = $('#report_type').val();
            var vendor_id = $('#vendor_id').val();
            var category_id = $('#category_id').val();
            var date_range = $('#date_range').val();
            var product_id = $('#product_id').val();
            var store_id = $('#store_id').val();

            $('.report_type').val(report_type);
            $('.vendor_id').val(vendor_id);
            $('.category_id').val(category_id);
            $('.date_range').val(date_range);
            $('.product_id').val(product_id);
            $('.store_id').val(store_id);

            if (date_range == '') {
                $("#date_range").trigger("select");
            } else {
                $('#print-form').submit();
            }
        });

        $(document).on('change', '#category_id, #vendor_id', function(e) {
            let category_id = $('#category_id').val();
            var vendor_id = $('#vendor_id').val();
            let url = "{{ Route('admin.lifting-history.index') }}";
            $.ajax({
                url: url,
                type: "POST",
                data: {
                    _method: 'GET',
                    getProducts: 'true',
                    category_id: category_id,
                    vendor_id: vendor_id,
                },
                success: (response) => {
                    if (response.status == 'success') {
                        $('#product_id option').remove();
                        $('#product_id').append('<option value=""></option>');
                        $.each(response.products, function(key, value) {
                            var html = `<option value="${value.id}">${value.name} (${value.code})</option>`;
                            $('#product_id').append(html);
                        });
                    }
                }
            });
        });
    </script>
@endpush
