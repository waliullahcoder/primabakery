@php
    $i = 1;
    $total_tr = 0;
@endphp
@if (@$rows)
    @php
        $total_tr += count($rows);
    @endphp
    @foreach ($rows as $item)
        <tr>
            <td class="text-center"><b>{{ $i++ }}</b></td>
            <td>{{ @$item->lifting->lifting_no }}</td>
            <td>
                @php
                    $info = DB::table('view_lifting_and_returns')
                        ->where('id', $item->lifting_id)
                        ->first();
                @endphp
                {{ @$info->payable_amount }}
                <input type="hidden" class="total_amount" name="total_amount[{{ $item->lifting_id }}]"
                    value="{{ @$info->payable_amount }}">
            </td>
            <td>
                {{ @$info->total_paid + @$info->return_amount }}
                <input type="hidden" class="prev_collection" id="prev_collection{{ $item->lifting_id }}"
                    name="prev_collection[{{ $item->lifting_id }}]"
                    value="{{ @$info->total_paid + @$info->return_amount }}">
            </td>
            <td>
                <input type="number" step=".01" id="curr_payment{{ $item->lifting_id }}"
                    name="curr_payment[{{ $item->lifting_id }}]" class="form-control py-1 curr_payment"
                    value="{{ $item->paid }}">
            </td>
            <td>
                <span class="due"
                    id="due_amount_span{{ $item->lifting_id }}">{{ round($info->payable_amount - $info->total_paid - $info->return_amount, 2) }}</span>
                <input type="hidden" class="due_amount" id="due_amount{{ $item->lifting_id }}"
                    name="due[{{ $item->lifting_id }}]"
                    value="{{ round($info->payable_amount - $info->total_paid - $info->return_amount + $item->paid, 2) }}">
            </td>
            <td width="60" class="text-center">
                <div class="custom-control custom-checkbox w-fit mx-auto ps-3">
                    <input type="checkbox" class="custom-control-input multi_checkbox" name="lifting_id[]"
                        value="{{ $item->lifting_id }}" checked id="{{ $item->lifting_id }}">
                    <label for="{{ $item->lifting_id }}" class="custom-control-label"></label>
                </div>
            </td>
        </tr>
    @endforeach
@endif

@if (@$new_rows)
    @php
        $total_tr += count($new_rows);
    @endphp
    @foreach ($new_rows as $item)
        <tr>
            <td class="text-center"><b>{{ $i++ }}</b></td>
            <td>{{ $item->lifting_no }}</td>
            <td>
                {{ $item->payable_amount }}
                <input type="hidden" class="total_amount" name="total_amount[{{ $item->id }}]"
                    value={{ $item->payable_amount }}">
            </td>
            <td>
                {{ $item->total_paid + $item->return_amount }}
                <input type="hidden" class="prev_collection" id="prev_collection{{ $item->id }}"
                    name="prev_collection[{{ $item->id }}]"
                    value="{{ $item->total_paid + $item->return_amount }}">
            </td>
            <td>
                <input type="number" step=".01" value="0" id="curr_payment{{ $item->id }}"
                    name="curr_payment[{{ $item->id }}]" class="form-control py-1 curr_payment">
            </td>
            <td>
                <span class="due"
                    id="due_amount_span{{ $item->id }}">{{ round($item->payable_amount - $item->total_paid - $item->return_amount, 2) }}</span>
                <input type="hidden" class="due_amount" id="due_amount{{ $item->id }}"
                    name="due[{{ $item->id }}]"
                    value="{{ round($item->payable_amount - $item->total_paid - $item->return_amount, 2) }}">
            </td>
            <td width="60" class="text-center">
                <div class="custom-control custom-checkbox w-fit mx-auto ps-3">
                    <input type="checkbox" class="custom-control-input multi_checkbox" name="lifting_id[]"
                        value="{{ $item->id }}" id="{{ $item->id }}">
                    <label for="{{ $item->id }}" class="custom-control-label"></label>
                </div>
            </td>
        </tr>
    @endforeach
@endif

<script type="text/javascript">
    $(document).ready(function() {
        $('#balance').val({{ $balance }});
        var total_tr = {{ $total_tr }};
        if (total_tr == $('.multi_checkbox:checked').length && $('.multi_checkbox:checked').length > 0) {
            $('#checkAll').prop('checked', true);
        } else {
            $('#checkAll').prop('checked', false);
        }
    });
</script>
