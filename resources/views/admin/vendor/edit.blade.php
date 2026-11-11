@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-3 col-sm-6">
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
        <div class="col-lg-3 col-sm-6">
            <label for="code" class="form-label"><b>Code</b></label>
            <input type="text" class="form-control custom-input" id="code" name="code" required
                value="{{ $data->code }}" placeholder="Code">
        </div>
        <div class="col-lg-3 col-sm-6">
            <label for="name" class="form-label"><b>Vendor Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ $data->name }}" placeholder="Vendor Name">
        </div>
        <div class="col-lg-3 col-sm-6">
            <label for="contact_person" class="form-label"><b>Contact Person</b></label>
            <input type="text" class="form-control custom-input" id="contact_person" name="contact_person"
                value="{{ $data->contact_person }}" placeholder="Contact Person">
        </div>
        <div class="col-lg-3 col-sm-6">
            <label for="email" class="form-label"><b>Contact Email</b></label>
            <input type="email" class="form-control custom-input" id="email" name="email"
                value="{{ $data->email }}" placeholder="Contact Email">
        </div>
        <div class="col-lg-3 col-sm-6">
            <label for="phone" class="form-label"><b>Contact Number</b></label>
            <input type="text" class="form-control custom-input" id="phone" name="phone"
                value="{{ $data->phone }}" placeholder="Contact Number">
        </div>
        <div class="{{ @$admin_setting->accounting == 1 ? 'col-lg-3' : 'col-lg-6' }} col-sm-6">
            <label for="address" class="form-label"><b>Contact Address</b></label>
            <input type="text" class="form-control custom-input" id="address" name="address"
                value="{{ $data->address }}" placeholder="Contact Address">
        </div>
        @if (@$admin_setting->accounting == 1)
            <div class="col-lg-3 col-sm-6">
                <label for="coa_setup_id" class="form-label"><b>Account Name</b></label>
                <select name="coa_setup_id" id="coa_setup_id" class="select form-select"
                    data-placeholder="Select Account Name">
                    <option value=""></option>
                    @foreach ($coas as $coa)
                        <option value="{{ $coa->id }}" {{ $data->coa_setup_id == $coa->id ? 'selected' : '' }}>
                            {{ $coa->head_name }} - {{ $coa->head_code }}
                        </option>
                    @endforeach
                </select>
            </div>
        @endif
    </div>
@endsection
