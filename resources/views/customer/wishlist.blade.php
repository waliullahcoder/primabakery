@extends('layouts.frontend.app')
@section('content')
    <section class="lg:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid md:gap-12 gap-8 grid-cols-12">
                @include('layouts.customer.menu')
                <div class="lg:col-span-8 xl:col-span-9 col-span-12">
                    <div class="dashboard-card">
                        <div class="mb-5">
                            <h3 class="mb-0 font-semibold text-red-500 uppercase">My Wishlist</h3>
                            <span class="inline-block h-[2px] bg-red-400 w-[100px]"></span>
                        </div>
                        <div class="pb-2">
                            @if (count($wishlists) > 0)
                                <div class="grid grid-cols-12 gap-5">
                                    @foreach ($wishlists as $wishlist)
                                        <div class="lg:col-span-3 md:col-span-4 col-span-6"
                                            id="wishlist_item_{{ $wishlist->id }}">
                                            <div class="wishlist-item">
                                                <a href="#" class="lnkdel" data-id="{{ $wishlist->id }}"
                                                    title="Delete"><i class="material-icons close">close</i>
                                                </a>
                                                <div class="wishlist__image">
                                                    <a
                                                        href="{{ Route('frontend.single-product', $wishlist->product->slug) }}">
                                                        <img src="{{ asset($wishlist->product->thumbnail) }}"
                                                            alt="{{ $wishlist->product->name }}">
                                                    </a>
                                                </div>
                                                <h6 class="wishlist-title"><a
                                                        href="{{ Route('frontend.single-product', $wishlist->product->slug) }}">{{ $wishlist->product->name }}.</a>
                                                </h6>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @else
                                <article class="text-gray-600 text-base font-semibold" role="alert" data-alert="warning">
                                    <ul>
                                        <li>You have not placed any Product in Your Wishlist.</li>
                                    </ul>
                                </article>
                            @endif
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Wishlist Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.lnkdel', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.wishlist') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                        delete: 'true',
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Removed Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            $('#wishlist_item_' + id).remove();
                        }
                    }
                });
            });

        });
    </script>
@endpush
