<div class="lg:col-span-4 xl:col-span-3 col-span-12">
    <ul class="px-3 border-2 border-red-300 rounded-lg">
        <li class="block py-3">
            <a class="text-gray-500 text-md uppercase font-medium hover:text-red-500 transition-colors duration-200 {{ Route::is('customer.profile') ? 'active' : '' }}"
                href="{{ Route('customer.profile') }}">
                <span class="link-item">
                    <i class="fa-solid fa-list-check mr-1"></i>
                    <span>Information</span>
                </span>
            </a>
        </li>
        <li class="block py-3 border-t-2 border-red-300">
            <a class="text-gray-500 text-md uppercase font-medium hover:text-red-500 transition-colors duration-200 {{ Route::is('customer.address') ? 'active' : '' }}"
                href="{{ Route('customer.address') }}">
                <span class="link-item">
                    <i class="fa-solid fa-address-book mr-1 text-lg"></i>
                    <span>Add first address</span>
                </span>
            </a>
        </li>
        <li class="block py-3 border-t-2 border-red-300">
            <a class="text-gray-500 text-md uppercase font-medium hover:text-red-500 transition-colors duration-200 {{ Route::is('customer.orders') ? 'active' : '' }}"
                href="{{ Route('customer.orders') }}">
                <span class="link-item">
                    <i class="fa-solid fa-clipboard-list mr-1 text-lg"></i>
                    <span>Order history</span>
                </span>
            </a>
        </li>
        <li class="block py-3 border-t-2 border-red-300">
            <a class="text-gray-500 text-md uppercase font-medium hover:text-red-500 transition-colors duration-200 {{ Route::is('customer.wishlist') ? 'active' : '' }}"
                href="{{ Route('customer.wishlist') }}" title="My Wishlists">
                <i class="fa fa-heart me-1 text-md"></i>
                <span>My Wishlists</span>
            </a>
        </li>
        <li class="block py-3 border-t-2 border-red-300">
            <a class="text-gray-500 text-md uppercase font-medium hover:text-red-500 transition-colors duration-200"
                href="{{ Route('customer.logout') }}" rel="nofollow" class="btn-logout">
                <span class="link-item">
                    <i class="fa-solid fa-right-from-bracket me-1 text-lg"></i>
                    Sign out
                </span>
            </a>
        </li>
    </ul>
</div>
