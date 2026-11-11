@extends('layouts.admin.app')

@section('content')
    <div class="card">
        <div class="card-header px-3 py-2">
            <div class="d-flex align-items-center justify-content-between gap-2">
                <h6 class="h6 mb-0 text-uppercase py-1">
                    {{ isset($title) ? $title : 'Please Set Title' }}
                </h6>
                <form method="get" action="{{ Route('admin.balance-sheet.index') }}">
                    <button type="submit" class="btn btn-sm btn-primary" name="print" value="print">Print</button>
                </form>
            </div>
        </div>
        <div class="card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 table-sm">
                            <thead>
                                <tr class="text-white bg-primary">
                                    <th>ASSETS</th>
                                    <td></td>
                                    <th class="text-end">AMOUNT</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $cAsset = 0;
                                    $fAsset = 0;
                                    $totalL = 0;
                                @endphp
                                @foreach ($data['assets'] as $asset)
                                    <tr class="bg-light">
                                        <th><u>{{ $asset['head'] }}</u></th>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    @foreach ($asset['childs'] as $key => $child)
                                        <tr>
                                            <td>{{ $child['name'] }}</td>
                                            <td class="text-center" width="30">=></td>
                                            <td class="text-end">
                                                {{ $child['amount'] >= 0 ? number_format($child['amount'], 2, '.', ',') : '(' . number_format(abs($child['amount']), 2, '.', ',') . ')' }}
                                            </td>
                                        </tr>
                                        @php
                                            if ($asset['head'] == 'Current Asset') {
                                                $cAsset += $child['amount'];
                                            } elseif ($asset['head'] == 'Fixed Asset') {
                                                $fAsset += $child['amount'];
                                            }
                                        @endphp
                                    @endforeach
                                    @if ($asset['head'] == 'Current Asset')
                                        <tr class="text-white bg-primary">
                                            <td colspan="2">Total Current Asset</td>
                                            <td class="text-end">
                                                {{ $cAsset >= 0 ? number_format($cAsset, 2, '.', ',') : '(' . number_format(abs($cAsset), 2, '.', ',') . ')' }}
                                            </td>
                                        </tr>
                                    @elseif ($asset['head'] == 'Fixed Asset')
                                        <tr class="text-white bg-primary">
                                            <th colspan="2">Total Fixed Asset</th>
                                            <th class="text-end">
                                                {{ $fAsset >= 0 ? number_format($fAsset, 2, '.', ',') : '(' . number_format(abs($fAsset), 2, '.', ',') . ')' }}
                                            </th>
                                        </tr>
                                    @endif
                                @endforeach
                                <tr class="text-white bg-primary">
                                    <th colspan="2">Closing Stock</th>
                                    <th class="text-end">
                                        {{ number_format($data['closing_stock'], 2, '.', ',') }}
                                    </th>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="table-responsive">
                        <table class="table table-bordered mb-0 table-sm">
                            <thead>
                                <tr class="text-white bg-primary">
                                    <th>LIABILITIES</th>
                                    <td></td>
                                    <th class="text-end">AMOUNT</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="bg-light">
                                    <th><u>Current Liabilities</u></th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                @foreach ($data['liabilities'] as $liability)
                                    @php
                                        if ($liability['head'] == 'Current Liabilities') {
                                            continue;
                                        }
                                        $totalChildL = 0;
                                    @endphp
                                    @foreach ($liability['childs'] as $child)
                                        @php
                                            $totalChildL += $child['amount'];
                                        @endphp
                                    @endforeach
                                    @php
                                        $totalL += $totalChildL;
                                    @endphp
                                    <tr>
                                        <td>{{ $liability['head'] }}</td>
                                        <td class="text-center" width="30">=></td>
                                        <td class="text-end">
                                            {{ $totalChildL >= 0 ? number_format($totalChildL, 2, '.', ',') : '(' . number_format(abs($totalChildL), 2, '.', ',') . ')' }}
                                        </td>
                                    </tr>
                                @endforeach
                                <tr class="text-white bg-primary">
                                    <th>Total Liabilities</th>
                                    <td>=></td>
                                    <th class="text-end">
                                        {{ $totalL >= 0 ? number_format($totalL, 2, '.', ',') : '(' . number_format(abs($totalL), 2, '.', ',') . ')' }}
                                    </th>
                                </tr>
                                <tr class="bg-light">
                                    <th><u>Profit & Loss:</u></th>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr class="bg-light">
                                    <th>Profit & Loss Balance</th>
                                    <td>=></td>
                                    <td class="text-end">
                                        {{ $data['currentPFL'] >= 0 ? number_format($data['currentPFL'], 2, '.', ',') : '(' . number_format(abs($data['currentPFL']), 2, '.', ',') . ')' }}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-12">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <table class="table table-bordered table-sm mb-0">
                                <thead>
                                    <tr class="text-white bg-primary">
                                        <th colspan="2">Total Assets</th>
                                        <th class="text-end">
                                            {{ number_format($cAsset + $fAsset + $data['closing_stock'], 2, '.', ',') }}
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="col-md-6">
                            <table class="table table-bordered table-sm mb-0">
                                <thead>
                                    <tr class="text-white bg-primary">
                                        <th colspan="2">Total Liabilities</th>
                                        <th class="text-end">
                                            {{ number_format($totalL + $data['currentPFL'], 2, '.', ',') }}
                                        </th>
                                    </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
