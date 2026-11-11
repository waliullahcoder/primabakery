<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <title>{{ !is_null($setting) ? $setting->title : '' }}</title>
    <link rel="shortcut icon"
        href="{{ !is_null($setting) && file_exists($setting->favicon) ? asset($setting->favicon) : asset('frontend/assets/images/logo/favicon.png') }}"
        type="image/x-icon">

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Rock+Salt&display=swap" rel="stylesheet">
    <!-- Font -->

    @include('layouts.frontend.partial.styles')
    <style>
        @media (max-width: 767.99px) {
            .logo img {
                width: 90px !important;
            }
        }
    </style>
    <!-- End Css Links -->
    @include('layouts.admin.partial.alert')
</head>

<body class="{{ Route::is('frontend.home') ? 'home' : '' }}">
    <div id="main-site">
        @include('layouts.frontend.partial.header')
        @yield('content')
        @include('layouts.frontend.partial.footer')
        @include('layouts.frontend.partial.search_form')
    </div>
    @include('layouts.frontend.partial.components')
    @include('layouts.frontend.partial.scripts')
    @include('sweetalert::alert')
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>

    <script script type="text/javascript">
        // mobile navigation active bar handler
        const bannerImage = document.querySelectorAll('.banner-image');
        const navIconList = document.getElementById('nav-icon-list');

        const searchForm = document.getElementById('search-form');
        const closeSearchBtn = document.getElementById('close-search');

        closeSearchBtn.addEventListener('click', function() {
            searchForm.classList.replace("flex", "hidden")
        });

        $(document).ready(function() {
            $(document).on('click', '.nav-toggler', function() {
                $('#mobile-menu').toggleClass('show');
            });

            $(document).on('click', '.search-btn', function() {
                if ($('#search-form').hasClass('flex')) {
                    $('#search-form').removeClass('flex');
                    $('#search-form').addClass('hidden');
                } else {
                    $('#search-form').removeClass('hidden');
                    $('#search-form').addClass('flex');
                    $('#mobile-menu').removeClass('show');
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.add-to-cart', function(e) {
                e.preventDefault();
                let product_id = $(this).data('id');
                let qty = $('.cart_qty').length ? $('.cart_qty').val() : 1;
                let url = "{{ Route('customer.add-cart') }}";
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: {
                        product_id: product_id,
                        quantity: qty,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('.cart_count').html(response.total_cart_items);
                            $('.total_cart_price').html(response.total_cart_price);
                            Swal.fire({
                                width: "22rem",
                                text: 'Product Added into Cart Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'quantity_updated') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Quantity Updated!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'error') {
                            Swal.fire({
                                width: "22rem",
                                text: response.data,
                                icon: "error",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    }
                });
            });

            $(document).on('click', '.cart_item_remove', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.remove-cart') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Removed Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            $('#cart_item_' + id).remove();
                            $('#page_cart_item_' + id).remove();
                            $('.cart_count').text(response.total_cart_items);
                            $('.total_cart_price').html(response.total_cart_price);
                            $('.cart_total').html(response.total_cart_price);
                            if ($('#charge').length && response.total_cart_price > 0) {
                                var charge = parseFloat($('#charge').text());
                                $('.total_with_charge').html(response.total_cart_price +
                                    charge);
                            } else if ($('#charge').length) {
                                $('#charge').text('0.00');
                                $('.total_with_charge').html('0.00');
                            }
                            if (response.total_cart_items == 0) {
                                $('#cart-footer-area').hide();
                                $('#cart_items').html('');
                                $('.cart_count').text('0');
                                $('#cart_items').append(
                                    '<li class="no-items" id="no_items">No products in the cart</li>'
                                );
                            }
                        }
                    }
                });
            });

            $(document).on('click', '.qty-plus', function(e) {
                var getInput = $(this).closest('.cart_action_wrapper').find('.cart_qty').val();
                getInput++;
                $(this).closest('.cart_action_wrapper').find('.cart_qty').val(getInput);
            });

            $(document).on('click', '.qty-minus', function(e) {
                var getInput = $(this).closest('.cart_action_wrapper').find('.cart_qty').val();
                if (parseInt(getInput) > 1) {
                    getInput--;
                }
                $(this).closest('.cart_action_wrapper').find('.cart_qty').val(getInput);
            });

            $(document).on('click', '.addToWishlist', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.wishlist') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Added Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'error') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Already Added this Product!',
                                icon: "error",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    }
                });
            });
        });
    </script>
    @stack('js')
</body>

</html>
