@extends('layouts.admin.edit_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="region_id" class="form-label"><b>Region Name</b></label>
            <select name="region_id" id="region_id" class="select form-select" data-placeholder="Select Region" required>
                <option value=""></option>
                @foreach ($regions as $region)
                    <option value="{{ $region->id }}" {{ $data->region_id == $region->id ? 'selected' : '' }}>
                        {{ $region->name }}
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
            <label for="name" class="form-label"><b>Area Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ $data->name }}" placeholder="Area Name">
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
