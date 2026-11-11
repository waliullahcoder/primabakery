@extends('layouts.admin.report_app')

@section('form')
    <div class="row g-3">
        <div class="col-lg-4 col-md-12">
            <label for="date_range" class="form-label"><b>Date</b></label>
            <input type="text" class="form-control date-range" name="date_range" id="date_range"
                placeholder="{{ __('Select Date Range') }}" data-time-picker="true" data-format="DD-MM-Y"
                data-separator=" to " autocomplete="off"
                value="{{ $start_date ? date('d-m-Y', strtotime($start_date)) . ' to ' . date('d-m-Y', strtotime($end_date)) : '' }}">
        </div>
        <div class="col-lg-4 col-md-6">
            <label for="client_id" class="form-label"><b>Client</b></label>
            <select name="client_id[]" id="client_id" class="form-select select" data-placeholder="Select Client" multiple>
                <option value=""></option>
                @foreach ($clients as $client)
                    <option value="{{ $client->id }}" {{ in_array($client->id, $client_id) ? 'selected' : '' }}>
                        {{ $client->name }}
                    </option>
                @endforeach
            </select>
        </div>
        <div class="col-lg-4 col-md-6">
            <label for="staff_id" class="form-label"><b>Staff</b></label>
            <select name="staff_id[]" id="staff_id" class="form-select select" data-placeholder="Select Staff" multiple>
                <option value=""></option>
                @foreach ($staffs as $staff)
                    <option value="{{ $staff->id }}" {{ in_array($staff->id, $staff_id) ? 'selected' : '' }}>
                        {{ $staff->name }}
                    </option>
                @endforeach
            </select>
        </div>
    </div>
@endsection

@section('content')
    {!! $dataTable->table(['class' => 'dataTable table align-middle table-bordered'], true) !!}
@endsection

@push('js')
    <script type="text/javascript" src="{{ asset('vendor/datatables/buttons.server-side.js') }}"></script>
    {!! $dataTable->scripts() !!}

    <script type="text/javascript">
        $(document).ready(function() {
            var reportUrl = "{{ route('admin.sales-history.index') }}";

            // Filter button: page reload chara table reload
            $(document).on('click', '#filter_btn', function(e) {
                e.preventDefault();
                $('#dataTable').DataTable().ajax.reload();
            });

            // PDF print: notun tab e filter shoho open hobe
            $(document).on('click', '.getPdf', function(e) {
                e.preventDefault();
                var params = $.param({
                    print: 1,
                    date_range: $('#date_range').val(),
                    client_id: $('#client_id').val() || [],
                    staff_id: $('#staff_id').val() || [],
                });
                window.open(reportUrl + '?' + params, '_blank');
            });
        });
    </script>
@endpush