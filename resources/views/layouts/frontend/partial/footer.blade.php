<footer class="overflow-hidden">
    <div class="card-food-items bg-cover flex flex-col w-full items-center justify-center p-6"
        style="background-image: url({{ asset('frontend/assets/images/gallery/black_bg.jpg') }})">

        <div class="w-full container">
            <div class="logo w-full flex md:mb-10 items-center justify-center">
                <a href="{{ Route('frontend.home') }}">
                    <img src="{{ !is_null($setting) && file_exists($setting->logo) ? asset($setting->logo) : asset('frontend/assets/images/logo/logo.png') }}"
                        class="max-w-[260px] w-full h-auto" alt="Footer Logo">
                </a>
            </div>

            <!-- Footer Details -->
            <div class="w-full grid grid-cols-12 gap-4 md:gap-6 md:mb-10">

                <!-- Grid 1 -->
                <div class="lg:col-span-3 md:col-span-4 col-span-12 gap-2 p-2 flex">
                    <div class="w-full">
                        <h1 class="font-medium md:text-2xl text-xl text-slate-100 uppercase md:my-6 my-3">
                            contact
                        </h1>
                        <div class="w-full mt-6 flex flex-col gap-3">
                            <a href="#" class="text-slate-300">
                                <span class="text-sm text-red-400 font-medium pr-2">Address:</span>
                                <span>
                                    {{ $setting ? $setting->address : '' }}
                                </span>
                            </a>
                            <a href="#" class="text-slate-300">
                                <span class="text-sm text-red-400 font-medium pr-2">Phone:</span>
                                <span>
                                    {{ $setting ? $setting->primary_mobile : '' }}
                                </span>
                            </a>
                            <a href="#" class="text-slate-300">
                                <span class="text-sm text-red-400 font-medium pr-2">Intl. Orders &
                                    WhatsApp:</span>
                                <span>
                                    {{ $setting ? $setting->secondary_mobile : '' }}
                                </span>
                            </a>
                            <a href="#" class="text-slate-300 leading-5">
                                <span class="text-sm text-red-400 font-medium pr-2">E-mail:</span><br>
                                <span class="break-all">
                                    {{ $setting ? $setting->primary_email : '' }}
                                </span><br>
                                <span class="break-all">
                                    {{ $setting ? $setting->secondary_email : '' }}
                                </span>
                            </a>
                        </div>
                    </div>
                    <img class="bg-transparent hidden md:block"
                        src="{{ asset('frontend/assets/images/gallery/sep3.avif') }}" alt="separator 3">
                </div>

                <!-- Grid 2 -->
                <div class="lg:col-span-3 md:col-span-4 col-span-6 md:gap-2 flex">
                    <div class="w-full">
                        <h1 class="font-medium md:text-2xl text-xl text-slate-100 uppercase md:my-6 my-3">
                            here to help
                        </h1>
                        <div class="w-full mt-6 flex flex-col gap-3">
                            <a href="{{ Route('customer.redirect-login') }}"
                                class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                login / Register
                            </a>
                            @auth
                                <a href="{{ Route('customer.profile') }}"
                                    class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                    My Account
                                </a>
                            @else
                                <a href="{{ Route('customer.redirect-login') }}"
                                    class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                    My Account
                                </a>
                            @endauth
                            <a href="{{ Route('customer.cart') }}"
                                class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                Shopping Cart
                            </a>
                            @auth
                                <a href="{{ Route('customer.orders') }}"
                                    class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                    Your Orders
                                </a>
                            @else
                                <a href="{{ Route('customer.redirect-login') }}"
                                    class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                    Your Orders
                                </a>
                            @endauth

                        </div>
                    </div>
                    <img class="bg-transparent"
                        src="{{ asset('frontend/assets/images/gallery/sep3.avif') }}" alt="separator 3">
                </div>

                <!-- Grid 3 -->
                <div class="lg:col-span-3 md:col-span-4 col-span-6 gap-2 flex">
                    <div class="w-full">
                        <h1 class="font-medium md:text-2xl text-xl text-slate-100 uppercase md:my-6 my-3">
                            useful links
                        </h1>
                        <div class="w-full mt-6 flex flex-col gap-3">
                            <a href="{{ Route('frontend.home') }}"
                                class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                Home
                            </a>
                            <a href="{{ Route('frontend.products') }}"
                                class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                Our Products
                            </a>

                            <a href="{{ Route('frontend.about') }}"
                                class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                About us
                            </a>

                            @foreach ($pages as $page)
                                <a href="{{ Route('frontend.page', $page->slug) }}"
                                    class="text-slate-300 duration-300 hover:text-red-400 capitalize font-mono font-medium hover:tracking-wide">
                                    {{ $page->name }}
                                </a>
                            @endforeach
                        </div>
                    </div>
                    <img class="bg-transparent hidden md:block"
                        src="{{ asset('frontend/assets/images/gallery/sep3.avif') }}" alt="separator 3">
                </div>

                <!-- Grid 4 -->
                <div class="lg:col-span-3 md:col-span-4 col-span-12 gap-2 flex">
                    <div class="w-full">
                        <h1 class="font-medium md:text-2xl text-xl text-slate-100 uppercase md:my-6 my-3">
                            newsletter
                        </h1>
                        <div class="w-full mt-6 flex flex-col gap-3">
                            <p href="#"
                                class="text-slate-300 duration-300 hover:text-red-400 hover:tracking-wide">
                                Subscribe and get up to date with our latest offers products & sneak peaks in
                                your inbox.
                            </p>

                            <form action="{{ Route('frontend.subscribe.store') }}" method="POST">
                                @csrf
                                <div class="w-full my-5 pr-4">
                                    <input type="email" name="email" required
                                        class="outline-none border-2 border-solid border-red-400 text-red-400 bg-transparent focus:border-slate-100 w-full px-3 py-2 rounded-full text-sm placeholder:text-slate-600"
                                        placeholder="Subscribe Here...">
                                    <button
                                        class="mt-3 w-full bg-slate-100 rounded-full uppercase py-1 duration-500 hover:bg-red-400 text-slate-900 hover:text-slate-100 text-xl font-mono font-medium hover:tracking-wide text-center">Subscribe</button>
                                </div>
                            </form>

                        </div>
                        <div class="text-slate-300 text-center">
                            @if ($setting && $setting->facebook_page)
                                <a href="{{ $setting->facebook_page }}"
                                    class="text-sm md:text-xl cursor-pointer text-red-4300 duration-300 hover:text-red-400 font-medium pr-2"><i
                                        class="fa-brands fa-facebook"></i>
                                </a>
                            @endif
                            @if ($setting && $setting->twitter)
                                <a href="{{ $setting->twitter }}"
                                    class="text-sm md:text-xl cursor-pointer text-red-4300 duration-300 hover:text-red-400 font-medium pr-2"><i
                                        class="fa-brands fa-twitter"></i>
                                </a>
                            @endif
                            @if ($setting && $setting->youtube)
                                <a href="{{ $setting->youtube }}"
                                    class="text-sm md:text-xl cursor-pointer text-red-4300 duration-300 hover:text-red-400 font-medium pr-2"><i
                                        class="fa-brands fa-youtube"></i>
                                </a>
                            @endif
                        </div>
                    </div>
                </div>
            </div>

            <!-- Last Footer -->
            <div class="pb-6 w-full">
                <img src="{{ asset('frontend/assets/images/gallery/copy_bdr.avif') }}" alt="line breaker separator">
            </div>

            <div class="w-full flex flex-col md:flex-row items-center justify-between px-2">
                <p class="text-sm text-slate-100">
                    Copyright © {{ date('Y') }}. {{ $setting->title }} All rights reserved. Designed by
                    <a href="https://technoparkbd.com/" target="_blank" class="font-medium text-red-400 pl-1">
                        Techno Park Bangladesh
                    </a>
                </p>
                <div class="max-h-20 hidden"><img src="{{ asset('frontend/assets/images/gallery/paye.avif') }}"
                        alt="pay card">
                </div>
            </div>

        </div>
    </div>
</footer>
