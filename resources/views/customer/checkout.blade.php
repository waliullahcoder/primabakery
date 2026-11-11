@extends('layouts.frontend.app')
@section('content')
    <section class="md:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <form action="{{ Route('customer.checkout') }}" method="POST">
                @csrf
                <div class="grid grid-cols-12 md:gap-8 gap-6">
                    <div class="md:col-span-8 col-span-12">
                        <div class="accordion checkout-accordion" id="accordionExample">
                            <div class="accordion-item">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                    <div class="step-title h3">
                                        <span class="step-number">1</span>
                                        <span class="title">Addresses</span>
                                    </div>
                                </button>
                                <div id="collapseTwo" class="accordion-collapse" aria-labelledby="headingTwo"
                                    data-bs-parent="#accordionExample">
                                    <div class="accordion-body p-5 border border-t-0">
                                        <div class="content">
                                            <div class="flex gap-4 mb-3">
                                                <input type="hidden" name="shipping_address_id"
                                                    value="{{ $shipping_address ? $shipping_address->id : '' }}">
                                                <div class="flex items-center gap-2">
                                                    <input class="form-check-input" type="radio" id="home"
                                                        name="address_type"
                                                        {{ ($shipping_address && $shipping_address->address_type == 'home') || is_null($shipping_address) ? 'checked' : '' }}
                                                        value="home">
                                                    <label class="form-check-label text-base text-gray-600 font-semibold"
                                                        for="home">
                                                        Home
                                                    </label>
                                                </div>
                                                <div class="flex items-center gap-2">
                                                    <input class="form-check-input" type="radio" id="office"
                                                        {{ $shipping_address && $shipping_address->address_type == 'office' ? 'checked' : '' }}
                                                        name="address_type" value="office">
                                                    <label class="form-check-label text-base text-gray-600 font-semibold"
                                                        for="office">
                                                        Office
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="flex flex-col gap-4">
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required"
                                                            for="name">Full
                                                            Name</label>
                                                        <div class="md:col-span-8  col-span-8">
                                                            <input type="text" id="name" name="name"
                                                                placeholder="Full Name" class="custom-input"
                                                                value="{{ $shipping_address ? $shipping_address->name : old('name') }}"
                                                                required>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required"
                                                            for="phone">Phone
                                                            Number</label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <input type="number" id="phone" name="phone"
                                                                placeholder="Phone Number" class="custom-input"
                                                                value="{{ $shipping_address ? $shipping_address->phone : old('phone') }}"
                                                                required>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-control-label"
                                                            for="email">Email
                                                            Address</label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <input type="email" id="email" name="email"
                                                                placeholder="Email Address" class="custom-input"
                                                                value="{{ $shipping_address ? $shipping_address->email : old('email') }}">
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                            Optional
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required" required
                                                            for="division">Division</label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <select name="division" id="division"
                                                                class="form-select w-full text-sm select2">
                                                                <option value="">-- Select Division --</option>
                                                                @foreach ($divisions as $division)
                                                                    <option value="{{ $division->id }}"
                                                                        {{ $shipping_address && $shipping_address->division_id == $division->id ? 'selected' : '' }}>
                                                                        {{ $division->name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required" required
                                                            for="district">District </label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <select name="district" id="district"
                                                                class="form-select w-full text-sm select2">
                                                                @if ($selected_district)
                                                                    <option value="{{ $selected_district->id }}" selected>
                                                                        {{ $selected_district->name }}</option>
                                                                @else
                                                                    <option value="">-- Select District --</option>
                                                                @endif
                                                            </select>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required"
                                                            for="upozila">Upozila </label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <select name="upozila" id="upozila" required
                                                                class="form-select w-full text-sm select2">
                                                                @if ($selected_upozila)
                                                                    <option value="{{ $selected_upozila->id }}" selected>
                                                                        {{ $selected_upozila->name }}</option>
                                                                @else
                                                                    <option value="">-- Select Upozila --</option>
                                                                @endif
                                                            </select>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required"
                                                            for="street">Street </label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <textarea name="street" id="street" class="custom-input" cols="30" rows="2" required
                                                                placeholder="Street Address">{{ $shipping_address ? $shipping_address->street : '' }}</textarea>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="w-full">
                                                    <div class="grid gap-3 grid-cols-12 items-center">
                                                        <label class="md:col-span-2 col-span-3 form-label required"
                                                            for="delivery_area">Delivery Area</label>
                                                        <div class="md:col-span-8 col-span-8">
                                                            <select name="delivery_area" id="delivery_area" required
                                                                class="form-select w-full text-sm select2">
                                                                <option value="inside_city">Inside City</option>
                                                                <option value="outside_city">Outside City</option>
                                                            </select>
                                                        </div>
                                                        <div class="md:col-span-2 col-span-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item mt-4">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    <div class="step-title h3">
                                        <span class="step-number">2</span>
                                        <span class="title">Payment</span>
                                    </div>
                                </button>
                                <div id="collapseThree" class="accordion-collapse" aria-labelledby="headingThree"
                                    data-bs-parent="#accordionExample">
                                    <div class="accordion-body p-5 border border-t-0">
                                        <div class="content">
                                            <ul class="payment-methods mb-4">
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <input id="cash" type="radio" name="payment_method"
                                                            class="payment_method" value="Cash on Delivery" checked>
                                                        <span>Cash on Delivery</span>
                                                        <label class="pay_label" for="cash"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="flex flex-wrap gap-2">
                                                            <li><img src="{{ asset('frontend/assets/images/payments/1.png') }}"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="{{ asset('frontend/assets/images/payments/2.png') }}"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="{{ asset('frontend/assets/images/payments/3.png') }}"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="{{ asset('frontend/assets/images/payments/4.png') }}"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                        </ul>
                                                        <input id="card" type="radio" name="payment_method"
                                                            class="payment_method" value="Online Payment">
                                                        <label class="pay_label" for="card"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="flex flex-wrap gap-2">
                                                            <li><img class="h-[40px]"
                                                                    src="{{ asset('frontend/assets/images/payments/bkash.png') }}"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="bkash" type="radio" name="payment_method"
                                                            class="payment_method" value="bkash Payment">
                                                        <label class="pay_label" for="bkash"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="flex flex-wrap gap-2">
                                                            <li><img class="h-[40px]"
                                                                    src="{{ asset('frontend/assets/images/payments/nagad.png') }}"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="nagad" type="radio" name="payment_method"
                                                            class="payment_method" value="Nagad Payment">
                                                        <label class="pay_label" for="nagad"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="flex flex-wrap gap-2">
                                                            <li><img class="h-[40px]"
                                                                    src="{{ asset('frontend/assets/images/payments/rocket.png') }}"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="rocket" type="radio" name="payment_method"
                                                            class="payment_method" value="Rocket Payment">
                                                        <label class="pay_label" for="rocket"></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <h4 class="text-base text-red-600 uppercase font-semibold mb-3">Please check
                                                your order
                                                before payment</h4>
                                            <div class="order-confirmation-table mb-4">
                                                <div class="relative overflow-x-auto">
                                                    @php
                                                        $cart_total_price = 0;
                                                        $inside_charge = 0;
                                                        $outside_charge = 0;
                                                        $delivery_charge = \App\Models\DeliveryCharge::first();
                                                    @endphp
                                                    @if (is_null($cart) || count($cart) == 0)
                                                        <h4 class="mb-5 text-gray-600 text-base font-semibold">No products
                                                            in the cart</h4>
                                                    @else
                                                        <table
                                                            class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                                            <thead
                                                                class="text-xs text-gray-100 uppercase bg-cyan-50 dark:bg-cyan-700 dark:text-gray-100">
                                                                <tr>
                                                                    <th scope="col" width="60" class="px-3 py-3">
                                                                        SL#</th>
                                                                    <th scope="col" class="px-6 py-3">Product Name</th>
                                                                    <th scope="col" class="px-6 py-3">price</th>
                                                                    <th scope="col" class="px-6 py-3">Qty</th>
                                                                    <th scope="col" class="px-6 py-3">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @php
                                                                    $i = 0;
                                                                @endphp
                                                                @foreach ($cart as $key => $item)
                                                                    @php
                                                                        $i++;
                                                                        $cart_total_price += $item['price'] * $item['qty'];
                                                                        $inside_charge += !is_null($delivery_charge) ? $delivery_charge->inside_charge : 0;
                                                                        $outside_charge += !is_null($delivery_charge) ? $delivery_charge->outside_charge : 0;
                                                                    @endphp
                                                                    <tr id="cart_item_{{ $key }}">
                                                                        <th width="60" class="px-3 py-2">
                                                                            {{ $i }}</th>
                                                                        <td class="px-6 py-2">
                                                                            <div class="text-base">
                                                                                <a class="label"
                                                                                    href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                                            </div>
                                                                        </td>
                                                                        <td class="px-6 py-2 text-center">
                                                                            <div class="product-line-info product-price">
                                                                                <span
                                                                                    class="title_price md:hidden">Price</span>
                                                                                <span class="value"><span
                                                                                        class="font-serif">৳</span>
                                                                                    {{ $item['price'] }}</span>
                                                                            </div>
                                                                        </td>
                                                                        <td class="px-6 py-2 text-center">
                                                                            <span>{{ $item['qty'] }}</span>
                                                                        </td>
                                                                        <td class="px-6 py-2 text-center">
                                                                            <a class="remove-from-cart cart_item_remove text-red-600"
                                                                                data-id="{{ $key }}"
                                                                                rel="nofollow" href="#">
                                                                                <i class="fas fa-trash-alt"
                                                                                    aria-hidden="true"></i>
                                                                            </a>
                                                                        </td>
                                                                    </tr>
                                                                @endforeach
                                                            </tbody>
                                                        </table>
                                                    @endif
                                                </div>
                                            </div>
                                            <div class="flex gap-2 items-center mb-4">
                                                <input id="terms_conditions" class="form-check-input"
                                                    name="terms_conditions" required type="checkbox" value="1">
                                                <label class="form-check-label" for="terms_conditions"> I agree to the <a
                                                        class="text-primary" href="#">terms of
                                                        service</a> and will adhere to
                                                    them unconditionally.
                                                </label>
                                            </div>
                                            <button type="submit" class="btn-primary px-5">Check
                                                out</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="md:col-span-4 col-span-12">
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
                                        <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span>
                                            <span
                                                class="total_cart_price">{{ number_format($cart_total_price, 2) }}</span></span>
                                    </div>
                                    <div class="flex justify-between mb-3" id="cart-subtotal-shipping">
                                        <span class="label text-sm text-gray-700">
                                            Total Shipping:
                                        </span>
                                        <input type="hidden" name="inside_charge" id="inside_charge"
                                            value="{{ $inside_charge }}">
                                        <input type="hidden" name="outside_charge" id="outside_charge"
                                            value="{{ $outside_charge }}">
                                        <span class="flex text-sm font-medium"><span class="font-serif me-1">৳ </span>
                                            <span
                                                id="charge">{{ number_format($inside_charge, 2, '.', '') }}</span></span>
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
                                        <span
                                            class="total_with_charge">{{ number_format($cart_total_price + $inside_charge, 2, '.', '') }}</span></span>
                                </div>
                            </div>
                            <div class="checkout cart-detailed-actions">
                                <div class="pt-4">
                                    <button type="submit" class="btn-primary px-5">Check
                                        out</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#division', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.checkout') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_district =
                                "{{ $shipping_address ? $shipping_address->district_id : '' }}";
                            $('#district').html('');
                            $('#upozila').html('');
                            $('#upozila').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $('#district').append(
                                '<option value="" selected>-- Select District --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_district != '' && selected_district ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#district').append(option);
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#district', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.checkout') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_upozila =
                                "{{ $shipping_address ? $shipping_address->upozila_id : '' }}";
                            $('#upozila').html('');
                            $('#upozila').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_upozila != '' && selected_upozila ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#upozila').append(option);
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#delivery_area', function(e) {
                let type = $(this).val();
                var inside_charge = $('#inside_charge').val();
                var outside_charge = $('#outside_charge').val();
                if (type == 'outside_city') {
                    $('#charge').text(outside_charge);
                } else {
                    $('#charge').text(inside_charge);
                }
            });
        });
    </script>
@endpush
