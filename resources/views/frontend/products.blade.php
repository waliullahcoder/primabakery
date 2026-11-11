@extends('layouts.frontend.app')

@section('content')
    <main class="w-full flex items-center justify-center flex-col mb-10">
        <div class="container px-4 mx-auto">
            <div class="pb-6 pt-3">
                <ol class="breadcrumb breadcrumb--ys pull-left">
                    <li class="home-link"><a href="{{ Route('frontend.home') }}"><i class="fa-solid fa-house"></i></a></li>
                    @if (isset($category))
                        <li><a href="{{ Route('frontend.products', $category->slug) }}"
                                title="{{ $category->name }}">{{ $category->name }}</a></li>
                    @endif
                </ol>
            </div>
            @if (isset($category))
                <h2
                    class="text-center uppercase lg:text-3xl text-xl text-gray-700 font-medium relative md:mb-16 mb-10 after:content-[''] after:absolute after:left-[50%] after:w-[70px] after:h-[5px] after:bg-[#f1613b] after:translate-x-[-50%] after:bottom-[-20px]">
                    {{ $category->name }}</h2>
            @endif
            <form action="{{ Route('frontend.products') }}" id="filter_form" method="GET">
                <input type="hidden" name="show_more">
                <input type="hidden" name="category_id" value="{{ isset($category) ? $category->id : '' }}">
                <input type="hidden" name="showed" value="{{ count($products) }}">
                <div class="flex gap-x-10 gap-y-3 flex-wrap items-center border-t border-gray-200 pt-5 pb-8">
                    <div class="flex flex-wrap gap-10 items-center">
                        <div class="filters-row__mode">
                            <a class="filters-row__view active link-grid-view btn-img btn-img-view_module"
                                data-view="grid"><span></span></a>
                            <a class="filters-row__view link-row-view btn-img btn-img-view_list"
                                data-view="list"><span></span></a>
                        </div>
                        <div class="flex gap-3 items-center">
                            <label class="font-medium">Sort by: </label>
                            <select class="form-select filter-input py-1 border-gray-200" name="sort">
                                <option value="name-asc">Name Ascending</option>
                                <option value="name-desc">Name Descending</option>
                                <option value="created_at-asc">Date Ascending</option>
                                <option value="created_at-desc">Date Descending</option>
                                <option value="price-asc">Price Ascending</option>
                                <option value="price-desc">Price Descending</option>
                            </select>
                        </div>
                    </div>
                    <div class="flex gap-10 items-center">
                        <div class="sm:block hidden"><span id="total_count">{{ $count }}</span> Item(s)</div>
                        <div class="flex gap-3 items-center">
                            <label>Show: </label>
                            <select class="form-select filter-input py-1 border-gray-200" name="show">
                                <option value="16">16</option>
                                <option value="32">32</option>
                                <option value="all">ALL</option>
                            </select>
                        </div>
                    </div>
                </div>
            </form>
            <div class="product-showcase-container w-full h-auto pb-8 grid grid-cols-2 sm:grid-cols-3 md:grid-cols-4 items-center gap-3 sm:gap-4 md:gap-6"
                id="product_grid">
                @foreach ($products as $key => $product)
                    <div
                        class="product-showcase card card-{{ $key + 1 }} border border-solid border-slate-300 hover:shadow-lg rounded-md hover:scale-125 relative bg-white hover:z-10 h-full">
                        <div class="before:content-[''] before:pt-[100%] before:block relative image-area">
                            <a href="{{ Route('frontend.single-product', $product->slug) }}">
                                <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                    src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                    alt="product">
                            </a>
                        </div>
                        <p class="p-4 font-normal leading-5 text-slate-600 text-center overflow-hidden">
                            <a href="{{ Route('frontend.single-product', $product->slug) }}">
                                {{ $product->name }}
                            </a>
                        </p>
                    </div>
                @endforeach
            </div>
            <div class="text-center">
                <button type="button" id="show_more"
                    class="inline-block bg-red-400 {{ $count > 12 ? ' hover:bg-cyan-500' : 'opacity-30' }} text-white rounded px-8 py-3 transition-all duration-300 uppercase me-2 mb-2"
                    {{ $count <= 12 ? 'disabled' : '' }}>{{ $count <= 12 ? 'No MOre Products' : 'Show More' }}</button>
            </div>
        </div>
    </main>

    <div id="custom-preloader">
        <div class="custom-loader" style="display: none;">
            <img width="32" height="32" alt=""
                src="{{ asset('frontend/assets/images/default/ajax-loader.gif') }}">
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.filters-row__view', function() {
                var view = $(this).data('view');
                $('.filters-row__view').removeClass('active');
                $(this).addClass('active');
                if (view == 'list') {
                    $('#product_grid').removeClass('grid');
                    $('.product-showcase').addClass('list-product').removeClass('hover:scale-125');
                } else {
                    $('#product_grid').addClass('grid');
                    $('.product-showcase').removeClass('list-product').addClass('hover:scale-125');
                }
            });

            $(document).on('change', '.filter-input', function() {
                let url = $('#filter_form').attr('action');
                $('input[name="show_more"]').val('');
                $.ajax({
                    url: url,
                    data: $('#filter_form').serialize(),
                    beforeSend: function() {
                        $(".custom-loader").show();
                    },
                    complete: function() {
                        $(".custom-loader").hide();
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            $('[name="showed"]').val(response.showed);
                            var show_type = $('[name="show"]').val();
                            if (show_type == 'all') {
                                $('#show_more').hide();
                            } else {
                                $('#show_more').show();
                                if (response.count <= response.showed) {
                                    $('#show_more').text('No More Products');
                                    $('#show_more').attr('disabled', true);
                                    $('#show_more').removeClass('hover:bg-cyan-500').addClass(
                                        'opacity-30');
                                } else {
                                    $('#show_more').text('Show More');
                                    $('#show_more').attr('disabled', false);
                                    $('#show_more').addClass('hover:bg-cyan-500').removeClass(
                                        'opacity-30');
                                }
                            }
                            $('#product_grid').html(response.html);
                        }
                    }
                });
            });

            $(document).on('click', '#show_more', function() {
                $('input[name="show_more"]').val(1);
                let url = $('#filter_form').attr('action');
                $.ajax({
                    url: url,
                    data: $('#filter_form').serialize(),
                    beforeSend: function() {
                        $(".custom-loader").show();
                    },
                    complete: function() {
                        $(".custom-loader").hide();
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            $('[name="showed"]').val(response.showed);
                            var show_type = $('[name="show"]').val();
                            if (show_type == 'all') {
                                $('#show_more').hide();
                            } else {
                                $('#show_more').show();
                                if (response.count <= response.showed) {
                                    $('#show_more').text('No More Products');
                                    $('#show_more').attr('disabled', true);
                                    $('#show_more').removeClass('hover:bg-cyan-500').addClass(
                                        'opacity-30');
                                } else {
                                    $('#show_more').text('Show More');
                                    $('#show_more').attr('disabled', false);
                                    $('#show_more').addClass('hover:bg-cyan-500').removeClass(
                                        'opacity-30');
                                }
                            }
                            $('#product_grid').html(response.html);
                        }
                    }
                });

            });
        });
    </script>
@endpush
