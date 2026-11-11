@extends('layouts.admin.create_app')

@section('content')
    <div class="row g-4">
        <div class="col-lg-6">
            <div class="row g-3">
                <div class="col-12">
                    <label for="name" class="form-label"><b>Product Name</b></label>
                    <input type="text" id="name" class="form-control" name="name" required
                        placeholder="Product Name." value="{{ old('name') }}">
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="min_order"><b>Min Order</b></label>
                    <input type="number" id="min_order" name="min_order" class="form-control" required
                        placeholder="Min Order" value="{{ old('min_order') ? old('min_order') : 1 }}" step="any">
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="alert_quantity"><b>Reorder Lavel</b></label>
                    <input type="number" id="alert_quantity" name="alert_quantity" class="form-control"
                        placeholder="Reorder Lavel" value="{{ old('alert_quantity') }}">
                </div>
                <div class="col-sm-6">
                    <label for="thumbnail" class="form-label"><b>Product thumbnail <span
                                class="text-danger">(600x600)</span></b></label>
                    <input type="file" name="thumbnail" id="thumbnail" class="form-control" required accept="image/*">
                    <div id="showThamb-wrapper" style="display: none;">
                        <img class="mt-2" src="" alt="" id="showThamb" height="60">
                    </div>
                </div>
                <div class="col-sm-6">
                    <label for="more_images" class="form-label"><b>Other Images <span
                                class="text-danger">(600x600)</span></b></label>
                    <input type="file" name="more_images[]" id="more_images" class="form-control" multiple
                        accept="image/*">
                    <div id="preview_image" class="pt-2" style="display: none;"></div>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <label class="form-label" for="attribute_id"><b>Measurement Unit</b></label>
                    <select name="attribute_id" id="attribute_id" class="form-control select" required
                        data-placeholder="{{ __('Choose Attributes') }}">
                        <option value=""></option>
                        @foreach ($attributes as $key => $attribute)
                            <option value="{{ $attribute->id }}">{{ $attribute->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <label class="form-label" for="show_on_website"><b>Show On Website</b></label>
                    <select name="show_on_website" id="show_on_website" class="form-select">
                        <option value="1" {{ old('show_on_website') && old('show_on_website') == 1 ? 'selected' : '' }}>Yes</option>
                        <option value="0" {{ old('show_on_website') && old('show_on_website') == 0 ? 'selected' : '' }}>No</option>
                    </select>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <label class="form-label" for="on_request"><b>On Request</b></label>
                    <select name="on_request" id="on_request" class="form-select">
                        <option value="1" {{ old('on_request') && old('on_request') == 1 ? 'selected' : '' }}>Yes</option>
                        <option value="0" {{ old('on_request') && old('on_request') == 0 ? 'selected' : '' }}>No</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="col-lg-6">
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label" for="parent_category"><b>Parent Category</b></label>
                    <select name="category_id" id="parent_category" class="select form-select" required
                        data-placeholder="Select Category..">
                        <option value=""></option>
                        @foreach ($pcategories as $key => $category)
                            <option value="{{ $category->id }}"
                                {{ old('category_id') && old('category_id') == $category->id ? 'selected' : '' }}>
                                {{ $category->name }}</option>
                        @endforeach
                    </select>
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="child_category"><b>Child Category</b></label>
                    <select name="category_id" id="child_category" class="select form-select"
                        data-placeholder="Choose.."></select>
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="subchild_category"><b>Subchild Category</b></label>
                    <select name="category_id" id="subchild_category" class="select form-select"
                        data-placeholder="Choose.."></select>
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="code"><b>Code</b></label>
                    <input type="text" name="code" id="code" class="form-control" placeholder="Code" value="{{ old('code') }}">
                </div>
                <div class="col-sm-6">
                    <label class="form-label" for="video"><b>Upload Product Video</b></label>
                    <input type="file" id="video" name="video" class="form-control" accept="video/*">
                </div>
                <div class="col-12">
                    <label class="form-label" for="video_id"><b>Product Video Url</b></label>
                    <input type="text" id="video_id" name="video_id" class="form-control"
                        placeholder="Youtube Video ID" value="{{ old('video_id') }}">
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4" id="vendor_price_area" style="display: none;">
        <div class="card-body">
            <div class="row g-3">
                <div class="col-12">
                    <label class="form-label" for="vendors"><b>Select Vendor</b></label>
                    <select name="vendors" id="vendors" class="select form-select" data-placeholder="Select Vendor..">
                        <option value=""></option>
                    </select>
                </div>
            </div>
            <table class="table table-bordered align-middle mb-0 mt-4" id="vendor_price_table" style="display: none;">
                <thead>
                    <tr>
                        <th>Vendor</th>
                        <th>Lifting Price</th>
                        <th>Sale Price</th>
                        <th>Online Price</th>
                        <th>CTN Size</th>
                    </tr>
                </thead>
                <tbody id="vendor_prices">

                </tbody>
            </table>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <div class="row g-3">
                <div class="col-12">
                    <label for="short_description" class="form-label">Short Description</label>
                    <textarea name="short_description" id="short_description" class="short_description" cols="30" rows="10">{!! old('short_description') !!}</textarea>
                </div>
                <div class="col-12">
                    <label for="description" class="form-label">Long Description</label>
                    <textarea name="description" id="description" class="description" cols="30" rows="10">{!! old('description') !!}</textarea>
                </div>
                <div class="col-12">
                    <label for="additional_info" class="form-label">Additional Information</label>
                    <textarea name="additional_info" id="additional_info" class="description" cols="30" rows="10">{!! old('additional_info') !!}</textarea>
                </div>
            </div>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <div class="row g-3">
                <div class="col-12">
                    <label for="meta_title" class="form-label">SEO Title</label>
                    <input type="text" id="meta_title" name="meta_title" class="form-control"
                        placeholder="SEO Title" value="{{ old('meta_title') }}">
                </div>
                <div class="col-12">
                    <label for="meta_keyword" class="form-label">SEO Keyword</label>
                    <textarea name="meta_keyword" id="meta_keyword" cols="30" rows="4" class="form-control"
                        placeholder="SEO Keyword">{{ old('meta_keyword') }}</textarea>
                </div>
                <div class="col-12">
                    <label for="meta_description" class="form-label">SEO Description</label>
                    <textarea name="meta_description" id="meta_description" cols="30" rows="4" class="form-control"
                        placeholder="SEO Description">{{ old('meta_description') }}</textarea>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            // Thumbail Image Preview
            function readFile(input) {
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('#showThamb').attr('src', e.target.result);
                    $('#showThamb-wrapper').show();
                }
                reader.readAsDataURL(input.files[0]);
            }
            $(document).on('change', '#thumbnail', function(event) {
                readFile(this);
            });

            // Manage Product Prices
            $('#regular_price').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount = $("#discount").val();

                var sale_price = regular_price - (regular_price * (discount / 100));

                $("#sale_price").val(sale_price);
            });
            $('#discount').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount = $("#discount").val();

                var dis_price = regular_price * (discount / 100);
                var sale_price = regular_price - (regular_price * (discount / 100));

                $("#discount_tk").val(Math.ceil(dis_price));
                $("#sale_price").val(Math.ceil(sale_price));
            });
            $('#discount_tk').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount_tk = $("#discount_tk").val();

                var sale_price = regular_price - discount_tk;
                var discount = (discount_tk * 100) / regular_price;

                $("#discount").val(Math.ceil(discount));
                $("#sale_price").val(sale_price);
            });
            $('#sale_price').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var sale_price = $("#sale_price").val();
                var discount_tk = $("#discount_tk").val();

                var diff = regular_price - sale_price;
                var discount = (diff / regular_price) * 100;
                if (regular_price == '') {
                    discount = 0;
                    diff = 0;
                    // regular_price = sale_price;
                }
                $("#discount").val(Math.ceil(discount));
                $("#discount_tk").val(diff);
                // $("#regular_price").val(regular_price);
            });

            // More Images Preview
            $(document).on('change', '#more_images', function() {
                $('#preview_image').html('');
                if (window.File && window.FileReader && window.FileList && window.Blob) {
                    var data = $(this)[0].files;
                    $.each(data, function(index, file) {
                        if (/(\.|\/)(gif|jpe?g|png)$/i.test(file.type)) {
                            var fRead = new FileReader();
                            fRead.onload = (function(file) {
                                return function(e) {
                                    var img = $('<img/>').addClass('thumb').attr('src',
                                        e.target.result).height(50);
                                    $('#preview_image').append(img);
                                };
                            })(file);
                            fRead.readAsDataURL(file);
                        }
                    });
                    $('#preview_image').show();
                } else {
                    alert("Your browser doesn't support File API!");
                }
            });

            // Append Child Categories Ajax
            $(document).on('change', '#parent_category', function(event) {
                let id = $(this).val();
                let url = "{{ Route('admin.product.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        id: id
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#subchild_category').empty();
                            $('#child_category').empty();
                            $('#child_category').append(
                                '<option value="" selected disabled> Choose.. </option>');
                            $.each(response.child_categories, function(key, value) {
                                $('#child_category').append('<option value="' + value
                                    .id + '">' + value.name + '</option>');
                            });
                            $('#vendors').empty();
                            $('#vendors').append('<option value=""> Choose Vendor.. </option>');
                            $('#vendors').append(response.html);
                            $('#vendor_prices').empty();
                            $('#vendor_price_table').hide();
                            $('#vendor_price_area').show();
                        }
                    }
                });
            });

            // Append SubChild Categories Ajax
            $(document).on('change', '#child_category', function(event) {
                event.preventDefault();
                let id = $(this).val();
                let url = "{{ Route('admin.product.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        id: id
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#subchild_category').empty();
                            $('#subchild_category').append(
                                '<option value="" disabled selected> Choose.. </option>');
                            $.each(response.child_categories, function(key, value) {
                                $('#subchild_category').append('<option value="' + value
                                    .id + '">' + value.name + '</option>');
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#choice_attributes', function() {
                var elements = '';
                $.each($("#choice_attributes option:selected"), function(j, attribute) {
                    if (j == 0) {
                        elements += '.attribute_parent';
                    }
                    elements += ':not(.attribute_parent_' + $(attribute).val() + ')';
                    flag = false;
                    $('input[name="choice_no[]"]').each(function(i, choice_no) {
                        if ($(attribute).val() == $(choice_no).val()) {
                            flag = true;
                        }
                    });
                    if (!flag) {
                        add_more_customer_choice_option($(attribute).val(), $(attribute).text());
                    }
                });
                if (elements == '') {
                    $('.attribute_parent').remove();
                }
                $(elements).remove();
                update_sku();
            });

            $(document).on('change', '#vendors', function(e) {
                let vendor_id = $(this).val();
                let vendor_name = $(this).find('option:selected').text();
                let html = '<tr>' +
                    '<td>' +
                    '<input type="hidden" name="vendor_id[]" id="vendor_' + vendor_id + '" value="' +
                    vendor_id + '">' +
                    '<div class="input-group"><button type="button" data-id="' + vendor_id +
                    '" data-name="' +
                    vendor_name +
                    '" class="vendor-remove input-group-text bg-danger border-danger text-white"><i class="far fa-trash-alt"></i></button><input type="text" class="form-control ps-3" value="' +
                    vendor_name + '" readonly placeholder="Vendor Name"></div>' +
                    '</td>' +
                    '<td>' +
                    '<input type="number" class="form-control" name="lifting_price[]" min="0" value="0" step="any" required>' +
                    '</td>' +
                    '<td>' +
                    '<input type="number" class="form-control" name="sale_price[]" min="0" value="0" step="any" required>' +
                    '</td>' +
                    '<td>' +
                    '<input type="number" class="form-control" name="online_price[]" min="0" value="0" step="any" required>' +
                    '</td>' +
                    '<td>' +
                    '<input type="number" class="form-control" name="ctn_size[]" min="0" value="0" step="any" required>' +
                    '</td>' +
                    '</tr>';

                if ($('vendor_' + vendor_id).length == 0) {
                    $('#vendor_prices').append(html);
                    $('#vendors option[value=' + vendor_id + ']').remove();
                } else {
                    Swal.fire({
                        position: 'top-end',
                        icon: 'error',
                        title: 'Vendor already added!',
                        showConfirmButton: false,
                        timer: 500
                    });
                }
                if ($('#vendor_prices tr').length > 0) {
                    $('#vendor_price_table').show();
                } else {
                    $('#vendor_price_table').show();
                }
            });

            $(document).on('click', '.vendor-remove', function(e) {
                e.preventDefault();
                let vendor_id = $(this).data('id');
                let vendor_name = $(this).data('name');
                $('#vendors').append('<option value="' + vendor_id + '"> ' + vendor_name + ' </option>');
                $(this).closest('tr').remove();
            })
        });
    </script>
@endpush
