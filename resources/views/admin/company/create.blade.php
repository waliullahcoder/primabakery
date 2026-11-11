@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="prefix" class="form-label"><b>Prefix</b></label>
            <input type="text" class="form-control custom-input" id="prefix" name="prefix" value="{{ old('prefix') }}"
                placeholder="Prefix">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="name" class="form-label"><b>Company Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ old('name') }}" placeholder="Company Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="username" class="form-label"><b>Username</b></label>
            <input type="text" class="form-control custom-input" id="username" name="username" required
                value="{{ old('username') }}" placeholder="Username">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="email" class="form-label"><b>Email</b></label>
            <input type="email" class="form-control custom-input" id="email" name="email" required
                value="{{ old('email') }}" placeholder="Email">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="phone" class="form-label"><b>Phone No.</b></label>
            <input type="text" class="form-control custom-input" id="phone" name="phone" required
                value="{{ old('phone') }}" placeholder="Phone">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="fax" class="form-label"><b>Hotline No.</b></label>
            <input type="text" class="form-control custom-input" id="fax" name="fax"
                value="{{ old('fax') }}" placeholder="Hotline No.">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="website" class="form-label"><b>Website</b></label>
            <input type="text" class="form-control custom-input" id="website" name="website"
                value="{{ old('website') }}" placeholder="Website">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="trade_license" class="form-label"><b>Trade License</b></label>
            <input type="text" class="form-control custom-input" id="trade_license" name="trade_license"
                value="{{ old('trade_license') }}" placeholder="Trade License">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="vat" class="form-label"><b>VAT</b></label>
            <input type="text" class="form-control custom-input" id="vat" name="vat"
                value="{{ old('vat') }}" placeholder="VAT">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="tin" class="form-label"><b>TIN</b></label>
            <input type="text" class="form-control custom-input" id="tin" name="tin"
                value="{{ old('tin') }}" placeholder="TIN">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="logo" class="form-label"><b>Logo</b></label>
            <input type="file" class="form-control custom-input" id="logo" name="logo" accept="image/*" required>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="address" class="form-label"><b>Address</b></label>
            <input type="text" name="address" id="address" class="form-control" placeholder="Address" value="{{ old('address') }}">
        </div>
    </div>
@endsection
