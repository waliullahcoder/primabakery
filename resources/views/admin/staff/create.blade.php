@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="company_id" class="form-label"><b>Company Name</b></label>
            <select name="company_id" id="company_id" class="select form-select" data-placeholder="Select Company" required>
                <option value=""></option>
                @foreach ($companies as $company)
                    <option value="{{ $company->id }}"
                        {{ old('company_id') && old('company_id') == $company->id ? 'selected' : '' }}>{{ $company->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="branch_id" class="form-label"><b>Branch Name</b></label>
            <select name="branch_id" id="branch_id" class="select form-select" data-placeholder="Select Branch" required>
                <option value=""></option>
            </select>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="type" class="form-label"><b>Staff Type</b></label>
            <div class="custom-select">
                <select class="form-control custom-select__element" name="type" id="type">
                    <option value="general" {{ old('type') && old('type') == 'general' ? 'selected' : '' }}>General</option>
                    <option value="sales" {{ old('type') && old('type') == 'sales' ? 'selected' : '' }}>Sales</option>
                    <option value="driver" {{ old('type') && old('type') == 'driver' ? 'selected' : '' }}>Driver</option>
                    <option value="delivery_man" {{ old('type') && old('type') == 'delivery_man' ? 'selected' : '' }}>
                        Delivery Man
                    </option>
                </select>
            </div>
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="code" class="form-label"><b>Code</b></label>
            <input type="text" class="form-control custom-input" id="code" name="code" required
                value="{{ old('code') }}" placeholder="code">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="name" class="form-label"><b>Staff Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ old('name') }}" placeholder="Staff Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="short_name" class="form-label"><b>Display Name</b></label>
            <input type="text" class="form-control custom-input" id="short_name" name="short_name" required
                value="{{ old('short_name') }}" placeholder="Display Name">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="designation" class="form-label"><b>Designation</b></label>
            <input type="text" class="form-control custom-input" id="designation" name="designation"
                value="{{ old('designation') }}" placeholder="Designation">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="joining_date" class="form-label"><b>Joining Date</b></label>
            <input type="text" class="form-control custom-input date_picker" id="joining_date" name="joining_date"
                required value="{{ date('d-m-Y', strtotime(old('joining_date'))) }}" placeholder="Joining Date">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="email" class="form-label"><b>Email</b></label>
            <input type="email" class="form-control custom-input" id="email" name="email"
                value="{{ old('email') }}" placeholder="Email">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="phone" class="form-label"><b>Phone No.</b></label>
            <input type="text" class="form-control custom-input" id="phone" name="phone"
                value="{{ old('phone') }}" placeholder="Phone">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="national_id" class="form-label"><b>National ID</b></label>
            <input type="number" class="form-control custom-input" id="national_id" name="national_id"
                value="{{ old('national_id') }}" placeholder="National ID">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="ac_no" class="form-label"><b>A/C No.</b></label>
            <input type="text" class="form-control custom-input" id="ac_no" name="ac_no"
                value="{{ old('ac_no') }}" placeholder="A/C No.">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="ac_branch" class="form-label"><b>A/C Branch</b></label>
            <input type="text" class="form-control custom-input" id="ac_branch" name="ac_branch"
                value="{{ old('ac_branch') }}" placeholder="A/C Branch">
        </div>
        <div class="col-lg-8 col-sm-6">
            <label for="address" class="form-label"><b>Address</b></label>
            <input type="text" name="address" id="address" class="form-control" placeholder="Address"
                value="{{ old('address') }}">
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(".date_picker").datepicker({
                format: 'dd-mm-yyyy',
                changeMonth: true,
                changeYear: true,
            }).datepicker('setDate', 'today');

            $(document).on('change', '#company_id', function(e) {
                let company_id = $(this).val();
                let url = "{{ Route('admin.staff.create') }}";
                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        company_id: company_id,
                    },
                    success: function(response) {
                        if (response.status == 'success') {
                            $('#branch_id option').remove();
                            $('#branch_id').append('<option value=""></option>');
                            $.each(response.branches, function(key, value) {
                                var html = '<option value="' + value.id + '">' + value
                                    .name + '</option>';
                                $('#branch_id').append(html);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endpush
