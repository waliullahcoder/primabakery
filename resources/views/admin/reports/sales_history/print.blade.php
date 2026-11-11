
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>{{ strip_tags($report_title) }}</title>

    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 11px;
            color: #000;
        }

        .header {
            text-align: center;
            margin-bottom: 15px;
        }

        .header h2 {
            margin: 0;
            font-size: 18px;
        }

        .header p {
            margin: 3px 0;
        }

        .text-sm {
            font-size: 11px;
            font-weight: normal;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            border: 1px solid #444;
            padding: 5px 6px;
        }

        th {
            background: #eee;
            font-weight: bold;
        }

        .text-end {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        tfoot th {
            background: #e5e5e5;
            font-size: 11px;
        }

        .net-total {
            font-weight: bold;
        }
    </style>
</head>

<body>

    {{-- Header --}}
    <div class="header">

        <h2>{!! $title !!}</h2>

        <p>{!! $informations !!}</p>

        <h3>{!! $report_title !!}</h3>

    </div>

    {{-- Sales History Table --}}
    <table>

        <thead>
            <tr>
                <th class="text-center" width="35">SL#</th>
                <th>Date</th>
                <th>Invoice</th>
                <th>Client</th>
                <th>Store</th>
                <th>Staff</th>
                <th class="text-end">Amount</th>
                <th class="text-end">Discount</th>
                <th class="text-end">Net Total</th>
                <th class="text-end">Total Paid</th>
            </tr>
        </thead>

        <tbody>

            @foreach ($data as $row)

                @php
                    $amount = (float) ($row->total_amount ?? 0);
                    $discount = (float) ($row->discount ?? 0);
                    $netTotal = $amount - $discount;
                    $paid = (float) ($row->total_paid ?? 0);
                @endphp

                <tr>

                    {{-- SL --}}
                    <td class="text-center">
                        {{ $loop->iteration }}
                    </td>

                    {{-- Date --}}
                    <td>
                        {{ $row->date ? date('d-m-Y', strtotime($row->date)) : '' }}
                    </td>

                    {{-- Invoice --}}
                    <td>
                        {{ $row->invoice }}
                    </td>

                    {{-- Client --}}
                    <td>
                        {{ $row->client->name ?? '' }}
                    </td>

                    {{-- Store --}}
                    <td>
                        {{ $row->store->name ?? '' }}
                    </td>

                    {{-- Staff --}}
                    <td>
                        {{ $row->staff->name ?? '' }}
                    </td>

                    {{-- Amount --}}
                    <td class="text-end">
                        {{ number_format($amount, 2) }}
                    </td>

                    {{-- Discount --}}
                    <td class="text-end">
                        {{ number_format($discount, 2) }}
                    </td>

                    {{-- Net Total --}}
                    <td class="text-end net-total">
                        {{ number_format($netTotal, 2) }}
                    </td>

                    {{-- Total Paid --}}
                    <td class="text-end">
                        {{ number_format($paid, 2) }}
                    </td>

                </tr>

            @endforeach

        </tbody>

        {{-- Footer Total --}}
        <tfoot>

            <tr>

                <th colspan="6" class="text-end">
                    Grand Total
                </th>

                {{-- Total Amount --}}
                <th class="text-end">
                    {{ number_format($total, 2) }}
                </th>

                {{-- Total Discount --}}
                <th class="text-end">
                    {{ number_format($total_discount, 2) }}
                </th>

                {{-- Net Total --}}
                <th class="text-end">
                    {{ number_format($net_total, 2) }}
                </th>

                {{-- Total Paid --}}
                <th class="text-end">
                    {{ number_format($total_paid, 2) }}
                </th>

            </tr>

        </tfoot>

    </table>

</body>

</html>
