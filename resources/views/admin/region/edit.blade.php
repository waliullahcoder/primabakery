@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="company_id" class="form-label"><b>Company Name</b></label>
            <select name="company_id" id="company_id" class="select form-select" data-placeholder="Select Company" required>
                <option value=""></option>
                @foreach ($companies as $company)
                    <option value="{{ $company->id }}" {{ $data->company_id == $company->id ? 'selected' : '' }}>
                        {{ $company->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="code" class="form-label"><b>Prefix</b></label>
            <input type="text" class="form-control custom-input" id="code" name="code" required
                value="{{ $data->code }}" placeholder="Prefix">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="name" class="form-label"><b>Region Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ $data->name }}" placeholder="Region Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="incharge_name" class="form-label"><b>Incharge Name</b></label>
            <input type="text" class="form-control custom-input" id="incharge_name" name="incharge_name"
                value="{{ $data->incharge_name }}" placeholder="Incharge Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="email" class="form-label"><b>Email</b></label>
            <input type="email" class="form-control custom-input" id="email" name="email"
                value="{{ $data->email }}" placeholder="Email">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="phone" class="form-label"><b>Phone No.</b></label>
            <input type="number" class="form-control custom-input" id="phone" name="phone"
                value="{{ $data->phone }}" placeholder="Phone">
        </div>
        <div class="col-12">
            <label for="address" class="form-label"><b>Address</b></label>
            <input type="text" name="address" id="address" class="form-control" placeholder="Address"
                value="{{ $data->address }}">
        </div>
    </div>
@endsection
