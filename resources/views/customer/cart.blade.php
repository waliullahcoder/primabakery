@extends('layouts.frontend.app')
@section('content')
    <section class="lg:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid md:gap-12 gap-8 grid-cols-12">
                <div class="lg:col-span-8 col-span-12">
                    <div class="mb-5">
                        <h3 class="mb-0 font-semibold text-red-500 uppercase">SHOPPING CARTs</h3>
                        <span class="inline-block h-[2px] bg-red-400 w-[100px]"></span>
                    </div>
                    <div class="cart-overview">
                        <div class="relative overflow-x-auto">
                            @php
                                $cart_total_price = 0;
                            @endphp
                            @if (is_null($cart) || count($cart) == 0)
                                <h4 class="mb-5 text-gray-600 text-base font-semibold">No products in the cart</h4>
                            @else
                                <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                    <thead
                                        class="text-xs text-gray-100 uppercase bg-cyan-50 dark:bg-cyan-700 dark:text-gray-100">
                                        <tr>
                                            <th scope="col" width="60" class="px-3 py-3">SL#</th>
                                            <th scope="col" class="px-6 py-3">Image</th>
                                            <th scope="col" class="px-6 py-3 whitespace-nowrap">Product Name</th>
                                            <th scope="col" class="px-6 py-3">price</th>
                                            <th scope="col" class="px-6 py-3">Qty</th>
                                            <th scope="col" class="px-6 py-3">Total</th>
                                            <th scope="col" class="px-6 py-3">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($cart as $key => $item)
                                            @php
                                                $cart_total_price += $item['price'] * $item['qty'];
                                            @endphp
                                            <tr id="cart_item_{{ $key }}">
                                                <th width="60" class="px-3 py-2">{{ $loop->iteration }}</th>
                                                <td class="px-6 py-2">
                                                    <img class="h-[60px] max-w-none"
                                                        src="{{ file_exists($item['image']) ? asset($item['image']) : asset('frontend/assets/images/default/no_image2.png') }}"
                                                        alt="{{ $item['name'] }}">
                                                </td>
                                                <td class="px-6 py-2">
                                                    <div class="text-base">
                                                        <a class="label"
                                                            href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-2">
                                                    <div class="product-line-info product-price whitespace-nowrap">
                                                        <span class="title_price md:hidden">Price</span>
                                                        <span class="value"><span class="font-serif">৳</span>
                                                            {{ $item['price'] }}</span>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-2">
                                                    <div class="qty ms-auto">
                                                        <div class="cart_action_wrapper flex">
                                                            <input type="text" name="qty" value="{{ $item['qty'] }}"
                                                                class="cart_qty block border-2 border-gray-200 focus:border-gray-200 outline-none focus:border-2 text-slate-500 w-full rounded-sm text-base"
                                                                min="1">
                                                            <span
                                                                class="input-group-btn-vertical border-l-transparent border-2 border-gray-200 flex flex-col ml-[-3px]">
                                                                <button class="btn px-2 grow cart_qty-plus" type="button"
                                                                    data-id="{{ $key }}"
                                                                    data-price="{{ $item['price'] }}">
                                                                    <i class="fas fa-plus"></i>
                                                                </button>
                                                                <button class="btn px-2 grow cart_qty-minus" type="button"
                                                                    data-id="{{ $key }}"
                                                                    data-price="{{ $item['price'] }}">
                                                                    <i class="fas fa-minus"></i>
                                                                </button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-2">
                                                    <div class="price">
                                                        <div class="product-price total whitespace-nowrap">
                                                            <span class="font-serif">৳</span>
                                                            <span
                                                                class="subtotal">{{ $item['price'] * $item['qty'] }}</span>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-2 text-center">
                                                    <a class="remove-from-cart cart_item_remove text-red-600"
                                                        data-id="{{ $key }}" rel="nofollow" href="#">
                                                        <i class="fas fa-trash-alt" aria-hidden="true"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            @endif
                        </div>
                        <div class="pt-8 mb-3">
                            <a class="inline-block bg-red-400 text-white rounded px-8 py-3 hover:bg-cyan-500 transition-all duration-300 uppercase me-2 mb-2"
                                href="{{ Route('frontend.home') }}">
                                Continue shopping
                            </a>
                            <a href="{{ Route('customer.checkout') }}"
                                class="inline-block bg-red-400 text-white rounded px-8 py-3 hover:bg-cyan-500 transition-all duration-300 uppercase me-2">Checkout</a>
                        </div>
                    </div>
                </div>
                <div class="lg:col-span-4 col-span-12">
                    <div class="border p-5">
                        <div class="cart-detailed-totals">
                            <div class="pb-3 border-b uppercase mb-4 font-medium text-gray-700 text-sm">
                                <div class="summary-label">There are
                                    {{ !is_null($cart) > 0 ? count($cart) : '0' }} items in your cart</div>
                            </div>
                            <div class="group-price">
                                <div class="flex justify-between mb-3" id="cart-subtotal-products">
                                    <span class="label text-sm text-gray-700">
                                        Total products:
                                    </span>
                                    <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span> <span
                                            class="total_cart_price">{{ number_format($cart_total_price, 2) }}</span></span>
                                </div>
                                <div class="flex justify-between mb-3" id="cart-subtotal-shipping">
                                    <span class="label text-sm text-gray-700">
                                        Total Shipping:
                                    </span>
                                    <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span>
                                        0.00</span>
                                </div>
                                <div class="flex justify-between mb-3">
                                    <span class="label text-sm text-gray-700">Taxes:</span>
                                    <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span>
                                        0.00</span>
                                </div>
                            </div>
                            <div class="flex justify-between cart-total pt-3 mt-3 border-t">
                                <span>
                                    <span class="label text-sm text-gray-700 uppercase font-bold">Total</span>
                                    <span class="text-sm">(tax excl.)</span>
                                </span>
                                <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span>
                                    <span class="cart_total">{{ number_format($cart_total_price, 2) }}</span></span>
                            </div>
                        </div>
                        <div class="checkout cart-detailed-actions">
                            <div class="pt-4">
                                <a href="{{ Route('customer.checkout') }}"
                                    class="btn btn-primary text-center block font-semibold">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Cart Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.cart_qty-plus', function(e) {
                e.preventDefault();
                var product_id = $(this).data('id');
                var price = parseFloat($(this).data('price'));

                var getInput = $(this).closest('.cart_action_wrapper').find('.cart_qty').val();
                getInput++;

                $(this).closest('.cart_action_wrapper').find('.cart_qty').val(getInput);
                $(this).closest('tr').find('.subtotal').text(getInput * price);
                let url = "{{ Route('customer.update-cart') }}";
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: {
                        product_id: product_id,
                        quantity: getInput,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('.cart_count').html(response.total_cart_items);
                            $('.total_cart_price').html(response.total_cart_price);
                            $('.cart_total').html(response.total_cart_price);
                        }
                    }
                });
            });

            $(document).on('click', '.cart_qty-minus', function(e) {
                e.preventDefault();
                var product_id = $(this).data('id');
                var price = parseFloat($(this).data('price'));

                var getInput = $(this).closest('.cart_action_wrapper').find('.cart_qty').val();
                if (parseInt(getInput) > 1) {
                    getInput--;
                    $(this).closest('.cart_action_wrapper').find('.cart_qty').val(getInput);
                    $(this).closest('tr').find('.subtotal').text(getInput * price);
                    let url = "{{ Route('customer.update-cart') }}";
                    $.ajax({
                        type: 'POST',
                        url: url,
                        data: {
                            product_id: product_id,
                            quantity: getInput,
                        },
                        success: (response) => {
                            if (response.status == 'success') {
                                $('.cart_count').html(response.total_cart_items);
                                $('.total_cart_price').html(response.total_cart_price);
                                $('.cart_total').html(response.total_cart_price);
                            }
                        }
                    });
                }
            });
        });
    </script>
@endpush
