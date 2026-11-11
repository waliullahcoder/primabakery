@extends('layouts.frontend.app')
@section('content')
    <section class="lg:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid md:gap-12 gap-8 grid-cols-12">
                @include('layouts.customer.menu')
                <div class="lg:col-span-8 xl:col-span-9 col-span-12">
                    <div class="dashboard-card">
                        <div class="mb-5">
                            <h3 class="mb-0 font-semibold text-red-500 uppercase">Your personal information</h3>
                            <span class="inline-block h-[2px] bg-red-400 w-[100px]"></span>
                        </div>
                        <form action="{{ Route('customer.profile') }}" method="POST">
                            @csrf
                            <div class="grid grid-cols-1 gap-4">
                                <div class="grid gap-3 grid-cols-12">
                                    <label class="col-span-2 form-label">
                                        Full name
                                    </label>
                                    <div class="col-span-10">
                                        <input class="form-control" name="name" type="text"
                                            value="{{ auth()->user()->name }}" placeholder="First name" required>
                                    </div>
                                </div>
                                <div class="grid gap-3 grid-cols-12">
                                    <label class="col-span-2 form-label">
                                        Email
                                    </label>
                                    <div class="col-span-10">
                                        <input class="form-control" name="email" type="email"
                                            value="{{ auth()->user()->email }}" placeholder="Email Address">
                                    </div>
                                </div>
                                <div class="grid gap-3 grid-cols-12">
                                    <label class="col-span-2 form-label">
                                        Phone
                                    </label>
                                    <div class="col-span-10">
                                        <input class="form-control" name="phone" type="number"
                                            value="{{ auth()->user()->phone }}" placeholder="Phone Number" readonly required>
                                    </div>
                                </div>
                                {{-- <div class="grid gap-3 grid-cols-12 items-center">
                                    <label class="col-span-2 form-label">
                                        Password
                                    </label>
                                    <div class="col-span-8">
                                        <div class="input-group">
                                            <input class="form-control" name="password" type="password"
                                                placeholder="Password" pattern=".{5,}">
                                        </div>
                                    </div>
                                    <label class="col-span-2 text-gray-400">
                                        Optional
                                    </label>
                                </div>
                                <div class="grid gap-3 grid-cols-12 items-center">
                                    <label class="col-span-2 form-label mb-0">
                                        New password
                                    </label>
                                    <div class="col-span-8">
                                        <div class="input-group">
                                            <input class="form-control" name="new_password" type="password"
                                                placeholder="New Password" pattern=".{5,}">
                                        </div>
                                    </div>
                                    <label class="col-span-2 text-gray-400">
                                        Optional
                                    </label>
                                </div> --}}
                                <div class="pt-2">
                                    <button type="submit" class="btn bg-red-400 text-white rounded-md px-8 py-2 hover:bg-cyan-500 transition-all duration-300 uppercase">SAVE</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Profile Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.show-password', function(e) {
                if ($(this).closest('.input-group').find('input').attr('type') == 'password') {
                    $(this).closest('.input-group').find('input').attr('type', 'text');
                    let icon = $(this).data('text-hide');
                    $(this).html(icon)
                } else {
                    $(this).closest('.input-group').find('input').attr('type', 'password');
                    let icon = $(this).data('text-show');
                    $(this).html(icon)
                }
            });
        });
    </script>
@endpush
