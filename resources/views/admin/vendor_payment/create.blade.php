@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="vendor_id" class="form-label"><b>Vendor <span class="text-danger">*</span></b></label>
            <select name="vendor_id" id="vendor_id" class="select form-select" data-placeholder="Selct Vendor" required>
                <option value=""></option>
                @foreach ($vendors as $vendor)
                    <option value="{{ $vendor->id }}"
                        {{ old('vendor_id') && old('vendor_id') == $vendor->id ? 'selected' : '' }}>{{ $vendor->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="payment_no" class="form-label"><b>Payment No <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control" readonly name="payment_no" id="payment_no" placeholder="Payment No"
                value="{{ $payment_no }}" required>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="payment_date" class="form-label"><b>Payment Date <span class="text-danger">*</span></b></label>
            <input type="text" class="form-control date_picker" id="payment_date" name="payment_date"
                value="{{ date('d-m-Y', strtotime(old('payment_date'))) }}" placeholder="Payment Date" required>
        </div>
        @php
            $adminSettings = \App\Models\AdminSetting::first();
        @endphp
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="payment_type" class="form-label"><b>Payment Type <span class="text-danger">*</span></b></label>
            <select name="payment_type" id="payment_type" class="select form-select" required>
                <option value="Cash" {{ old('payment_type') && old('payment_type') == 'Cash' ? 'selected' : '' }}>Cash
                </option>
                <option value="Bank" {{ old('payment_type') && old('payment_type') == 'Bank' ? 'selected' : '' }}>Bank
                </option>
            </select>
        </div>
        @if ($adminSettings->accounting == 1)
            <div class="col-lg-3 col-sm-6">
                <label for="coa_setup_id" class="form-label"><b>Account Heads <span class="text-danger">*</span></b></label>
                <select name="coa_setup_id" id="coa_setup_id" class="select form-select"
                    data-placeholder="Select Account Head" required>
                    <option value="">Select Account Head</option>
                    @foreach ($cash_heads as $cash_head)
                        <option value="{{ $cash_head->id }}">{{ $cash_head->head_name . ' - ' . $cash_head->head_code }}
                        </option>
                    @endforeach
                </select>
            </div>
        @endif
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="type" class="form-label"><b>Type <span class="text-danger">*</span></b></label>
            <select name="type" id="type" class="select form-select" required>
                <option value="advance" {{ old('type') && old('type') == 'advance' ? 'selected' : '' }}>Advance</option>
                <option value="adjust" {{ old('type') && old('type') == 'adjust' ? 'selected' : '' }}>Adjust</option>
                <option value="payment" {{ old('type') && old('type') == 'payment' ? 'selected' : '' }}>Invoice</option>
            </select>
        </div>
        <div class="{{ $adminSettings->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-sm-6">
            <label for="balance" class="form-label"><b>Balance</b></label>
            <input type="text" class="form-control" id="balance" name="balance" placeholder="Balance" readonly
                value="{{ old('balance') ? old('balance') : 0 }}">
        </div>
        <div class="col-lg-8 col-sm-6">
            <label for="remarks" class="form-label"><b>Remarks</b></label>
            <input type="text" class="form-control" id="remarks" name="remarks" placeholder="Remarks">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="total_paid" class="form-label"><b>Total Payment</b></label>
            <input type="text" class="form-control" id="total_paid" name="total_paid" value="0"
                placeholder="Total Payment">
        </div>
        <div class="col-12">
            <table class="table table-bordered table-striped align-middle mb-0">
                <thead class="bg-primary text-white">
                    <tr>
                        <th width="60" class="text-center py-1">SL#</th>
                        <th class="py-1">Lifting No</th>
                        <th class="py-1">Lifting Amount</th>
                        <th class="py-1">Previous Payment</th>
                        <th class="py-1">Current Payment</th>
                        <th class="py-1">Due Amount</th>
                        <th width="60" class="text-center py-1">
                            <div class="custom-control custom-checkbox w-fit mx-auto">
                                <input type="checkbox" class="custom-control-input" name="selectAll" id="checkAll">
                                <label for="checkAll" class="custom-control-label"></label>
                            </div>
                        </th>
                    </tr>
                </thead>
                <tbody id="tbody" style="display: none;">
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
            }).datepicker('setDate', 'today');

            $(document).on('change', '#vendor_id', function(e) {
                $('#tbody').html('');
                let vendor_id = $(this).val();
                let type = $('#type').val();
                let url = "{{ Route('admin.vendor-payment.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        vendor_id: vendor_id
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#balance').val((response.balance).toFixed(2));
                            var i = 1;
                            if (response.liftings.length > 0) {
                                response.liftings.forEach(function(item, index) {
                                    var tr = `
                                        <tr>
                                            <td width="60" class="text-center"><b>${i++}</b></td>
                                            <td>${item.lifting_no}</td>
                                            <td>
                                                ${item.payable_amount}
                                                <input type="hidden" class="total_amount" name="total_amount[${item.id}]" value="${item.payable_amount}">
                                            </td>
                                            <td>
                                                ${+item.total_paid + +item.return_amount}
                                                <input type="hidden" class="prev_collection" id="prev_collection${item.id}" name="prev_collection[${item.id}]" value="${+item.total_paid + +item.return_amount}">
                                            </td>
                                            <td>
                                                <input type="number" step=".01" value="0" id="curr_payment${item.id}" name="curr_payment[${item.id}]" class="form-control py-1 curr_payment" max="${(+item.payable_amount - +item.total_paid - +item.return_amount).toFixed(2)}">
                                            </td>
                                            <td>
                                                <span class="due" id="due_amount_span${item.id}">${(+item.payable_amount - +item.total_paid - +item.return_amount).toFixed(2)}</span>
                                                <input type="hidden" class="due_amount" id="due_amount${item.id}" name="due[${item.id}]" value="${(+item.payable_amount - +item.total_paid - +item.return_amount).toFixed(2)}">
                                            </td>
                                            <td width="60" class="text-center">
                                                <div class="custom-control custom-checkbox w-fit mx-auto">
                                                    <input type="checkbox" class="custom-control-input multi_checkbox" name="lifting_id[]"
                                                        value="${item.id}" id="${item.id}">
                                                    <label for="${item.id}" class="custom-control-label"></label>
                                                </div>
                                            </td>
                                        </tr>`;
                                    $('#tbody').append(tr);
                                });
                            }
                            if (type == 'payment' || type == 'adjust') {
                                $('#tbody').show();
                            } else {
                                $('#tbody').hide();
                            }
                        }
                    }
                });
            });

            $(document).on('change', '#type', function(e) {
                let type = $(this).val();
                if (type == 'payment' || type == 'adjust') {
                    $('#tbody').show();
                } else {
                    $('#tbody').hide();
                }
            });

            $(document).on('change', '#payment_type', function(e) {
                let type = $(this).val();
                $('#coa_setup_id option').remove();
                let url = "{{ Route('admin.vendor-payment.create') }}";
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

                var total_amount = +$(this).closest('tr').find('.total_amount').val();
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
