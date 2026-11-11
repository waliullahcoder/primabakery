@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="{{ @$admin_setting->accounting == 1 ? 'col-lg-2' : 'col-lg-3' }} col-md-3 col-sm-6">
            <label for="date" class="form-label"><b>Date</b></label>
            <input type="text" class="form-control date_picker" id="date" name="date"
                value="{{ date('d-m-Y', strtotime(old('date'))) }}" placeholder="Date">
        </div>
        @if (@$admin_setting->accounting == 1)
            <div class="col-lg-3 col-sm-6">
                <label for="coa_setup_id" class="form-label"><b>Account Heads</b></label>
                <select name="coa_setup_id" id="coa_setup_id" class="select form-select"
                    data-placeholder="Select Account Head" required>
                    <option value="">Select Account Head</option>
                    @foreach ($cash_heads as $cash_head)
                        <option value="{{ $cash_head->id }}" {{ old('coa_setup_id') == $cash_head->id ? 'selected' : '' }}>
                            {{ $cash_head->head_name . ' - ' . $cash_head->head_code }}
                        </option>
                    @endforeach
                </select>
            </div>
        @endif
        <div class="{{ @$admin_setting->accounting == 1 ? 'col-lg-3' : 'col-lg-4' }} col-md-4 col-sm-6">
            <label for="client_id" class="form-label"><b>Clients</b></label>
            <select name="client_id" id="client_id" class="select form-select" data-placeholder="Select Client">
                <option value=""></option>
                @foreach ($clients as $client)
                    <option value="{{ $client->id }}">
                        {{ $client->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="{{ @$admin_setting->accounting == 1 ? 'col-lg-2' : 'col-lg-3' }} col-md-3 col-sm-6">
            <label for="sales_id" class="form-label"><b>Invoice</b></label>
            <select name="sales_id" id="sales_id" class="select form-select" data-placeholder="Select Invoice">
                <option value=""></option>
            </select>
        </div>
        <div class="col-md-2 col-sm-6">
            <label class="form-label text-white d-block"><b>Add Invoice</b></label>
            <button type="button" class="btn btn-xs btn-primary w-100 py-2 text-uppercase" id="add_btn">Add
                Invoice</button>
        </div>
        <div class="col-12">
            <div class="table-responsive">
                <table class="table table-bordered table-striped target-table align-middle mb-0" id="wTable">
                    <thead class="bg-primary border-primary text-white text-nowrap">
                        <tr>
                            <th class="py-5px text-center">SL#</th>
                            <th class="py-5px">Client</th>
                            <th class="py-5px">Invoice No</th>
                            <th class="py-5px">Money Receipt</th>
                            <th class="py-5px text-center">Invoice Amount</th>
                            <th class="py-5px text-center">Previous Payment</th>
                            <th class="py-5px text-center">Payment Amount</th>
                            <th class="py-5px text-end" width="100">
                                <div class="custom-control custom-checkbox w-fit mx-auto">
                                    <input type="checkbox" class="custom-control-input" name="selectAll" id="checkAll">
                                    <label for="checkAll" class="custom-control-label"></label>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        @foreach ($sales as $item)
                            <tr>
                                <th class="text-center">{{ $loop->iteration }}</th>
                                <td>{{ $item->client->name }}</td>
                                <td>{{ $item->invoice }}</td>
                                <td><input type="text" name="money_receipt[{{ $item->id }}]"
                                        placeholder="Money Receipt">
                                </td>
                                <td class="text-center">
                                    <input type="hidden" name="client_id[{{ $item->id }}]"
                                        value="{{ $item->client_id }}">
                                    <input type="number" step="any" class="text-center invoice_amount" readonly
                                        name="invoice_amount[{{ $item->id }}]"
                                        value="{{ $item->total_amount - $item->discount - $item->total_paid }}">
                                </td>
                                <td class="text-center">
                                    <input type="hidden" class="discount" name="discount[{{ $item->id }}]"
                                        value="{{ $item->discount }}">
                                    <input type="number" step="any" class="text-center previous_paid" readonly
                                        name="previous_paid[{{ $item->id }}]" value="{{ $item->total_paid }}">
                                </td>
                                <td class="text-center">
                                    <input type="number" step="any" name="paid_amount[{{ $item->id }}]"
                                        class="text-center paid_amount"
                                        max="{{ $item->total_amount - $item->discount - $item->total_paid }}"
                                        placeholder="Payment Amount">
                                </td>
                                <td>
                                    <div class="custom-control custom-checkbox w-fit mx-auto">
                                        <input type="checkbox" class="custom-control-input multi_checkbox sales_id"
                                            name="sales_id[]" value="{{ $item->id }}" id="{{ $item->id }}">
                                        <label for="{{ $item->id }}" class="custom-control-label"></label>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr class="bg-primary">
                            <th class="py-5px text-white border-primary text-end" colspan="4">Total Summary</th>
                            <th class="py-5px text-white border-primary text-center"><span
                                    id="total_amount">{{ $total_amount }}</span></th>
                            <th class="py-5px text-white border-primary text-center"></th>
                            <th class="py-5px text-white border-primary text-center"><span id="total_collection">0</span>
                            </th>
                            <th class="py-5px text-white border-primary text-center"></th>
                        </tr>
                    </tfoot>
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

            $(document).on('change', '#client_id', function(e) {
                e.preventDefault();
                let url = "{{ Route('admin.bulk-collection.create') }}";
                let client_id = $('#client_id').val();
                $('#sales_id option').remove();

                let sales_id = [];
                $(".sales_id").each(function() {
                    sales_id.push($(this).val());
                });

                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        client_id: client_id,
                        sales_id: sales_id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            if (response.sales.length > 0) {
                                $('#sales_id').append('<option value=""></option>');
                                response.sales.forEach(function(item, index) {
                                    var opton =
                                        `<option value="${item.id}">${item.invoice}</option>`;
                                    $('#sales_id').append(opton);
                                });
                            }
                        }
                    }
                });
            });

            $(document).on('click', '#add_btn', function(e) {
                e.preventDefault();
                let url = "{{ Route('admin.bulk-collection.create') }}";
                let sales_id = $('#sales_id').val();
                if (sales_id == '') {
                    Swal.fire({
                        width: "22rem",
                        text: "Please select an Invoice!",
                        icon: "error",
                        toast: true,
                        position: 'top-right',
                        showConfirmButton: false,
                        timer: 1500
                    });
                    return false;
                }

                if ($('#tr_' + sales_id).length > 0) {
                    Swal.fire({
                        width: "22rem",
                        text: "Invoice already Exists!",
                        icon: "error",
                        toast: true,
                        position: 'top-right',
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
                        sales_id: sales_id,
                        get_sales: true,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var index = $('#tbody tr').length;
                            var tr =
                                `<tr id="tr_${response.sales.id}">
                                <th class="text-center">${(index+1)}</th>
                                <td>${response.client.name}</td>
                                <td>${response.sales.invoice}</td>
                                <td><input type="text" name="money_receipt[${response.sales.id}]" placeholder="Money Receipt"></td>
                                <td class="text-center">
                                    <input type="hidden" name="client_id[${response.sales.id}]" value="${response.sales.client_id}">
                                    <input type="number" step="any" class="text-center invoice_amount" readonly name="invoice_amount[${response.sales.id}]" value="${response.sales.total_amount-response.sales.discount-response.sales.total_paid}">
                                </td>
                                <td class="text-center">
                                    <input type="hidden" class="discount" name="discount[${response.sales.id}]" value="${response.sales.discount}">
                                    <input type="number" step="any" class="text-center previous_paid" readonly name="previous_paid[${response.sales.id}]" value="${response.sales.total_paid}">
                                </td>
                                <td class="text-center"><input type="number" step="any" name="paid_amount[${response.sales.id}]" class="text-center paid_amount" max="${response.sales.total_amount-response.sales.discount-response.sales.total_paid}" placeholder="Payment Amount"></td>
                                <td>
                                    <div class="custom-control custom-checkbox w-fit mx-auto">
                                        <input type="checkbox" class="custom-control-input multi_checkbox sales_id" name="sales_id[]" value="${response.sales.id}" id="${response.sales.id}">
                                        <label for="${response.sales.id}" class="custom-control-label"></label>
                                    </div>
                                </td>
                            </tr>`;
                            $('#tbody').append(tr);
                            $('#sales_id option[value=' + sales_id + ']').remove();
                        }
                    }
                });
            });

            $(document).on('change', '#date', function(e) {
                e.preventDefault();
                let url = "{{ Route('admin.bulk-collection.create') }}";
                let date = $('#date').val();

                $('.multi_checkbox:not(:checked)').closest('tr').remove();
                var checked_ids = [];
                $('.multi_checkbox:checked').each(function(i) {
                    checked_ids.push($(this).val());
                });

                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        date: date,
                        checked_ids: checked_ids,
                        get_datewise_sales: true,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var total_amount = 0;
                            if (response.sales.length > 0) {
                                response.sales.forEach(function(item, index) {
                                    var tr =
                                        `<tr id="tr_${item.id}">
                                            <th class="text-center">${(index+1)}</th>
                                            <td>${item.client.name}</td>
                                            <td>${item.invoice}</td>
                                            <td><input type="text" name="money_receipt[${item.id}]" placeholder="Money Receipt"></td>
                                            <td class="text-center">
                                                <input type="hidden" name="client_id[${item.id}]" value="${item.client_id}">
                                                <input type="number" step="any" class="text-center invoice_amount" readonly name="invoice_amount[${item.id}]" value="${item.total_amount-item.discount-item.total_paid}">
                                            </td>
                                            <td class="text-center">
                                                <input type="hidden" class="discount" name="discount[${item.id}]" value="${item.discount}">
                                                <input type="number" step="any" class="text-center previous_paid" readonly name="previous_paid[${item.id}]" value="${item.total_paid}">
                                            </td>
                                            <td class="text-center"><input type="number" step="any" name="paid_amount[${item.id}]" class="text-center paid_amount" max="${item.total_amount-item.discount-item.total_paid}" placeholder="Payment Amount"></td>
                                            <td>
                                                <div class="custom-control custom-checkbox w-fit mx-auto">
                                                    <input type="checkbox" class="custom-control-input multi_checkbox sales_id" name="sales_id[]" value="${item.id}" id="${item.id}">
                                                    <label for="${item.id}" class="custom-control-label"></label>
                                                </div>
                                            </td>
                                        </tr>`;
                                    $('#tbody').append(tr);
                                    total_amount += parseFloat(item.total_amount - item
                                        .discount - item.total_paid);
                                });
                            }
                            $('#total_amount').text(total_amount);
                            $('#total_collection').text(0);
                        }
                    }
                });
            });

            function calcAmount() {
                var collecton_amount = 0;
                $('.multi_checkbox:checked').each(function(index, value) {
                    var paid = $(this).closest('tr').find('.paid_amount').val();
                    collecton_amount += parseFloat(paid);
                });
                $('#total_collection').text(collecton_amount);
            }

            $(document).on('change', '.multi_checkbox', function(e) {
                if ($(this).is(':checked')) {
                    var amount = $(this).closest('tr').find('.invoice_amount').val();
                    var previous_paid = $(this).closest('tr').find('.previous_paid').val();
                    var discount = $(this).closest('tr').find('.discount').val();
                    $(this).closest('tr').find('.paid_amount').val(parseFloat(amount) - parseFloat(
                        previous_paid) - parseFloat(discount));
                } else {
                    $(this).closest('tr').find('.paid_amount').val(0);
                }
                calcAmount();
            });

            $(document).on('change', '#checkAll', function(e) {
                if ($(this).is(':checked')) {
                    $('.multi_checkbox').each(function(index, value) {
                        var invoice_amount = parseFloat($($('.invoice_amount')[index]).val()) -
                            parseFloat($($('.previous_paid')[index]).val()); -
                        parseFloat($($('.discount')[index]).val());
                        $($('.paid_amount')[index]).val(invoice_amount);
                    });
                    $('.multi_checkbox').prop('checked', true);
                } else {
                    $('.multi_checkbox').prop('checked', false);
                    $('.paid_amount').val(0);
                }
                calcAmount();
            });
        });
    </script>
@endpush
