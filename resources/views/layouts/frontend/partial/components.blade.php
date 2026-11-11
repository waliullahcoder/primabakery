<div id="mobile-menu">
    <div class="menu-header">
        <div class="flex flex-row items-center justify-center gap-2 border-b border-gray-400 pb-3 mb-4">
            <a href="{{ Auth::user() ? Route('customer.profile') : Route('customer.redirect-login') }}" class="capitalize duration-300 hover:text-red-400">My
                Account</a> /
            <a href="{{ Auth::user() ? Route('customer.wishlist') : Route('customer.login') }} }}"
                class="capitalize duration-300 hover:text-red-400">wishlist</a>
        </div>
    </div>
    <ul class="mobile-menu__list">
        <li class="nav-item">
            <a class="nav-link" href="{{ route('frontend.home') }}">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('frontend.collections') }}">Our Products</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('frontend.about') }}">our story</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="{{ route('frontend.contact') }}">contact us</a>
        </li>
        <li class="nav-item nav-item-last">
            <a class="nav-link search-btn" href="#">search</a>
        </li>
    </ul>
</div>
