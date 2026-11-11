@extends('layouts.frontend.app')
@section('content')
    <main class="w-full flex items-center justify-center flex-col">
        <div class="container px-4 w-full bg-slate-100 md:mt-12">
            <div class="flex flex-col items-center justify-center mb-3 md:pt-12 pt-8">
                <h2 class="md:text-4xl text-2xl font-medium text-red-400 md:mb-6 mb-4 uppercase">{{ $contact->heading }}</h2>
                <p class="text-slate-800 md:mb-6 px-4 md:px-0 text-center">
                    {!! $contact->title !!}
                </p>
                <form action="{{ route('frontend.client-message.store') }}" method="POST" class="w-full p-6" id="contactform">
                    @csrf
                    <input type="hidden" name="product_id" value="{{ $product_id }}">
                    <div class="w-full items-center flex flex-col md:flex-row gap-6">
                        <input type="text" placeholder="Your name...."
                            class="w-full outline-none px-4 py-2 text-sm placeholder:font-light font-medium border border-solid border-slate-400 focus:border-red-400"
                            name="name">
                        <input type="text" placeholder="E-mail...." name="email"
                            class="w-full outline-none px-4 py-2 text-sm placeholder:font-light font-medium border border-solid border-slate-400 focus:border-red-400">
                    </div>
                    <div class="w-full items-center flex flex-col md:flex-row gap-6 mt-6">
                        <input type="text" placeholder="Your phone...." name="phone"
                            class="md:w-[34%] w-full outline-none px-4 py-2 text-sm placeholder:font-light font-medium border border-solid border-slate-400 focus:border-red-400 flex-1">
                        <input type="text" placeholder="Address...." name="address"
                            class="md:w-[66%] w-full outline-none px-4 py-2 text-sm placeholder:font-light font-medium border border-solid border-slate-400 focus:border-red-400">
                    </div>
                    <div class="w-full mt-6">
                        <textarea type="text" placeholder="Write Here...." name="message"
                            class="w-full outline-none px-4 py-2 text-sm placeholder:font-light font-medium border border-solid border-slate-400 focus:border-red-400 flex-1"
                            rows="4"></textarea>
                    </div>
                    <div class="w-full h-auto mt-3 flex items-end justify-end">
                        <button type="submit"
                            class="mt-3 text-sm hover:bg-green-500 rounded-full uppercase py-2 px-4 duration-500 bg-red-400 hover:text-slate-900 text-slate-100 hover:tracking-wide text-center shadow-md">
                            send us message <i class="fa fa-long-arrow-right"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="container px-4 w-full md:pb-12 pb-6">
            <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-4 items-start mb-3 lg:pt-8 lg:mt-8 gap-3 md:gap-6">
                <div class="p-2 md:p-0 flex flex-col">
                    <h2 class="text-2xl md:text-3xl font-medium text-red-400 py-2 uppercase">
                        ADDRESS</h2>
                    <span class="inline-block border-b-[3px] border-solid border-slate-300 w-[50px] mb-4"></span>
                    <p class="text-slate-600 pt-3">
                        {!! $contact->address !!}
                    </p>
                </div>
                <div class="p-2 md:p-0 flex flex-col">
                    <h2 class="text-2xl md:text-3xl font-medium text-red-400 py-2 uppercase">
                        WORK HOURS
                    </h2>
                    <span class="inline-block border-b-[3px] border-solid border-slate-300 w-[50px] mb-4"></span>
                    <p class="text-slate-600 pt-3">
                        {!! $contact->work_time !!}
                    </p>
                </div>
                <div class="p-2 md:p-0 flex flex-col">
                    <h2 class="text-2xl md:text-3xl font-medium text-red-400 py-2 uppercase">
                        Phone
                    </h2>
                    <span class="inline-block border-b-[3px] border-solid border-slate-300 w-[50px] mb-4"></span>
                    <p class="text-slate-600 pt-3">
                        {{ $contact->primary_mobile }} <br>
                        International Orders & WhatsApp: <br>
                        {{ $contact->secondary_mobile }}
                    </p>
                </div>
                <div class="p-2 md:p-0 flex flex-col">
                    <h2 class="text-2xl md:text-3xl font-medium text-red-400 py-2 uppercase">
                        E-MAIL</h2>
                    <span class="inline-block border-b-[3px] border-solid border-slate-300 w-[50px] mb-4"></span>
                    <p class="text-slate-600 pt-3">
                        {{ $contact->primary_email }} <br>
                        {{ $contact->primary_email }}
                    </p>
                </div>
            </div>
        </div>

        <div class="w-full flex">
            <iframe src="{{ $contact->map_url }}" width="100%" class="lg:h-[550px] sm:h-[300px] h-[220px]" frameborder="0"
                style="border:0" allowfullscreen=""></iframe>
        </div>
    </main>
@endsection
