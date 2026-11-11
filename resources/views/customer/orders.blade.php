@extends('layouts.frontend.app')
@section('content')
    <section class="lg:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid md:gap-12 gap-8 grid-cols-12">
                @include('layouts.customer.menu')
                <div class="lg:col-span-8 xl:col-span-9 col-span-12">
                    <div class="dashboard-card">
                        <div class="mb-5">
                            <h3 class="mb-0 font-semibold text-red-500 uppercase">Order history</h3>
                            <span class="inline-block h-[2px] bg-red-400 w-[100px]"></span>
                        </div>
                        <div class="pb-2 font-secondary text-xs">
                            @if (count(Auth::user()->orders) > 0)
                                <div class="relative overflow-x-auto">
                                    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                        <thead
                                            class="text-xs text-gray-100 uppercase bg-cyan-50 dark:bg-cyan-700 dark:text-gray-100">
                                            <tr>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3">Order ID</th>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3">Date</th>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3">Total price</th>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3">Payment</th>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3">Status</th>
                                                <th scope="col" class="px-6 whitespace-nowrap py-3 text-right">Actions
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach (Auth::user()->orders as $key => $order)
                                                <tr>
                                                    <td class="px-6 py-4">{{ $order->order_code }}</td>
                                                    <td class="px-6 py-4">{{ date('d/m/Y', strtotime($order->created_at)) }}
                                                    </td>
                                                    <td class="px-6 py-4">{{ number_format($order->total, 2) }} TK.</td>
                                                    <td class="px-6 py-4">{{ $order->payment_method }}</td>
                                                    <td class="px-6 py-4"><span class="label px-2 inline-block text-center rounded-sm"
                                                            style="padding: 3px 10px 4px; min-width: 88px; background-color:
                                                            {{ $order->status == 'Pending' ? '#4169E1' : '' }}
                                                            {{ $order->status == 'Confirmed' ? '#03a9f3' : '' }}
                                                            {{ $order->status == 'Processing' ? '#FFC107' : '' }}
                                                            {{ $order->status == 'Delivered' ? '#01B8A5' : '' }}
                                                            {{ $order->status == 'Successed' ? '#00c292' : '' }}
                                                            {{ $order->status == 'Canceled' ? '#DC3545' : '' }}
                                                            ; color: #fff;">{{ $order->status }}</span>
                                                    </td>
                                                    <td class="px-6 py-4 text-right">
                                                        <a class="btn btn-xs btn-secondary"
                                                            href="{{ Route('customer.orders', $order->id) }}">View
                                                            Details</a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            @else
                                <article class="text-gray-600 text-base font-semibold" role="alert" data-alert="warning">
                                    <ul>
                                        <li>You have not placed any orders.</li>
                                    </ul>
                                </article>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Address Section -->
@endsection
