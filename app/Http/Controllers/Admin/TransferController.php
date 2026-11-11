<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AccessLog;
use App\Models\Company;
use App\Models\Product;
use App\Models\Scopes\CompanyScope;
use App\Models\Store;
use App\Models\Transfer;
use App\Models\TransferProduct;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Throwable;
use Yajra\DataTables\Facades\DataTables;

class TransferController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Transfer::with(['company', 'host', 'destination', 'staff', 'approveBy'])->latest('id');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input ' . (!empty(request('type')) && request('type') == "trash" ? 'trash_multi_checkbox' : 'multi_checkbox') . '" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('date', function ($row) {
                    return date('d-m-Y', strtotime($row->date));
                })
                ->addColumn('approve', function ($row) {
                    if ($row->approveBy) {
                        return $row->approveBy->name;
                    }
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">';
                    $type = request('type');
                    if ($row->approve == 0 && $row->reject == 0) {
                        if (!empty($type) && $type == 'trash') {
                            $actionBtn .= '<button type="button" class="btn btn-sm border-0 px-10px fs-15 tt btn-success link-recovery" data-url="' . Route('admin.transfer.destroy', $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Recovery"><i class="fad fa-recycle"></i></button>';
                        } else {
                            $actionBtn .= '<a href="' . Route('admin.transfer.edit', $row->id) . '" class="btn btn-sm btn-warning border-0 px-10px fs-15 tt link-edit" data-bs-toggle="tooltip" data-bs-placement="top" title="Edit"><i class="far fa-pencil-alt"></i></a>';
                        }
                    }
                    $actionBtn .= '<a class="btn btn-sm border-0 px-10px fs-15 tt btn-info" href="' . Route('admin.transfer.show', $row->id) . '" target="_blank" data-bs-toggle="tooltip" data-bs-placement="top" title="Print Voucher"><i class="fal fa-print"></i></a>';
                    if ($row->approve == 0 && $row->reject == 0) {
                        $actionBtn .= '<button type="button" class="btn btn-sm border-0 px-10px fs-15 tt btn-danger ' . (!empty($type) && $type == 'trash' ? 'trash_delete' : 'link-delete') . '" data-url="' . Route('admin.transfer.destroy', $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Delete"><i class="far fa-trash-alt"></i></button>';
                    }
                    $actionBtn .= '</div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'actions'])
                ->make(true);
        }

        $title = "Product Transfer";
        return view('admin.transfer.index', compact('title'));
    }

    public function invoice()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $data = Transfer::withoutGlobalScope(CompanyScope::class)->withTrashed()->select(['transfer_no'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->latest('id')->first();
        if ($data) {
            $trim = str_replace("ST", '', $data->transfer_no);
            $dataPrefix = (int)$trim + 1;
            $invoice = "ST" . $dataPrefix;
        } else {
            $invoice = "ST" . date('y') . date('m') . '000001';
        }
        return $invoice;
    }

    public static function stock($product_id, $store_id)
    {
        $liftings = DB::table('view_liftings')->whereNotNull('date')->where('product_id', $product_id)->where('store_id', $store_id)->sum('qty');
        $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->where('product_id', $product_id)->where('store_id', $store_id)->sum('qty');
        $client_sales = DB::table('view_sales')->whereNotNull('date')->where('product_id', $product_id)->where('store_id', $store_id)->sum('qty');
        $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->where('product_id', $product_id)->where('store_id', $store_id)->sum('qty');
        $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('product_id', $product_id)->where('store_id', $store_id)->sum('qty');
        $transfers = DB::table('view_transfers')->whereNotNull('date')->where('product_id', $product_id)->where('host_id', $store_id)->sum('qty');
        $receives = DB::table('view_transfers')->whereNotNull('date')->where('product_id', $product_id)->where('destination_id', $store_id)->sum('qty');
        return $liftings + $sales_returns + $receives - $lifting_returns - $client_sales - $online_sales - $transfers;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->ajax() && $request->has('get_destination_store')) {
            $destination_stores = Store::where('status', 1)->where('id', '!=', $request->host_id)->get();
            return response()->json(['status' => 'success', 'destination_stores' => $destination_stores]);
        }

        if ($request->ajax()) {
            $store_id = $request->host_id;
            $product_id = $request->product_id;
            $product = Product::with(['vendor'])->where('id', $product_id)->first();
            $stock = $this->stock($product_id, $store_id);
            $data = [
                'product' => $product,
                'stock' => $stock,
            ];
            return response()->json(['status' => 'success', 'data' => $data]);
        }

        $title = 'Add New Product Transfer';
        $stores = Store::where('status', 1)->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $transfer_no = $this->invoice();
        return view('admin.transfer.create', compact('title', 'stores', 'products', 'transfer_no'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'transfer_no' => 'required',
            'host_id' => 'required',
            'destination_id' => 'required',
            'date' => 'required',
            'product_id' => 'required',
        ]);

        try {
            $transfer_no = $this->invoice();
            DB::transaction(function () use ($request, $transfer_no) {

                $total_amount = 0;
                foreach ($request->product_id as $product_id) {
                    $product = Product::findOrFail($product_id);
                    $total_amount += $product->lifting_price * $request->transfer_qty[$product_id];
                }

                $transfer = Transfer::create([
                    'company_id' => Auth::user()->company_id ?? 1,
                    'transfer_no' => $transfer_no,
                    'destination_id' => $request->destination_id,
                    'host_id' => $request->host_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'total_amount' => $total_amount,
                    'remarks' => $request->remarks,
                    'created_by' => Auth::user()->id,
                ]);

                $log_data = '';
                foreach ($request->product_id as $product_id) {
                    if ($request->transfer_qty[$product_id] == 0) {
                        continue;
                    } else {
                        $store_id = $request->host_id;
                        $stock = $this->stock($product->id, $store_id);
                        $product = Product::findOrFail($product_id);
                        if ($request->transfer_qty[$product_id] > $stock) {
                            throw new Exception('stock not available please decrease quantity for ' . $product->name);
                        } else {
                            $log_data .= $product->name . ' ' . $request->transfer_qty[$product_id] . ' ' . $product->attribute->name . ' ';
                            TransferProduct::create([
                                'company_id' => Auth::user()->company_id ?? 1,
                                'transfer_id' => $transfer->id,
                                'product_id' => $product_id,
                                'qty' => $request->transfer_qty[$product_id],
                                'amount' => $request->transfer_qty[$product_id] * $product->lifting_price,
                            ]);
                        }
                    }
                }

                $host = Store::find($request->host_id);
                $destination = Store::find($request->destination_id);
                AccessLog::create([
                    'date_time' => Carbon::now(),
                    'page' => 'Transfer',
                    'action' => 'Add',
                    'description' => 'Create a new transfer with transfer no ' . $transfer->transfer_no . ' from ' . $host->name . ' to ' . $destination->name . ' ' . $log_data,
                    'user_id' => Auth::user()->id,
                ]);
            });
        } catch (Throwable $caught) {
            if ($caught) {
                return redirect()->back()->withErrors('Stock not available!');
            }
        }
        return redirect()->Route('admin.transfer.index')->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        if (Auth::user()->company_id) {
            $company = Company::find(Auth::user()->company_id);
            $title = $company->name;
            $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
        } else {
            $title = 'Company Name Goes Here.';
            $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
        }
        $data = Transfer::findOrFail($id);
        $report_title = 'Transfer Chalan';
        // return view('admin.transfer.print', compact('title', 'informations', 'report_title', 'data'));
        $pdf = Pdf::loadView('admin.transfer.print', compact('title', 'informations', 'report_title', 'data'));
        return $pdf->stream('transfer_chalan_' . date('d_m_Y_H_i_s') . '.pdf');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        if ($request->ajax() && $request->has('get_destination_store')) {
            $destination_stores = Store::where('status', 1)->where('id', '!=', $request->host_id)->get();
            return response()->json(['status' => 'success', 'destination_stores' => $destination_stores]);
        }

        if ($request->ajax()) {
            $store_id = $request->host_id;
            $product_id = $request->product_id;
            $product = Product::with(['vendor'])->where('id', $product_id)->first();
            $stock = $this->stock($product_id, $store_id);

            $transfer = Transfer::findOrFail($id);
            $transfer_product = $transfer->list->where('product_id', $product_id)->first();
            $data = [
                'product' => $product,
                'stock' => $transfer_product ? $transfer_product->qty + $stock : $stock,
            ];
            return response()->json(['status' => 'success', 'data' => $data]);
        }

        $title = 'Update Product Transfer';
        $data = Transfer::findOrFail($id);
        $host_stores = Store::where('id', '!=', $data->destination_id)->where('status', 1)->get();
        $destination_stores = Store::where('id', '!=', $data->host_id)->where('status', 1)->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $link = Route('admin.transfer.update', $id);
        return view('admin.transfer.edit', compact('title', 'host_stores', 'destination_stores', 'products', 'data', 'link'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'transfer_no' => 'required',
            'host_id' => 'required',
            'destination_id' => 'required',
            'date' => 'required',
            'product_id' => 'required',
        ]);

        try {
            DB::transaction(function () use ($request, $id) {
                $total_amount = 0;
                foreach ($request->product_id as $product_id) {
                    $product = Product::findOrFail($product_id);
                    $total_amount += $product->lifting_price * $request->transfer_qty[$product_id];
                }

                $transfer = Transfer::findOrFail($id);
                $transfer->update([
                    'destination_id' => $request->destination_id,
                    'host_id' => $request->host_id,
                    'date' => date('Y-m-d', strtotime($request->date)),
                    'total_amount' => $total_amount,
                    'remarks' => $request->remarks,
                    'updated_by' => Auth::user()->id,
                ]);

                TransferProduct::where('transfer_id', $id)->delete();
                $log_data = '';
                foreach ($request->product_id as $product_id) {
                    if ($request->transfer_qty[$product_id] == 0) {
                        continue;
                    } else {
                        $store_id = $request->host_id;
                        $stock = $this->stock($product->id, $store_id);
                        $product = Product::findOrFail($product_id);
                        if ($request->transfer_qty[$product_id] > $stock) {
                            throw new Exception('stock not available please decrease quantity for ' . $product->name);
                        } else {
                            $log_data .= $product->name . ' ' . $request->transfer_qty[$product_id] . ' ' . $product->attribute->name . ' ';
                            TransferProduct::create([
                                'company_id' => Auth::user()->company_id ?? 1,
                                'transfer_id' => $transfer->id,
                                'product_id' => $product_id,
                                'qty' => $request->transfer_qty[$product_id],
                                'amount' => $request->transfer_qty[$product_id] * $product->lifting_price,
                            ]);
                        }
                    }
                }

                $host = Store::find($request->host_id);
                $destination = Store::find($request->destination_id);
                AccessLog::create([
                    'date_time' => Carbon::now(),
                    'page' => 'Transfer',
                    'action' => 'Update',
                    'description' => 'Update transfer against transfer no ' . $transfer->transfer_no . ' from ' . $host->name . ' to ' . $destination->name . ' ' . $log_data,
                    'user_id' => Auth::user()->id,
                ]);
            });
        } catch (Throwable $caught) {
            if ($caught) {
                return redirect()->back()->withErrors('Stock not available!');
            }
        }

        return redirect()->Route('admin.transfer.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = Transfer::onlyTrashed()->findOrFail($id);
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $transfer = Transfer::onlyTrashed()->findOrFail($id);
                $transfer->forceDelete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $transfer = Transfer::onlyTrashed()->findOrFail($id);
            $transfer->forceDelete();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $data = Transfer::findOrFail($id);
                AccessLog::create([
                    'date_time' => Carbon::now(),
                    'page' => 'Transfer',
                    'action' => 'Delete',
                    'description' => 'Transfer delete against transfer no ' . $data->transfer_no,
                    'user_id' => Auth::user()->id,
                ]);
                $data->update(['deleted_by' => Auth::user()->id]);
                $data->delete();
            }
            return response()->json(['status' => 'success']);
        }

        $data = Transfer::findOrFail($id);
        AccessLog::create([
            'date_time' => Carbon::now(),
            'page' => 'Transfer',
            'action' => 'Delete',
            'description' => 'Transfer delete against transfer no ' . $data->transfer_no,
            'user_id' => Auth::user()->id,
        ]);
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
