@extends('layouts.frontend.app')
@section('content')
    <section class="md:py-12 py-6">
        <div class="container mx-auto px-4">
            <div class="pb-6">
                <ol class="breadcrumb breadcrumb--ys pull-left">
                    <li class="home-link"><a href="{{ Route('frontend.home') }}"><i class="fa-solid fa-house"></i></a></li>
                    <li><span>Create Account</span></li>
                </ol>
            </div>
            <div class="text-center md:pb-10 pb-8">
                <h1 class="md:text-3xl text-2xl font-medium text-cyan-700 mb-4">Login Your Account</h1>
                <span class="inline-flex w-[100px] bg-red-400 h-1"></span>
            </div>
            <div class="px-5">
                <div
                    class="login-form-box max-w-[400px] w-full mx-auto p-5 border bg-white rounded-r-xl border-l-cyan-400 border-l-2 text-center">
                    <div id="login">
                        <h3 class="font-semibold text-red-500 mb-3">We've sent a 4-digit one time PIN in your phone <br>
                            {{ Session::get('phone_number') }}</h3>
                        <form id="otp_form" action="{{ Route('customer.send-otp') }}" method="POST">
                            @csrf
                            <input type="hidden" name="resend" value="1">
                            <input type="hidden" name="phone" value="{{ Session::get('phone_number') }}">
                        </form>
                        <form id="login-form" action="{{ Route('customer.login') }}" method="POST">
                            @csrf
                            <div class="input-group email mb-4">
                                <input type="hidden" name="phone" value="{{ Session::get('phone_number') }}">
                                <input class="form-control" type="number" id="otp" name="otp"
                                    placeholder="Please enter 4-digit one time pin"
                                    onKeyPress="if(this.value.length==4) return false;" required>
                            </div>
                            <div class="pt-5">
                                <button
                                    class="btn bg-red-400 text-white rounded-md px-10 py-2 hover:bg-cyan-500 transition-all duration-300 uppercase"
                                    type="submit">Submit</button>
                                <a href="#" id="resend_otp" class="text-gray-500">Resend OTP</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '#resend_otp', function(e) {
                e.preventDefault();
                $('#otp_form').submit();
            });
        });
    </script>
@endpush
