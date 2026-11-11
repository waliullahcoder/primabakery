@extends('layouts.admin.app')

@section('content')
    @php
        $currentRouteName = \Request::route()->getName();
        $link = Route($currentRouteName);
    @endphp
    <div class="row g-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header px-3 py-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Order Management</h6>
                        <form action="#" class="flex-shrink-0 d-flex gap-2" method="GET" id="filter_form">
                            <input type="text" class="form-control date-range py-1 px-2" name="date_range"
                                id="date_range" placeholder="{{ __('Select Date Range') }}" data-time-picker="true"
                                data-format="DD-MM-Y" data-separator=" to " autocomplete="off" required
                                value="{{ date('01-m-Y') . ' to ' . date('t-m-Y') }}">
                            <select name="status" id="status" class="form-select custom-select flex-shrink-0"
                                style="width: 150px; padding: 4px 16px;">
                                <option value="">Select Status</option>
                                <option value="Pending">Pending</option>
                                <option value="Confirmed">Confirmed</option>
                                <option value="Processing">Processing</option>
                                <option value="Delivered">Delivered</option>
                                <option value="Successed">Successed</option>
                                <option value="Canceled">Canceled</option>
                            </select>
                            <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <table class="dataTable table align-middle" style="width:100%">
                        <thead>
                            <tr class="text-nowrap">
                                <th width="3"></th>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Customer Name</th>
                                <th>Customer Phone</th>
                                <th>Order Amount</th>
                                <th>Payment Method</th>
                                <th>Order Status</th>
                                <th width="110" class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td class="text-end" colspan="9">
                                    <form action="{{ Route('admin.process-order.export') }}" id="export_form" target="_blank"
                                        style="display: none;">
                                        <button type="submit" class="btn btn-xs btn-primary">Export Processing
                                            List</button>
                                    </form>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                ajax: {
                    url: "{{ $link }}",
                    type: "GET",
                    data: function(data) {
                        data.status = $("#status").val();
                        data.date_range = $("#date_range").val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: "SL.",
                        orderable: false,
                        searchable: false,
                        width: '3'
                    },
                    {
                        data: 'order_code',
                        name: 'order_code'
                    },
                    {
                        data: 'order_date',
                        name: 'order_date',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'user_name',
                        name: 'user_name'
                    },
                    {
                        data: 'user_phone',
                        name: 'user_phone'
                    },
                    {
                        data: 'total',
                        name: 'total'
                    },
                    {
                        data: 'payment_method',
                        name: 'payment_method'
                    },
                    {
                        data: 'order_status',
                        name: 'order_status'
                    },
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                    },
                ],
                "fnDrawCallback": function(oSettings) {
                    const tooltips = document.querySelectorAll('.tt');
                    tooltips.forEach(t => {
                        new bootstrap.Tooltip(t);
                    });
                }
            });

            $(document).on('submit', '#filter_form', function(e) {
                e.preventDefault();
                let status = $('#status').val();
                if (status == 'Processing') {
                    $('#export_form').show();
                } else {
                    $('#export_form').hide();
                }
                $('.dataTable').DataTable().draw();
            });
        });
    </script>
@endpush
