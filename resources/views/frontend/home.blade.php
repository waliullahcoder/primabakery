@extends('layouts.frontend.app')
@section('content')
    <main class="overflow-hidden">
        <div id="carousel-banner" class="carousel-banner owl-carousel owl-theme">
            @foreach ($sliders as $index => $slider)
                <div id="banner-image{{ $index }}" class="banner-image carousel-banner-item w-full duration-1000">
                    <div class="w-auto relative overflow-hidden">
                        <div class="absolute top-0 -z-10 overflow-hidden">
                            <img src="{{ asset($slider->image) }}" alt="banner-main-image"
                                class="w-full min-h-screen object-cover animate-[zoom_5s_linear_infinite_alternate]">
                        </div>
                        <div
                            class="md:min-h-screen sm:min-h-[80vh] min-h-[50vh] w-full flex flex-col items-center justify-center relative lg:pt-10">
                            <div class="container w-full flex flex-row items-center justify-between md:gap-8 gap-3 px-5">
                                <div class="slider-content">
                                    <h1
                                        class="text-slate-200 text-2xl sm:text-3xl md:text-5xl font-medium uppercase md:leading-tight sm:leading-tight leading-tight">
                                        {{ $slider->heading }}
                                    </h1>
                                    <h3
                                        class="text-slate-300 xs:text-md sm:text-xl md:text-3xl xs:font-medium uppercase my-3 md:my-6">
                                        {{ $slider->title }}
                                    </h3>
                                    @if ($slider->show_btn == 1)
                                        <ul
                                            class="large-contact-button flex flex-col sm:flex-row gap-3 uppercase text-slate-600 pr-3 sm:pr-0 mt-6 md:mt-12">
                                            <li>
                                                <a href="{{ $site_items && $site_items->shop_button_link ? $site_items->shop_button_link : '#' }}"
                                                    class="md:px-7 px-3 md:py-4 py-1.5 rounded-full hover:bg-red-400 hover:font-medium hover:tracking-wide hover:text-slate-100 duration-700 font-medium text-xs sm:text-md md:text-xl bg-slate-100 text-center">
                                                    view our products
                                                </a>
                                            </li>
                                            <li>
                                                <a href="{{ $site_items && $site_items->contact_button_link ? $site_items->contact_button_link : '#' }}"
                                                    class="md:px-7 px-3 md:py-4 py-1.5 rounded-full hover:bg-red-400 hover:font-medium hover:tracking-wide hover:text-slate-100 duration-700 font-medium text-xs sm:text-md md:text-xl bg-slate-100 text-center">
                                                    contacts for more
                                                </a>
                                            </li>
                                        </ul>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <!-- Welcome Banner -->
        <div class="mt-4 md:mt-12 lg:mt-24 container mx-auto px-5 w-full">
            <div class="items-center justify-center mb-3 md:flex hidden">
                <img src="{{ asset($site_items->banner_image) }}" alt="collect array">
            </div>

            <div class="flex flex-col items-center justify-center mb-3 px-2 md:px-0">
                <h2 class="lg:text-4xl md:text-3xl text-2xl font-medium text-slate-700 mb-6">{{ $site_items->title }}</h2>
                <p class="text-slate-600 text-sm xs:text-xl text-center">
                    {!! $site_items->short_description !!}
                </p>
            </div>

            <div class="welcome-banner-box w-full flex items-center justify-center">
                <div class="grid md:grid-cols-4 sm:grid-cols-2 grid-cols-2 lg:my-10 my-6 justify-between">
                    @foreach ($special_items as $index => $item)
                        <a href="{{ $item->link }}">
                            <div class="max-w-[240px] w-full flex justify-center">
                                <div class="grow">
                                    <img src="{{ asset($item->image) }}" alt="{{ $item->name }}"
                                        style="max-height: 160px; width: auto; max-width: 100%; margin-bottom: 15px; margin-top: 15px;" class="mx-auto">
                                    <p class="text-center lg:text-4xl md:text-3xl text-2xl font-['Rock_Salt']">
                                        {{ $item->name }}</p>
                                </div>

                                @if ($index != count($special_items) - 1)
                                    <img src="{{ asset($site_items->y_separator_image) }}" alt="{{ $site_items->title }}"
                                        class="hidden md:block">
                                @endif
                            </div>
                        </a>
                    @endforeach

                </div>
            </div>
        </div>

        <!-- Card Items -->
        <div class="container mx-auto flex flex-col items-center justify-center px-5 md:px-0">
            <div class="w-full grid md:grid-cols-3 grid-cols-1 items-center gap-5 my-5">
                @foreach ($card_details as $card)
                    <div class="bg-slate-100 rounded-md shadow-md py-6 px-6 h-full">
                        <h1 class="text-center font-medium lg:text-2xl md:text-2xl text-xl text-slate-700 uppercase">
                            {{ $card->title }}
                        </h1>
                        <div class="text-justify font-normal md:mt-5 mt-4 text-slate-700 lg:text-base text-sm">
                            {!! $card->description !!}
                        </div>
                    </div>
                @endforeach

            </div>
        </div>
        <!-- Card Food Items -->

        <!-- Card Food Items -->
        <div class="card-food-items bg-cover mt-32 flex flex-col w-full items-center justify-center mb-6 lg:pb-20 p-6 md:p-0"
            style="background-image: url({{ asset($site_items->welcome_image) }})">
            <div class="container w-full -mt-20 bg-slate-100 shadow-[0px_4px_6px_2px_rgba(0,0,0,0.12)] rounded">

                @foreach ($showcase_items as $index => $showcase_item)
                    <!-- Single Card Image Box {{ $index + 1 }}-->
                    <div
                        class="w-full flex {{ $index % 2 === 0 ? 'flex-col md:flex-row' : 'flex-col-reverse md:flex-row-reverse' }} bg-white">
                        <div class="card-box w-full md:w-1/3 bg-white flex flex-col items-center justify-center p-8">
                            <h1 class="text-center font-medium text-2xl sm:text-4xl text-slate-700 uppercase">
                                {{ $showcase_item->title }}
                            </h1>
                            <p class="text-justify font-normal md:mt-8 mt-4 text-slate-700">
                                {!! $showcase_item->short_description !!}
                            </p>
                            <a href="{{ $showcase_item->link }}"
                                class="mt-10 px-7 lg:py-4 py-3 rounded-full bg-red-400 hover:font-medium hover:tracking-wide hover:text-slate-900 text-slate-100 md:text-xl duration-700 font-medium hover:bg-slate-100 text-center uppercase">view
                                our products</a>
                        </div>
                        <div class="card-image w-full md:w-2/3 overflow-hidden max-h-[70vh]">
                            <img src="{{ asset($showcase_item->thumbnail) }}"
                                class="w-full md:h-full duration-1000 opacity-100 hover:opacity-75"
                                alt="View more product section">
                        </div>
                    </div>
                @endforeach
            </div>

            <div class="md:py-14 pt-10 pb-6">
                <h1 class="text-center font-medium text-2xl sm:text-3xl md:text-4xl mb-6 lg:mb-10 text-slate-300 uppercase">
                    {{ $site_items->banner_title }}
                </h1>
                <div class="flex lg:gap-6 gap-4 flex-col sm:flex-row items-center justify-center">
                    <a href="{{ $site_items->shop_button_link }}"
                        class="uppercase px-7 lg:py-4 py-3 rounded-full bg-red-400 hover:font-medium hover:tracking-wide hover:text-slate-900 text-slate-100 lg:text-xl md:text-lg text-base duration-700 font-medium hover:bg-slate-100 text-center">
                        visit our online shop
                    </a>
                    <a href="{{ $site_items->contact_button_link }}"
                        class="uppercase px-7 lg:py-4 py-3 rounded-full bg-green-400 hover:font-medium hover:tracking-wide text-slate-900 lg:text-xl md:text-lg text-base duration-700 font-medium hover:bg-slate-100 text-center">
                        contact today
                    </a>
                </div>
            </div>

        </div>
        <!-- Card Food Items -->

        <!-- Card Food Items -->
        <div class="container mx-auto px-4">
            <h1 class="text-center font-bold text-4xl text-red-400 uppercase md:my-6 my-3">
                {{ $site_items->products_title }}
            </h1>
            <div class="flex flex-row flex-wrap items-center justify-center md:gap-6 gap-3 text-slate-600 capitalize">
                <p class="duration-300 hover:text-red-500 hover:tracking-wide cursor-pointer" id="product-all">All <span
                        class="pl-3">/</span></p>

                @foreach ($categories as $index => $category)
                    <p class="category duration-300 hover:text-red-500 hover:tracking-wide cursor-pointer"
                        category-products="#product_category__{{ $category->id }}">
                        @if ($index > 0)
                            <span class="pr-3">/</span>
                        @endif
                        {{ $category->name }}

                    </p>
                @endforeach
            </div>

            <!-- Main Product Components -->
            <div class="w-full" id="main-all-products">
                <div class="mt-6">
                    <div class="carousel owl-carousel owl-theme product-carousel">
                        @foreach ($products as $key => $product)
                            <div
                                class="product-showcase card card-{{ $key + 1 }} cursor-pointer border border-solid border-slate-300 shadow-xl rounded-md">
                                <div class="before:content-[''] before:pt-[100%] before:block relative">
                                    <a href="{{ Route('frontend.single-product', $product->slug) }}">
                                        <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                            src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                            alt="product">
                                    </a>
                                </div>
                                <p class="p-4 font-normal leading-5 text-slate-600 text-center h-[58px] overflow-hidden">
                                    <a href="{{ Route('frontend.single-product', $product->slug) }}">
                                        {{ $product->name }}
                                    </a>
                                </p>
                                <div class="text-center"><b>৳</b>{{ $product->price->online_price }}</div>
                                <div class="text-center py-3">
                                    <a href="{{ Route('frontend.single-product', $product->slug) }}"
                                        class="px-5 py-2 border border-solid border-slate-300 rounded-full text-slate-500 text-sm duration-700 font-medium bg-slate-100 text-center uppercase inline-block">
                                        VIEW PRODUCT
                                    </a>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <!-- Category Product Components -->
            @foreach ($categories as $index => $category)
                <div class="category-products w-full !hidden" id="product_category__{{ $category->id }}">
                    <div class="mt-6 p-tabs">
                        <div class="carousel owl-carousel owl-theme product-carousel">
                            @foreach ($category->products->where('show_on_website', 1) as $key => $product)
                                <div>
                                    <div
                                        class="product-showcase card card-{{ $key + 1 }} cursor-pointer border border-solid border-slate-300 shadow-xl rounded-md">
                                        <div class="before:content-[''] before:pt-[100%] before:block relative">
                                            <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                                src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png') }}"
                                                alt="product">
                                        </div>
                                        <p
                                            class="p-4 font-normal leading-5 text-slate-600 text-center h-[58px] overflow-hidden">
                                            {{ $product->name }}
                                        </p>
                                        <div class="text-center"><b>৳</b>{{ $product->price->online_price }}</div>
                                        <div class="text-center py-3">
                                            <a href="{{ Route('frontend.single-product', $product->slug) }}"
                                                class="px-5 py-2 border border-solid border-slate-300 rounded-full text-slate-500 text-sm duration-700 font-medium bg-slate-100 text-center uppercase inline-block">
                                                VIEW PRODUCT
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            @endforeach
        </div>

        <!--  Testimonial Showcase Attractive Product with services track -->
        @php
            $testimonials = App\HelperClass::testimonial();
        @endphp

        <div
            class="flex flex-col-reverse md:flex-row items-center justify-center md:justify-between px-3 md:px-10 md:my-8 my-4">
            <div class="w-full flex items-center justify-center"><img src="{{ $testimonials['testimonial_image'] }}"
                    alt="Attractive Product">
            </div>
            <div class="w-full md:p-10 p-4">
                <h1 class="text-start font-medium lg:text-5xl text-3xl text-red-400 uppercase md:my-6 my-3">
                    {{ $testimonials['testimonial_title'] }}
                </h1>
                @foreach ($testimonials['testimonials'] as $testimonial)
                    <div class="flex flex-row items-start justify-start w-full gap-5 md:mt-12 mt-4">
                        <img src="{{ asset($testimonial->thumbnail) }}" class="w-28 h-28" alt="track image">
                        <div class="flex flex-col items-start justify-center sm:gap-3 gap-1">
                            <h1 class="text-start font-medium text-xl md:text-2xl lg:text-3xl text-slate-900 uppercase">
                                {{ $testimonial->title }}
                            </h1>
                            <p class="text-slate-700 font-light leading-5 text-start">
                                {!! $testimonial->short_description !!}
                            </p>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>

        @if (!is_null($site_items->details_video_url))
            <div class="container md:py-8 py-3 px-2 md:px-4 w-full mb-6">
                <iframe width="100%" class="h-96 md:h-[600px] rounded-md" src="{{ $site_items->details_video_url }}"
                    title="YouTube video player" frameborder="0"
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen></iframe>
            </div>
        @endif
    </main>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(".carousel-banner").owlCarousel({
                loop: true,
                autoplaySpeed: true,
                autoplay: true,
                nav: true,
                navText: [
                    "<i class='fa fa-angle-left'></i>",
                    "<i class='fa fa-angle-right'></i>"
                ],
                autoplayTimeout: 5000,
                autoplayHoverPause: true,
                items: 1,
            });

            $(".carousel").owlCarousel({
                loop: false,
                dots: true,
                nav: true,
                navText: [
                    "<i class='fa fa-angle-left'></i>",
                    "<i class='fa fa-angle-right'></i>"
                ],
                margin: 15,
                responsive: {
                    0: {
                        items: 2,
                    },
                    576: {
                        items: 3,
                    },
                    768: {
                        items: 4,
                    },
                    1024: {
                        items: 5,
                    }
                }
            });

            $('#product-all').click(function() {
                $('#main-all-products').removeClass('!hidden');
                $('.category-products').addClass('!hidden');
                $(".carousel").trigger('refresh.owl.carousel');
            });

            $('.category').click(function() {
                const categoryProducts = $(this).attr("category-products");
                $('#main-all-products').addClass('!hidden');
                $('.category-products').addClass('!hidden');
                $(categoryProducts).removeClass('!hidden');
                $(".carousel").trigger('refresh.owl.carousel');
            });
        });
    </script>
@endpush
