@extends('layouts.frontend.app')
@section('content')
    <section class="py-6 overflow-hidden">
        <div class="container px-4 mx-auto">
            <div class="pb-6">
                <ol class="breadcrumb breadcrumb--ys pull-left">
                    <li class="home-link"><a href="{{ Route('frontend.home') }}"><i class="fa-solid fa-house"></i></a></li>
                    @if (!is_null($product->category))
                        <li><a href="{{ Route('frontend.products', $product->category->slug) }}"
                                title="{{ $product->category->name }}">{{ $product->category->name }}</a></li>
                    @endif
                    <li><span>{{ $product->name }}</span></li>
                </ol>
            </div>
            <div class="grid grid-cols-3 gap-4 md:gap-6">
                <div class="md:col-span-1 col-span-3">
                    <div class="pb-3">
                        <div class="zoom flex">
                            <img id="zoomImage" class="zoomImage"
                                src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                alt="{{ $product->name }}" />
                        </div>
                    </div>
                    <div class="product-thumb nam-image owl-theme owl-carousel">
                        <div>
                            <img class="cursor-pointer nav-img"
                                src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                data-image="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                alt="{{ $product->name }}" />
                        </div>
                        @if (!is_null($product->more_images))
                            @php
                                $images = explode('|', $product->more_images);
                            @endphp
                            @foreach ($images as $image)
                                <div>
                                    <img class="cursor-pointer nav-img" src="{{ asset($image) }}"
                                        data-image="{{ asset($image) }}" alt="{{ $product->name }}" />
                                </div>
                            @endforeach
                        @endif
                    </div>
                </div>
                <div class="md:col-span-2 col-span-3">
                    <h2 class="text-3xl mb-3">{{ $product->name }}</h2>
                    @if ($product->on_request == 0 && $stock_qty > $product->alert_quantity)
                        <div class="py-2 mb-3 text-lg font-semibold"><span class="font-bold font-serif text-sm">৳</span>
                            {{ $product->price->online_price }}</div>
                    @endif
                    <div class="text-md">{!! $product->short_description !!}</div>
                    <form action="{{ Route('customer.add-cart') }}" method="POST">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                        <div class="pt-4 flex flex-wrap gap-4">
                            @if ($product->on_request == 0 && $stock_qty > $product->alert_quantity)
                                <div class="flex cart_action_wrapper">
                                    <button type="button" class="btn qty-minus px-4 bg-gray-200 rounded-l"><i
                                            class="fas fa-minus"></i></button>
                                    <input type="number" name="quantity"
                                        class="block text-md border-2 border-gray-200 focus:border-cyan-600 focus:outline-none focus:ring focus:ring-transparent text-slate-500 w-[100px] text-center cart_qty"
                                        max="{{ $stock_qty }}" value="1">
                                    <button type="button" class="btn qty-plus px-4 bg-gray-200 rounded-r"><i
                                            class="fas fa-plus"></i></button>
                                </div>
                                <button type="button"
                                    class="btn text-white rounded-md px-8 py-2 bg-cyan-500 hover:bg-red-400 transition-all duration-300 uppercase add-to-cart"
                                    data-id="{{ $product->id }}"><span class="pb-1">Add to Cart</span></button>
                                <button type="submit"
                                    class="btn bg-red-400 text-white rounded-md px-8 py-2 hover:bg-cyan-500 transition-all duration-300 uppercase"><span
                                        class="pb-1">Buy Now</span></button>
                            @else
                                <a href="{{ Route('frontend.contact', $product->slug) }}"
                                    class="btn text-white rounded-md px-8 py-2 bg-cyan-500 hover:bg-red-400 transition-all duration-300 uppercase"><span
                                        class="pb-1">Request for Quote</span></a>
                            @endif
                        </div>
                    </form>
                </div>
                <div class="col-span-3">
                    <div class="pt-5">
                        <ul>
                            <li
                                class="inline-block px-4 border-b-0 rounded-md rounded-bl-none rounded-br-none py-2 uppercase border border-gray-300 bg-white">
                                Description</li>
                        </ul>
                        <div class="border border-gray-300 p-4 mt-[-1px]">
                            <div class="text-sm">
                                {!! $product->description !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pt-10 md:pt-16">
                <div class="title-with-button">
                    <h2
                        class="text-center uppercase lg:text-3xl text-xl text-gray-700 relative md:mb-16 mb-10 after:content-[''] after:absolute after:left-[50%] after:w-[70px] after:h-[5px] after:bg-[#f1613b] after:translate-x-[-50%] after:bottom-[-20px]">
                        YOU MAY ALSO BE INTERESTED IN
                    </h2>
                    <div class="carousel-products__button md:block hidden">
                        <button type="button" class="owl-trigger" data-direction="prev"><i
                                class="fa-solid fa-chevron-left"></i></button>
                        <button type="button" class="owl-trigger" data-direction="next"><i
                                class="fa-solid fa-chevron-right"></i></button>
                    </div>
                </div>
                <div class="related_wrapper relative">
                    <div class="carousel-products__button md:hidden block">
                        <button type="button" class="owl-trigger left" data-direction="prev"><i
                                class="fa-solid fa-chevron-left"></i></button>
                        <button type="button" class="owl-trigger right" data-direction="next"><i
                                class="fa-solid fa-chevron-right"></i></button>
                    </div>
                    <div class="related-carousel owl-carousel owl-theme">
                        @foreach ($related_products as $key => $related_product)
                            <div>
                                <div
                                    class="product-showcase card card-{{ $key + 1 }} cursor-pointer border border-solid border-slate-300 rounded-md">
                                    <div class="before:content-[''] before:pt-[100%] before:block relative">
                                        <a href="{{ Route('frontend.single-product', $related_product->slug) }}">
                                            <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                                src="{{ file_exists($related_product->thumbnail) ? asset($related_product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                                alt="product">
                                        </a>
                                    </div>
                                    <p class="p-4 font-normal leading-5 text-slate-600 text-center overflow-hidden">
                                        <a href="{{ Route('frontend.single-product', $related_product->slug) }}">
                                            {{ $related_product->name }}
                                        </a>
                                    </p>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            function zoomInit() {
                if ($(window).width() > 575) {
                    $('.zoomImage').extm({
                        squareOverlay: true,
                    });
                } else {
                    $('.zoomImage').extm({
                        position: 'overlay',
                    });
                }
            }
            zoomInit();

            $(document).on('click', '.nav-img', function(e) {
                e.preventDefault();
                let src = $(this).data('image');
                $('.extm').remove();
                $('.overlayElement').remove();
                $('#zoomImage').attr('src', src);
                if ($(window).width() > 575) {
                    $('.zoomImage').extm({
                        imageSrc: src,
                        lazy: true,
                        squareOverlay: true,
                    });
                } else {
                    $('.zoomImage').extm({
                        imageSrc: src,
                        lazy: true,
                        position: 'overlay',
                    });
                }
            });

            $('.nam-image').owlCarousel({
                loop: false,
                dots: false,
                margin: 15,
                responsive: {
                    0: {
                        items: 3,
                    },
                    600: {
                        items: 4,
                    },
                    1000: {
                        items: 5,
                    }
                }
            });

            $('.related-carousel').owlCarousel({
                loop: true,
                margin: 15,
                responsive: {
                    0: {
                        items: 2,
                    },
                    600: {
                        items: 3,
                    },
                    1000: {
                        items: 4,
                    }
                }
            });

            $(document).on('click', '.owl-trigger', function() {
                var direction = $(this).data('direction');
                if (direction == 'prev') {
                    $('.related-carousel').trigger('prev.owl.carousel');
                } else {
                    $('.related-carousel').trigger('next.owl.carousel');
                }
            });
        });
    </script>
@endpush
