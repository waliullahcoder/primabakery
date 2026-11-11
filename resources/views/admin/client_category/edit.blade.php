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
            <label for="name" class="form-label"><b>Category Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ $data->name }}" placeholder="Category Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="status" class="form-label"><b>Status</b></label>
            <select name="status" id="status" class="form-select" required>
                <option value="1" {{ $data->status == 1 ? 'selected' : '' }}>Active</option>
                <option value="0" {{ $data->status == 0 ? 'selected' : '' }}>Deactive</option>
            </select>
        </div>
    </div>
@endsection
