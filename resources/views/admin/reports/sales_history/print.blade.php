<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>{{ strip_tags($report_title) }}</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; font-size: 11px; color: #000; }
        .header { text-align: center; margin-bottom: 10px; }
        .header h2 { margin: 0; font-size: 18px; }
        .header p { margin: 2px 0; }
        .text-sm { font-size: 11px; font-weight: normal; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #444; padding: 4px 6px; }
        th { background: #eee; }
        .text-end { text-align: right; }
        .text-center { text-align: center; }
    </style>
</head>

<body>
    <div class="header">
        <h2>{!! $title !!}</h2>
        <p>{!! $informations !!}</p>
        <h3>{!! $report_title !!}</h3>
    </div>

    <table>
        <thead>
            <tr>
                <th class="text-center" width="40">SL#</th>
                <th>Date</th>
                <th>Invoice</th>
                <th>Client</th>
                <th>Store</th>
                <th>Staff</th>
                <th class="text-end">Amount</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($data as $row)
                <tr>
                    <td class="text-center">{{ $loop->iteration }}</td>
                    <td>{{ date('d-m-Y', strtotime($row->date)) }}</td>
                    <td>{{ $row->invoice }}</td>
                    <td>{{ $row->client->name ?? '' }}</td>
                    <td>{{ $row->store->name ?? '' }}</td>
                    <td>{{ $row->staff->name ?? '' }}</td>
                    <td class="text-end">{{ number_format($row->{\App\DataTables\SalesHistoryDataTable::AMOUNT_COLUMN}, 2) }}</td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <th colspan="6" class="text-end">Total</th>
                <th class="text-end">{{ number_format($total, 2) }}</th>
            </tr>
        </tfoot>
    </table>
</body>

</html>