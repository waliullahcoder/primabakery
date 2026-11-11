@extends('layouts.frontend.app')

@section('content')
    <main class="w-full flex items-center justify-center flex-col mb-10">
        <div class="container mx-auto">
            <div class="pb-6 pt-3">
                <ol class="breadcrumb breadcrumb--ys pull-left">
                    <li class="home-link"><a href="{{ Route('frontend.home') }}"><i class="fa-solid fa-house"></i></a></li>
                    <li><span>{{ $search_string }}</span></li>
                </ol>
            </div>
            <div
                class="product-showcase-container w-full h-auto pb-8 grid grid-cols-1 xs:grid-cols-2 sm:grid-cols-3 md:grid-cols-4 items-center gap-3 sm:gap-4 md:gap-6">
                @foreach ($products as $key => $product)
                    <div
                        class="product-showcase card card-{{ $key + 1 }} border border-solid border-slate-300 shadow-xl rounded-md">
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
            <div>
                {!! $products->links('pagination::tailwind') !!}
            </div>
        </div>
    </main>
@endsection
