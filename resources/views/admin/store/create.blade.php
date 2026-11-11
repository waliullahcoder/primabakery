@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 col-sm-6">
            <label for="code" class="form-label"><b>Prefix</b></label>
            <input type="text" class="form-control custom-input" id="code" name="code" required
                value="{{ old('code') }}" placeholder="Prefix">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="name" class="form-label"><b>Store Name</b></label>
            <input type="text" class="form-control custom-input" id="name" name="name" required
                value="{{ old('name') }}" placeholder="Store Name">
        </div>
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
            <label for="address" class="form-label"><b>Address</b></label>
            <input type="text" class="form-control custom-input" id="address" name="address" required
                value="{{ old('address') }}" placeholder="Address">
        </div>
        <div class="col-lg-4 col-sm-6">
            <label for="remarks" class="form-label"><b>Remarks</b></label>
            <input type="text" class="form-control custom-input" id="remarks" name="remarks" required
                value="{{ old('remarks') }}" placeholder="Remarks">
        </div>
        <div class="col-12">
            <label for="type" class="form-label"><b>Store Types</b></label>
            <div class="d-flex flex-wrap gap-2">
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="type1" name="type[]"
                        value="Product Stock">
                    <label class="form-check-label" for="type1">Product Stock</label>
                </div>
                {{-- <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="type2" name="type[]"
                        value="Production Floor (Raw/Finish)">
                    <label class="form-check-label" for="type2">Production Floor (Raw/Finish)</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="type3" name="type[]"
                        value="Finish Stock">
                    <label class="form-check-label" for="type3">Finish Stock</label>
                </div> --}}
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" id="type4" name="type[]"
                        value="Damage Stock">
                    <label class="form-check-label" for="type4">Damage Stock</label>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#company_id', function(e) {
                let company_id = $(this).val();
                let url = "{{ Route('admin.store.create') }}";
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
