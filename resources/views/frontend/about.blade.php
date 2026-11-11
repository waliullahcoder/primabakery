@extends('layouts.frontend.app')
@section('content')
    <main class="w-full flex items-center justify-center flex-col md:mt-30 md:-mb-10 container px-5 mx-auto">
        <div class="mt-4 md:mt-14 container w-full md:pb-14 pb-6">
            <div class="flex flex-col items-center justify-center mb-3">
                <h2 class="lg:text-4xl md:text-3xl text-2xl font-medium text-red-400 my-6">{{ $about->title }}</h2>
                <div class="text-slate-500 lg:text-lg text-base text-justify">
                    {!! $about->description !!}
                </div>
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

        <div class="card-food-items bg-cover lg:mt-32 mt-20 flex flex-col w-full items-center justify-center mb-6 lg:pb-22"
            style="background-image: url({{ asset($site_items->welcome_image) }}') }})">
            <div class="container w-full -mt-20 bg-slate-100 shadow-[0px_4px_6px_2px_rgba(0,0,0,0.12)] rounded">

                <!-- Single Card Image Box -->
                <div class="w-full flex flex-col md:flex-row bg-white">
                    <div class="card-box w-full bg-white flex flex-col items-center justify-center p-8 md:px-12 md:py-20">
                        <h1 class="text-center font-medium text-2xl sm:text-4xl text-slate-700 uppercase md:mb-6">
                            {{ $about->white_faq_name }}
                        </h1>
                        <p class="text-center font-normal md:mt-12 mt-4 text-slate-700">
                            {!! $about->white_faq_description !!}
                        </p>
                    </div>
                    <div
                        class="card-box w-full bg-slate-600 text-slate-100 flex flex-col items-center justify-center p-8 md:px-12 md:py-20">
                        <h1 class="text-center font-medium text-2xl sm:text-4xl uppercase md:mb-6">
                            {{ $about->black_faq_name }}
                        </h1>
                        <p class="text-center font-normal md:mt-12 mt-4">
                            {!! $about->black_faq_description !!}
                        </p>
                    </div>
                </div>
            </div>

            <div class="lg:py-14 py-8">
                <h1 class="text-center font-medium text-2xl sm:text-4xl text-slate-300 uppercase mb-10">
                    {{ $about->faq_title }}
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

        @php
            $testimonials = App\HelperClass::testimonial();
        @endphp

        <div
            class="flex flex-col-reverse md:flex-row items-center justify-center md:justify-between md:px-10 md:my-8 my-4">
            <div class="w-full flex items-center justify-center"><img src="{{ $testimonials['testimonial_image'] }}"
                    alt="Attractive Product">
            </div>
            <div class="w-full md:p-10">
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

        <div class="w-full bg-gray text-slate-600 flex items-center justify-center pt-12 xs:pb-10">
            <div class="container w-full">
                <div class="flex flex-col items-center justify-center mb-3">
                    <h2 class="lg:text-4xl md:text-3xl text-2xl font-medium text-red-400 my-6 uppercase">
                        {{ $about->social_work_heading }}</h2>
                    <div class="text-justify md:py-10 p-4 leading-6">
                        {!! $about->social_work_description !!}
                    </div>
                </div>
                <div class="social-images w-full h-auto pb-4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                    @foreach ($social_works as $work)
                        <div
                            class="border-4 border-solid border-slate-100 duration-300 hover:border-red-400 cursor-pointer w-full h-64 overflow-hidden">
                            <img src="{{ asset($work->image) }}" alt="{{ $work->title }}"
                                class="w-full h-full cursor-pointer duration-500">
                        </div>
                    @endforeach
                </div>
                <div class="py-14">
                    <h1 class="text-center font-medium text-2xl sm:text-4xl text-slate-300 uppercase">
                        {{ $about->social_work_title }}
                    </h1>
                    <div class="flex sm:gap-6 gap-3 flex-row items-center justify-center">
                        <a href="{{ Route('customer.login') }}"
                            class="uppercase mt-10 md:px-7 px-5 md:py-4 py-3 rounded-full bg-red-400 hover:font-light hover:tracking-wide hover:text-slate-900 text-slate-100 duration-700 font-medium hover:bg-slate-100 text-center">
                            join us today
                        </a>
                        @if(!is_null($setting->facebook_page))
                        <a href="{{ $setting->facebook_page }}"
                            class="uppercase mt-10 md:px-7 px-5 md:py-4 py-3 rounded-full hover:bg-green-400 hover:font-medium hover:tracking-wide text-slate-900 text-xl duration-700 font-medium bg-slate-100 text-center">
                            <i class="fa-brands fa-facebook"></i>
                        </a>
                        @endif
                        @if(!is_null($setting->twitter))
                        <a href="{{ $setting->twitter }}"
                            class="uppercase mt-10 md:px-7 px-5 md:py-4 py-3 rounded-full hover:bg-green-400 hover:font-medium hover:tracking-wide text-slate-900 text-xl duration-700 font-medium bg-slate-100 text-center">
                            <i class="fa-brands fa-twitter"></i>
                        </a>
                        @endif
                        @if(!is_null($setting->linkedin))
                        <a href="{{ $setting->linkedin }}"
                            class="uppercase mt-10 md:px-7 px-5 md:py-4 py-3 rounded-full hover:bg-green-400 hover:font-medium hover:tracking-wide text-slate-900 text-xl duration-700 font-medium bg-slate-100 text-center">
                            <i class="fa-brands fa-linkedin"></i>
                        </a>
                        @endif
                        @if(!is_null($setting->youtube))
                        <a href="{{ $setting->youtube }}"
                            class="uppercase mt-10 md:px-7 px-5 md:py-4 py-3 rounded-full hover:bg-green-400 hover:font-medium hover:tracking-wide text-slate-900 text-xl duration-700 font-medium bg-slate-100 text-center">
                            <i class="fa-brands fa-youtube"></i>
                        </a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection
