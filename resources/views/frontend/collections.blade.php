@extends('layouts.frontend.app')
@section('content')
    <main class="py-6">
        <div class="container mx-auto px-4">
            <div class="pb-6">
                <ol class="breadcrumb breadcrumb--ys pull-left">
                    <li class="home-link"><a href="{{ Route('frontend.home') }}"><i class="fa-solid fa-house"></i></a></li>
                    <li><span>Collections</span></li>
                </ol>
            </div>
            <div class="flex items-center justify-center flex-col md:mt-6">
                <div
                    class="product-showcase-container w-full h-auto md:py-8 pb-8 grid grid-cols-2 xs:grid-cols-2 sm:grid-cols-3 md:grid-cols-4 items-center gap-4 sm:gap-6 md:gap-10">
                    @foreach ($categories as $key => $category)
                        <div>
                            <a href="{{ Route('frontend.products', $category->slug) }}">
                                <div class="before:content-[''] before:pt-[100%] before:block relative">
                                    <img class="w-full rounded-md absolute inset-0 h-full object-contain"
                                        src="{{ file_exists($category->image) ? asset($category->image) : asset('frontend/assets/images/default/no_image2.png') }}"
                                        alt="product">
                                </div>
                                <p class="p-4 font-normal leading-5 text-slate-600 text-center text-lg overflow-hidden">
                                    {{ $category->name }}
                                </p>
                            </a>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </main>
@endsection
