@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-3 col-md-4 col-sm-6">
            <label for="transfer_no" class="form-label"><b>Transfer No</b></label>
            <input type="text" class="form-control" id="transfer_no" name="transfer_no" required placeholder="Transfer No"
                value="{{ $transfer_no }}" readonly>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <label for="date" class="form-label"><b>Transfer Date</b></label>
            <input type="text" class="form-control date_picker" id="date" name="date" required
                value="{{ date('d-m-Y', strtotime(old('date'))) }}" placeholder="Transfer Date">
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <label for="host_id" class="form-label"><b>Source Store</b></label>
            <select name="host_id" id="host_id" class="select form-select" data-placeholder="Select Host Store" required>
                <option value=""></option>
                @foreach ($stores as $store)
                    <option value="{{ $store->id }}"
                        {{ old('host_id') && old('host_id') == $store->id ? 'selected' : '' }}>{{ $store->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-3 col-md-4 col-sm-6">
            <label for="destination_id" class="form-label"><b>Destination Store</b></label>
            <select name="destination_id" id="destination_id" class="select form-select"
                data-placeholder="Select Destination Store" required>
                <option value=""></option>
            </select>
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="remarks" class="form-label"><b>Remarks</b></label>
            <input type="text" class="form-control" id="remarks" name="remarks" placeholder="Remarks"
                value="{{ old('remarks') ? old('remarks') : '' }}">
        </div>
        <div class="col-md-3 col-sm-6">
            <label for="product_id" class="form-label"><b>Products</b></label>
            <select name="product_id" id="product_id" class="select form-select" data-placeholder="Select Proudcts">
                <option value=""></option>
                @foreach ($products as $product)
                    <option value="{{ $product->id }}">
                        {{ $product->name }} ({{ $product->code }})
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-md-2 col-sm-6">
            <label for="stock" class="form-label"><b>Stock</b></label>
            <input type="number" step="any" class="form-control" id="stock" placeholder="Stock" readonly
                value="0">
        </div>
        <div class="col-md-2 col-sm-6">
            <label for="qty" class="form-label"><b>Quantity</b></label>
            <input type="number" step="any" class="form-control" id="qty" placeholder="Quantity">
        </div>
        <div class="col-md-2 col-sm-6">
            <label for="add" class="form-label text-white d-sm-block d-none"><b>Add</b></label>
            <div class="d-grid">
                <button type="button" class="btn btn-primary btn-sm" id="add_item" style="min-height: 39px">ADD
                    ITEM</button>
            </div>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped target-table align-middle mb-0" id="wTable">
                    <thead class="bg-primary border-primary text-white align-middle text-nowrap">
                        <tr>
                            <th>Vendor</th>
                            <th>Product Name</th>
                            <th>Code</th>
                            <th width="120" class="text-center">Stock Qty</th>
                            <th width="120" class="text-center">Transfer</th>
                            <th width="60" class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(".date_picker").datepicker({
                format: 'dd-mm-yyyy',
                changeMonth: true,
                changeYear: true,
            }).datepicker('setDate', 'today');

            $(document).on('change', '#host_id', function(e) {
                $('#tbody').html('');
                $('#product_id').val('');
                $('#product_id').select2();
                let host_id = $(this).val();
                let url = "{{ Route('admin.transfer.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        host_id: host_id,
                        get_destination_store: true,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#destination_id option').remove();
                            $('#destination_id').append('<option value=""></option>');
                            if (response.destination_stores.length > 0) {
                                response.destination_stores.forEach(function(item, index) {
                                    var option =
                                        `<option value="${item.id}">${item.name}</option>`;
                                    $('#destination_id').append(option);
                                });
                            }
                        }
                    }
                });
            });

            $(document).on('change', '#product_id', function(e) {
                let product_id = $('#product_id').val();
                let host_id = $('#host_id').val();
                let url = "{{ Route('admin.transfer.create') }}";
                if (host_id == '') {
                    Swal.fire({
                        width: "22rem",
                        title: "Failed!",
                        text: "Please Select a Host Store",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }

                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        host_id: host_id,
                        product_id: product_id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            if (response.data.stock > 0) {
                                $('#stock').val(response.data.stock);
                            } else {
                                $('#stock').val(0);
                            }
                        }
                    }
                });
            });

            $(document).on('click', '#add_item', function(e) {
                let product_id = $('#product_id').val();
                let host_id = $('#host_id').val();
                let url = "{{ Route('admin.transfer.create') }}";
                let stock = parseFloat($('#stock').val());
                let qty = isNaN(parseFloat($('#qty').val())) ? 0 : parseFloat($('#qty').val());
                if (stock < qty) {
                    Swal.fire({
                        width: "22rem",
                        title: "Failed!",
                        text: "Quantity must be less than or equal Stock Quantity!",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                if (qty == 0) {
                    Swal.fire({
                        width: "22rem",
                        title: "Failed!",
                        text: "Please define quantity!",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                if ($('#product_' + product_id).length) {
                    Swal.fire({
                        width: "22rem",
                        title: "Failed!",
                        text: "Already Added this product!",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }
                if (host_id == '') {
                    Swal.fire({
                        width: "22rem",
                        title: "Failed!",
                        text: "Please Select a Host Store",
                        icon: "error",
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }

                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        host_id: host_id,
                        product_id: product_id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var row = `
                                    <tr id="product_${response.data.product.id}">
                                        <td>${response.data.product.vendor.name}</td>
                                        <td>${response.data.product.name}</td>
                                        <td>${response.data.product.code}</td>
                                        <td>
                                            <input type="number" style="width: 120px;" class="form-control text-center" name="stock_qty[${response.data.product.id}]" value="${stock}" step="any" readonly required>
                                        </td>
                                        <td>
                                            <input type="number" style="width: 120px;" class="form-control text-center" name="transfer_qty[${response.data.product.id}]" value="${qty}" max="${stock}" step="any" required>
                                        </td>
                                        <td class="text-center">
                                            <input type="hidden" name="product_id[]" value="${response.data.product.id}">
                                            <button type="button" class="btn btn-xs remove_btn" data-id="${response.data.product.id}"><i class="fal fa-times"></i></button>
                                        </td>
                                    </tr>`;
                            $('#tbody').append(row);
                        }
                    }
                });
            });

            $(document).on('click', '.remove_btn', function(e) {
                e.preventDefault();
                var rowId = $(this).data('id');
                $('#product_' + rowId).remove();
            });
        });
    </script>
@endpush
