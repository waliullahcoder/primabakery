@extends('layouts.admin.app')
@section('content')
    <div class="row g-4 justify-content-center">
        <div class="col-12">
            <div class="row g-4">
                <div class="col-xl-6">
                    <div class="row g-4">
                        <div class="col-lg-6">
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="info-box bg-info">
                                        <div class="info-area">
                                            <span class="box-amount">{{ $info['clients'] }}</span>
                                            <span class="box-text">Active Clients</span>
                                        </div>
                                        <div class="icon-area"><i class="fad fa-users"></i></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="info-box bg-danger">
                                        <div class="info-area">
                                            <span class="box-amount">৳ {{ $info['outstanding'] }}</span>
                                            <span class="box-text">Outstanding</span>
                                        </div>
                                        <div class="icon-area"><i class="fal fa-money-bill-alt"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row g-4">
                                <div class="col-12">
                                    <div class="info-box bg-success">
                                        <div class="info-area">
                                            <span class="box-amount">৳ {{ $info['stock_value'] }}</span>
                                            <span class="box-text">Stock Value</span>
                                        </div>
                                        <div class="icon-area"><i class="fad fa-chart-pie"></i></div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="info-box" style="background-color: #27254a;">
                                        <div class="info-area">
                                            <span class="box-amount">৳ {{ $info['payment_due'] }}</span>
                                            <span class="box-text">Payment Due</span>
                                        </div>
                                        <div class="icon-area"><i class="fal fa-receipt"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="chart-box">
                                <div class="px-4 pt-3">
                                    <h5 class="m-0 fw-400">Region Sales Chart</h5>
                                    <div>Region Wise Sales Chart</div>
                                </div>
                                <div class="chart-body">
                                    <div id="piechart" style="height: 350px; display: block;"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-6">
                    <div class="chart-box">
                        <div class="px-4 pt-3">
                            <h5 class="m-0 fw-400">Sales Compare Chart</h5>
                            <div>Compare Between Previous Month <span id="chartVersion"></span></div>
                        </div>
                        <div class="chart-body">
                            <div class="chartBox">
                                <canvas id="compareChart" height="650"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12">
            <div class="row g-4">
                <div class="col-12">
                    <div class="chart-box">
                        <div class="px-4 pt-3">
                            <h5 class="m-0 fw-400">Sales & Collection Chart</h5>
                            <div>12 Month Business Chart</div>
                        </div>
                        <div class="chart-body">
                            <div>
                                <canvas id="bar_chart" style="height: 250px; display: block; width: 100%;" width="100%"
                                    height="250" class="chartjs-render-monitor"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.0/chart.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $.ajax({
                type: 'get',
                url: "{{ route('admin.dashboard') }}",
                data: {},
                success: function(response) {
                    if (response.status == 'success') {
                        var barData = {
                            labels: response.month,
                            datasets: [{
                                    label: "Sales",
                                    backgroundColor: '#2ecc71',
                                    data: response.sales_amount
                                },
                                {
                                    label: "Collection",
                                    backgroundColor: '#fb9678',
                                    borderColor: "#fff",
                                    data: response.collection_amount
                                }
                            ]
                        };
                        var barOptions = {
                            responsive: true,
                            maintainAspectRatio: false
                        };
                        var ctx = document.getElementById("bar_chart").getContext("2d");
                        new Chart(ctx, {
                            type: 'bar',
                            data: barData,
                            options: barOptions
                        });

                        // Line Chart
                        const data = {
                            labels: response.two_years_months,
                            datasets: [{
                                    label: '3 Months Sales',
                                    data: response.two_years_sales,
                                    fill: false,
                                    backgroundColor: 'red',
                                    borderColor: 'red',
                                    tension: 0.1,
                                    borderWidth: 2
                                },
                                {
                                    label: '3 Months Collections',
                                    backgroundColor: '#00C292',
                                    data: response.two_years_collections,
                                    fill: false,
                                    borderColor: '#00C292',
                                    tension: 0.1,
                                    borderWidth: 2
                                }
                            ]
                        };

                        // config
                        const config = {
                            type: 'line',
                            data,
                            options: {
                                scales: {
                                    y: {
                                        beginAtZero: true
                                    }
                                },
                                maintainAspectRatio: false // This will fix the height
                            }
                        };

                        // render init block
                        const myChart = new Chart(
                            document.getElementById('compareChart'),
                            config
                        );
                    }
                }
            });

            google.charts.load('current', {
                'packages': ['corechart']
            });
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Region', 'Amount'],
                    @if (!empty($RegionSales) && count($RegionSales) > 0)
                        @foreach ($RegionSales as $Regionsale)
                            ['{{ $Regionsale['name'] }}', {{ $Regionsale['amount'] }}],
                        @endforeach
                    @endif
                ]);
                var options = {
                    // title: 'My Daily Activities',
                    is3D: true,
                    chartArea: {
                        width: 400,
                        height: 300
                    },
                    legend: {
                        position: "none"
                    },
                };
                var chart = new google.visualization.PieChart(document.getElementById('piechart'));
                chart.draw(data, options);
            }
        });
    </script>
@endpush
