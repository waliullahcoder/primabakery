@extends('layouts.frontend.app')
@section('content')
    <section class="lg:py-12 py-8 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid md:gap-12 gap-8 grid-cols-12">
                @include('layouts.customer.menu')
                <div class="lg:col-span-8 xl:col-span-9 col-span-12">
                    <div class="dashboard-card">
                        <div class="mb-5">
                            <h3 class="mb-0 font-semibold text-red-500 uppercase">Your Address</h3>
                            <span class="inline-block h-[2px] bg-red-400 w-[100px]"></span>
                        </div>
                        <form action="{{ Route('customer.address') }}" method="POST">
                            @csrf
                            <div class="pb-2">
                                <div class="flex mb-5 gap-4">
                                    <div class="flex gap-2 items-center">
                                        <input class="form-check-input" type="radio" id="home" name="address_type"
                                            {{ $address && $address->address_type == 'home' ? 'checked' : '' }}
                                            value="home">
                                        <label class="text-md uppercase font-medium text-gray-500 cursor-pointer" for="home">
                                            Home
                                        </label>
                                    </div>
                                    <div class="flex gap-2 items-center">
                                        <input class="form-check-input" type="radio" id="office"
                                            {{ $address && $address->address_type == 'office' ? 'checked' : '' }}
                                            name="address_type" value="office">
                                        <label class="text-md uppercase font-medium text-gray-500 cursor-pointer" for="office">
                                            Office
                                        </label>
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        Full Name
                                    </label>
                                    <div class="col-span-8">
                                        <input class="form-control" name="name" type="text"
                                            value="{{ $address ? $address->name : '' }}" placeholder="First name"
                                            required="">
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0">
                                        Email
                                    </label>
                                    <div class="col-span-8">
                                        <input class="form-control" name="email" type="email" placeholder="Email"
                                            value="{{ $address ? $address->email : '' }}">
                                    </div>
                                    <div class="col-span-2 label">
                                        Optional
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        Phone
                                    </label>
                                    <div class="col-span-8">
                                        <input class="form-control" name="phone" type="number" placeholder="Phone"
                                            value="{{ $address ? $address->phone : '' }}" required="">
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        Division
                                    </label>
                                    <div class="col-span-8">
                                        <select class="form-control form-control-select" name="division_id" id="division_id"
                                            required="">
                                            <option value="">-- Select Division --</option>
                                            @foreach ($divisions as $division)
                                                <option value="{{ $division->id }}"
                                                    {{ $address && $address->division_id == $division->id ? 'selected' : '' }}>
                                                    {{ $division->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        District
                                    </label>
                                    <div class="col-span-8">
                                        <select class="form-control form-control-select" name="district_id" id="district_id"
                                            required="">
                                            <option value="">-- Select District --</option>
                                            @foreach ($districts as $district)
                                                <option value="{{ $district->id }}"
                                                    {{ $address && $address->district_id == $district->id ? 'selected' : '' }}>
                                                    {{ $district->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        Upozila
                                    </label>
                                    <div class="col-span-8">
                                        <select class="form-control form-control-select" name="upozila_id" id="upozila_id"
                                            required="">
                                            <option value="">-- Select Upozila --</option>
                                            @foreach ($upozilas as $upozila)
                                                <option value="{{ $upozila->id }}"
                                                    {{ $address && $address->upozila_id == $upozila->id ? 'selected' : '' }}>
                                                    {{ $upozila->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 grid grid-cols-12 gap-5 items-center">
                                    <label class="col-span-2 form-label mb-0 required">
                                        Street
                                    </label>
                                    <div class="col-span-8">
                                        <textarea name="street" id="street" class="form-control h-auto" cols="30" rows="3" required
                                            placeholder="Street Address" spellcheck="false">{{ $address ? $address->street : '' }}</textarea>
                                    </div>
                                </div>
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
    <!-- End Wishlist Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#division_id', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.address') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_district =
                                "{{ $address ? $address->district_id : '' }}";
                            $('#district_id').html('');
                            $('#upozila_id').html('');
                            $('#upozila_id').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $('#district_id').append(
                                '<option value="" selected>-- Select District --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_district != '' && selected_district ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#district_id').append(option);
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#district_id', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.address') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_upozila =
                                "{{ $address ? $address->upozila_id : '' }}";
                            $('#upozila_id').html('');
                            $('#upozila_id').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_upozila != '' && selected_upozila ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#upozila_id').append(option);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endpush
