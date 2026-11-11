@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="vendor_id" class="form-label"><b>Vendor <span class="text-danger">*</span></b></label>
            <select name="vendor_id" id="vendor_id" class="select form-select" data-placeholder="Selct Vendor" required>
                <option value=""></option>
                @foreach ($vendors as $vendor)
                    <option value="{{ $vendor->id }}" {{ $data->vendor_id == $vendor->id ? 'selected' : '' }}>
                        {{ $vendor->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="payment_no" class="form-label"><b>Payment No <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" readonly name="payment_no" id="payment_no" placeholder="Payment No"
                value="{{ $data->payment_no }}" required>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="payment_date" class="form-label"><b>Payment Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="payment_date" name="payment_date" required
                value="{{ date('d-m-Y', strtotime($data->payment_date)) }}" placeholder="Payment Date">
        </div>
        @php
            $adminSettings = \App\Models\AdminSetting::first();
        @endphp
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="payment_type" class="form-label"><b>Payment Type <span class="text-danger">*</span></b></label>
            <select name="payment_type" id="payment_type" class="select form-select" required>
                <option value="Cash" {{ $data->payment_type == 'Cash' ? 'selected' : '' }}>Cash</option>
                <option value="Bank" {{ $data->payment_type == 'Bank' ? 'selected' : '' }}>Bank</option>
            </select>
        </div>
        @if ($adminSettings->accounting == 1)
            <div class="col-lg-3 col-sm-6">
                <label for="coa_setup_id" class="form-label"><b>Account Heads <span class="text-danger">*</span></b></label>
                <select name="coa_setup_id" id="coa_setup_id" class="select form-select"
                    data-placeholder="Select Account Head" required>
                    <option value="">Select Account Head</option>
                    @foreach ($cash_heads as $cash_head)
                        <option value="{{ $cash_head->id }}"
                            {{ @$selected_head->coa_setup_id == $cash_head->id ? 'selected' : '' }}>
                            {{ $cash_head->head_name . ' - ' . $cash_head->head_code }}
                        </option>
                    @endforeach
                </select>
            </div>
        @endif
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="type" class="form-label"><b>Type <span class="text-danger">*</span></b></label>
            <select name="type" id="type" class="select form-select" required>
                <option value="advance" {{ $data->type == 'advance' ? 'selected' : '' }}>Advance</option>
                <option value="adjust" {{ $data->type == 'adjust' ? 'selected' : '' }}>Adjust</option>
                <option value="payment" {{ $data->type == 'payment' ? 'selected' : '' }}>Invoice
                </option>
            </select>
        </div>
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="balance" class="form-label"><b>Balance</b></label>
            <input type="text" class="form-control" id="balance" name="balance" placeholder="Balance" readonly
                value="{{ $balance }}">
        </div>
        <div class="col-lg-8 col-sm-6">
            <label for="remarks" class="form-label"><b>Remarks</b></label>
            <input type="text" class="form-control" id="remarks" name="remarks" placeholder="Remarks"
                value="{{ $data->remarks }}">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="total_paid" class="form-label"><b>Total Payment</b></label>
            <input type="text" class="form-control" id="total_paid" name="total_paid" readonly
                value="{{ $data->amount }}" placeholder="Total Payment">
        </div>
        <div class="col-12">
            <table class="table table-bordered table-striped align-middle mb-0">
                <thead class="bg-primary text-white">
                    <tr>
                        <th width="60" class="text-center">SL#</th>
                        <th>Lifting No</th>
                        <th>Lifting Amount</th>
                        <th>Previous Payment</th>
                        <th>Current Payment</th>
                        <th>Due Amount</th>
                        <th width="60" class="text-center">
                            <div class="custom-control custom-checkbox w-fit mx-auto ps-3">
                                <input type="checkbox" class="custom-control-input" name="selectAll" checked id="checkAll">
                                <label for="checkAll" class="custom-control-label"></label>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody id="tbody" style="display: {{ $data->type == 'advance' ?? 'none' }};">
                    @include('admin.vendor_payment.partial.table_rows');
                </tbody>
            </table>
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
            });

            $(document).on('change', '#vendor_id', function(e) {
                $('#tbody').html('');
                let vendor_id = $(this).val();
                let type = $('#type').val();
                let url = "{{ Route('admin.vendor-payment.edit', $data->id) }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        vendor_id: vendor_id
                    },
                    success: (response) => {
                        $('#tbody').html(response);
                    }
                });
            });

            $(document).on('change', '#type', function(e) {
                let type = $(this).val();
                if (type == 'invoice' || type == 'adjust') {
                    $('#tbody').show();
                } else {
                    $('#tbody').hide();
                }
            });

            $(document).on('change', '#payment_type', function(e) {
                let type = $(this).val();
                $('#coa_setup_id option').remove();
                let url = "{{ Route('admin.vendor-payment.edit', $data->id) }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        type: type,
                        get_heads: true,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#coa_setup_id').append(
                                '<option value="">Select Account Head</option>');
                            if (response.cash_heads.length > 0) {
                                response.cash_heads.forEach(function(item, index) {
                                    var option =
                                        `<option value="${item.id}">${item.head_name} - ${item.head_code}</option>`;
                                    $('#coa_setup_id').append(option);
                                });
                            }
                            $('.select').select2({
                                allowClear: true,
                            });
                        }
                    }
                });
            });

            $(document).on('wheel keyup change', '.curr_payment', function(e) {
                var collection = +$(this).val();
                var max = +$(this).attr('max');
                if (collection > max) {
                    collection = max;
                    $(this).val(max);
                }
                if (collection > 0) {
                    $(this).closest('tr').find('.multi_checkbox').prop('checked', true);
                } else {
                    $(this).closest('tr').find('.multi_checkbox').prop('checked', false);
                }

                var due = +$(this).closest('tr').find('.due_amount').val();
                var exact_due = due - collection;
                $(this).closest('tr').find('.due').text(exact_due);

                collecton_amount = 0;
                $('.curr_payment').each(function(index, value) {
                    collecton_amount += +$(value).val();
                });
                $('#total_paid').val(collecton_amount);
            });

            $(document).on('change', '#checkAll', function(e) {
                if ($(this).is(':checked')) {
                    collecton_amount = 0;
                    $('.curr_payment').each(function(index, value) {
                        var due_node = $('.due_amount')[index];
                        var due = $(due_node).val();
                        var due_span = $('.due')[index];
                        $(due_span).text(0);
                        var collection_node = $('.curr_payment')[index];
                        $(collection_node).val(due);
                        collecton_amount += parseFloat(due);
                    });
                    $('.multi_checkbox').prop('checked', true);
                    $('#total_paid').val(collecton_amount);
                } else {
                    $('.curr_payment').each(function(index, value) {
                        var due_node = $('.due_amount')[index];
                        var collection_node = $('.curr_payment')[index];
                        var due = $(collection_node).val(0);
                        var due_span = $('.due')[index];
                        $(due_span).text($(due_node).val());
                        $('#total_paid').val(0);
                    });
                    $('.multi_checkbox').prop('checked', false);
                }
            });

            $(document).on('change', '.multi_checkbox', function(e) {
                var id = $(this).val();
                if ($(this).is(':checked')) {
                    var due_amount = $('#due_amount' + id).val();
                    $('#due_amount_span' + id).text(0);
                    var curr_payment = $('#curr_payment' + id).val(due_amount);
                } else {
                    var due_amount = $('#due_amount' + id).val();
                    $('#due_amount_span' + id).text(due_amount);
                    var curr_payment = $('#curr_payment' + id).val(0);
                }

                collecton_amount = 0;
                $('.curr_payment').each(function(index, value) {
                    collecton_amount += +$(value).val();
                });
                $('#total_paid').val(collecton_amount);
            });

            $('#total_paid').keypress(function(e) {
                var keycode = (e.keyCode ? e.keyCode : e.which);
                if (keycode == '13') {
                    e.preventDefault();
                    let totalAmount = +$(e.target).val();
                    let ballance = +$('#balance').val();
                    if ($('#type').val() == 'adjust' && totalAmount > ballance) {
                        swal({
                            title: "<small class='text-danger'>Error!</small>",
                            type: "error",
                            text: 'Payment amount should not be cross Ballance!',
                            timer: 1000,
                            html: true,
                        });
                        return;
                    }

                    if ($('#type').val() == 'payment' && totalAmount > ballance) {
                        $(e.target).val(ballance);
                    }

                    $('.multi_checkbox').each(function() {
                        if (totalAmount > 0) {
                            var id = $(this).val();
                            var due_amount = $('#due_amount' + id).val();
                            if (due_amount > totalAmount) {
                                $('#due_amount_span' + id).text(due_amount - totalAmount);
                                $('#curr_payment' + id).val(totalAmount);
                                totalAmount -= totalAmount;
                            } else {
                                $('#due_amount_span' + id).text(0);
                                $('#curr_payment' + id).val(due_amount);
                                totalAmount -= due_amount;
                            }
                            $(this).prop('checked', true);
                        }
                    });

                    if ($('.multi_checkbox:checked').length == $('.multi_checkbox').length) {
                        $('#checkAll').prop('checked', true);
                    } else {
                        $('#checkAll').prop('checked', false);
                    }
                }
            });
        });
    </script>
@endpush
