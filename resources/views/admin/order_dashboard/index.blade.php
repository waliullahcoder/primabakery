@extends('layouts.admin.app')
@section('content')
    @php
        $currentRouteName = \Request::route()->getName();
        $link = Route($currentRouteName);
    @endphp
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="row g-3">
                <div class="col-md-4">
                    <div class="info-box bg-info">
                        <div class="info-area">
                            <span class="box-amount">{{ number_format($total_orders) }}</span>
                            <span class="box-text mt-4">Total Orders</span>
                        </div>
                        <div class="icon-area"><i class="fal fa-cubes"></i></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-success">
                        <div class="info-area">
                            <span class="box-amount">{{ number_format($success_orders) }}</span>
                            <span class="box-text mt-4">Success Orders</span>
                        </div>
                        <div class="icon-area"><i class="fal fa-box-check"></i></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="info-box bg-danger">
                        <div class="info-area">
                            @php
                                if ($success_orders == 0) {
                                    $ratio = 0;
                                } else {
                                    $ratio = ($success_orders / $total_orders) * 100;
                                }
                            @endphp
                            <span class="box-amount">{{ number_format($ratio, 2, '.', '') }} %</span>
                            <span class="box-text mt-4">Success Ratio</span>
                        </div>
                        <div class="icon-area"><i class="fal fa-badge-percent"></i></div>
                    </div>
                </div>
                <div class="col-12">
                    <div class="card" style="min-height: 630px;">
                        <div class="card-body p-2">
                            <table class="dataTable table align-middle" style="width:100%">
                                <thead>
                                    <tr class="text-nowrap">
                                        <th width="3">SL#</th>
                                        <th>Order Date</th>
                                        <th>Order ID</th>
                                        <th>Customer Name</th>
                                        <th>Customer Phone</th>
                                        <th>Address</th>
                                        <th>Amount</th>
                                        <th width="110" class="text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card" style="min-height: 750px;">
                <div class="card-header">
                    <h5 class="h6 mb-0 text-uppercase">Popular Items</h5>
                </div>
                <div class="card-body p-2">
                    <table class="table align-middle mb-0">
                        <thead class="bg-primary">
                            <tr>
                                <th class="text-center text-white">SL#</th>
                                <th class="text-white">Product Name</th>
                                <th class="text-white">Code</th>
                                <th class="text-white text-end">Sold</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($ranked_products as $item)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $item->product->name }}</td>
                                    <td>{{ $item->product->code }}</td>
                                    <td class="text-end">{{ $item->total_qty }} {{ $item->product->attribute->name }}</td>
                                </tr>
                            @endforeach
                        </tbody>
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
                        data.type = $('#filter').val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: false,
                        searchable: false,
                        className: "text-center",
                        width: '40',
                    },
                    {
                        data: 'order_date',
                        name: 'order_date',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'order_code',
                        name: 'order_code'
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
                        data: 'address.address',
                        name: 'address.address',
                    },
                    {
                        data: 'total',
                        name: 'total',
                    },
                    {
                        data: 'action',
                        name: 'action',
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
        });
    </script>
@endpush
