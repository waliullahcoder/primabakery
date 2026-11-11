<header class="w-full {{ Route::is('frontend.home') ? 'lg:absolute top-0 left-0 z-30' : ' relative' }}">
    <div class="relative z-30 w-full flex items-center justify-center bg-cover before:content-[''] lg:before:hidden before:absolute before:shadow-md before:inset-[1px] before:h-full before:w-full before:bg-white before:z-2 fixed-header"
        style="background-image: {{ !Route::is('frontend.home') ? 'url(' . asset(App\HelperClass::siteItems('header_bg_image')) . ')' : 'none' }}">
        <div
            class="container px-5 w-full h-auto flex md:flex-row items-center justify-center flex-col lg:py-4 py-2 bg-transparent text-slate-300 relative gap-8">
            <div class="flex justify-between items-center gap-5 w-full lg:w-auto w-full">
                <a href="{{ Route('frontend.home') }}" class="logo max-w-[240px]">
                    <img src="{{ file_exists(@$setting->logo) ? asset(@$setting->logo) : asset('frontend/assets/images/logo/logo.png') }}" style="width: 220px;" alt="app-logo">
                </a>
                <div class="lg:hidden flex">
                    <a href="{{ Route('customer.cart') }}" class="cart-button">
                        <div class="bg-red-400 px-3 py-2 relative text-slate-100 rounded-3xl font-medium inline-flex">
                            <i class="fa-solid fa-cart-arrow-down"></i>
                            <span
                                class="absolute text-sm -top-2 -right-2 bg-slate-100 text-slate-900 px-1.5 p-0.5 font-light rounded-full"><span
                                    class="cart_count">0</span></span>
                        </div>
                    </a>
                    <button type="button" class="bg-red-600 text-xl px-3 py-2 ml-3 rounded leading-tight inline-flex nav-toggler"><i
                            class="fas fa-bars"></i></button>
                </div>
            </div>

            <nav class="w-full lg:block hidden">
                <div
                    class="top-nav flex flex-col md:flex-row w-full items-center md:items-start justify-between border-b border-dotted border-slate-500 pb-2">
                    <div class="contact flex flex-col sm:flex-row sm:gap-4">
                        <p class="mobile cursor-pointer text-red-400">
                            <i class="fa-solid fa-phone"></i>
                            <span
                                class="text-xs font-medium hover:text-slate-900 duration-500">{{ @$setting->primary_mobile }}</span>
                        </p>
                        <p class="email cursor-pointer hover:text-red-400 duration-500">
                            <i class="fa-solid fa-envelope text-red-400"></i>
                            <span class="text-sm">{{ @$setting->primary_email }}</span>
                        </p>
                    </div>
                    <div class="flex flex-col sm:flex-row items-center justify-center gap-2 mt-2 md:mt-0">
                        @auth
                            <a href="{{ Route('customer.orders') }}" class="capitalize duration-300 hover:text-red-400">My
                                Account</a> /
                            <a href="{{ Route('customer.wishlist') }}"
                                class="capitalize duration-300 hover:text-red-400">wishlist</a>
                        @else
                            <a href="{{ Route('customer.redirect-login') }}" class="capitalize duration-300 hover:text-red-400">My
                                Account</a>
                        @endauth
                        <a href="{{ Route('customer.cart') }}" class="cart-button ml-3">
                            <div class="bg-red-400 px-4 py-2 relative text-slate-100 rounded-3xl font-medium">
                                <i class="fa-solid fa-cart-arrow-down pr-2"></i>
                                @if (is_array($cart))
                                    @php
                                        $total = 0;
                                        foreach ($cart as $key => $item) {
                                            $total += $item['price'] * $item['qty'];
                                        }
                                    @endphp
                                @else
                                    @php
                                        $total = 0.0;
                                    @endphp
                                @endif
                                <span
                                    class="font-mono pr-1 total_cart_price">{{ number_format($total, 2) }}</span><span
                                    class="font-medium">Taka</span>
                                <span
                                    class="absolute text-sm -top-2 -right-2 bg-slate-100 text-slate-900 px-1.5 p-0.5 font-light rounded-full"><span
                                        class="cart_count">{{ is_array($cart) ? count($cart) : 0 }}</span></span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="bottom-nav w-full">

                    <!-- Nav Mobile Icons -->
                    <div class="flex items-center justify-end w-full md:hidden">
                        <button id="mobile-menu-icon" class="mx-5 my-2">
                            <i
                                class="fa-solid fa-bars bg-red-400 py-1.5 px-2 border border-dotted border-slate-100 duration-500 hover:bg-slate-300 hover:text-red-400 text-xl font-extrabold rounded-md"></i>
                        </button>
                    </div>

                    <!-- Nav Desktop Buttons -->
                    <ul id="nav-icon-list"
                        class="flex-col bg-slate-900 md:bg-transparent md:flex md:flex-row items-center justify-end uppercase font-medium md:w-full overflow-hidden duration-100 lg:pt-4">
                        <li class="nav-item">
                            <a class="nav-link m-0 px-1 duration-500 hover:text-red-400 flex flex-col items-center justify-center"
                                href="{{ route('frontend.home') }}"><span class="xl:text-sm text-xs lg:px-8">Home
                                </span>
                                <p class="w-0 h-[3px] border-solid duration-500 bg-red-400 mt-1.5"></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link m-0 px-1 duration-500 hover:text-red-400 flex flex-col items-center justify-center"
                                href="{{ route('frontend.collections') }}">
                                <span class="xl:text-sm text-xs lg:px-8"> Our Products</span>
                                <p class="w-0 h-[3px] border-solid duration-500 bg-red-400 mt-1.5"></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link m-0 px-1 duration-500 hover:text-red-400 flex flex-col items-center justify-center"
                                href="{{ route('frontend.about') }}">
                                <span class="xl:text-sm text-xs lg:px-8">
                                    our story
                                </span>
                                <p class="w-0 h-[3px] border-solid duration-500 bg-red-400 mt-1.5"></p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link m-0 px-1 duration-500 hover:text-red-400 flex flex-col items-center justify-center"
                                href="{{ route('frontend.contact') }}"><span class="xl:text-sm text-xs lg:px-8">contact
                                    us </span>
                                <p class="w-0 h-[3px] border-solid duration-500 bg-red-400 mt-1.5"></p>
                            </a>
                        </li>
                        <li class="nav-item nav-item-last">
                            <a class="nav-link m-0 px-1 duration-500 hover:text-red-400 flex flex-col items-center justify-center search-btn"
                                href="#"><span class="xl:text-sm text-xs lg:px-8">search </span>
                                <p class="w-0 h-[3px] border-solid duration-500 bg-red-400 mt-1.5"></p>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</header>
