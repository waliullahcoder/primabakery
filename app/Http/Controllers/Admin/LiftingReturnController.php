<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AccessLog;
use App\Models\AccountTransaction;
use App\Models\AccountTransactionAuto;
use App\Models\AdminSetting;
use App\Models\CoaSetup;
use App\Models\Company;
use App\Models\LiftingProduct;
use App\Models\LiftingReturn;
use App\Models\LiftingReturnList;
use App\Models\Product;
use App\Models\Scopes\CompanyScope;
use App\Models\Store;
use App\Models\Vendor;
use App\Services\ActionButtons\ActionButtons;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class LiftingReturnController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = LiftingReturn::with(['company', 'vendor', 'store', 'staff'])->whereHas('list')->latest('id');
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
                ->addColumn('transfer_amount', function ($row) {
                    $amount = 0;
                    foreach ($row->list as $item) {
                        $amount += $item->amount - $item->lifting_discount;
                    }
                    return $amount;
                })
                ->addColumn('date', function ($row) {
                    return date('d-m-Y', strtotime($row->date));
                })
                ->addColumn('actions', function ($row) {
                    $type = request('type');
                    $data = [
                        'id' => $row->id,
                        'edit' => !empty($type) && $type == 'trash' ? false : true,
                    ];
                    $actionBtn = '<a class="btn btn-sm border-0 px-10px fs-15 btn-info" href="' . Route('admin.lifting-return.show', $row->id) . '" data-bs-toggle="tooltip" data-bs-placement="top" title="Print Voucher" target="_blank"><i class="fal fa-print"></i></a>';

                    $transaction = AccountTransaction::withTrashed()->where('voucher_no', $row->return_no)->where('voucher_type', 'Purchase Return')->first();
                    if (is_null($transaction)) {
                        return ActionButtons::actions($data, $actionBtn);
                    }
                    return '<div class="btn-group">' . $actionBtn . '</div>';

                    return ActionButtons::actions($data, $actionBtn);
                })
                ->rawColumns(['checkbox', 'actions'])
                ->make(true);
        }

        $title = "Purchase Return";
        return view('admin.lifting_return.index', compact('title'));
    }

    public function invoice()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $data = LiftingReturn::withoutGlobalScope(CompanyScope::class)->withTrashed()->select(['return_no'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->latest('id')->first();
        if ($data) {
            $trim = str_replace("STPR", '', $data->return_no);
            $dataPrefix = (int)$trim + 1;
            $invoice = "STPR" . $dataPrefix;
        } else {
            $invoice = "STPR" . date('y') . date('m') . '000001';
        }
        return $invoice;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(Request $request)
    {
        if ($request->ajax()) {
            $query = LiftingProduct::with(['vendor', 'product', 'lifting'])->where('vendor_id', $request->vendor_id)->whereColumn('qty', '>', 'return_qty');
            if (!empty($request->product_id)) {
                $query->whereIn('product_id', $request->product_id);
            }
            $data = $query->get();
            return response()->json(['status' => 'success', 'data' => $data]);
        }

        $title = 'Add New Purchase Return';
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', 1)->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $return_no = $this->invoice();
        return view('admin.lifting_return.create', compact('title', 'vendors', 'stores', 'products', 'return_no'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'vendor_id' => 'required',
            'store_id' => 'required',
            'date' => 'required',
            'return_no' => 'required',
            'remarks' => 'required',
            'lifting_product_id' => 'required',
        ]);

        $return_no = $this->invoice();
        $vendor = Vendor::find($request->vendor_id);
        $admin_setting = AdminSetting::first();
        if (@$admin_setting->accounting == 1 && is_null($vendor->coa)) {
            return redirect()->back()->withErrors('Please Setup a vendors account!');
        }
        DB::transaction(function () use ($request, $return_no, $admin_setting) {
            $amount = 0;
            foreach ($request->lifting_product_id as $lifting_product_id) {
                if ($request->return_qty[$lifting_product_id] == 0) {
                    continue;
                }
                $lifting_product = LiftingProduct::findOrFail($lifting_product_id);
                $amount += $lifting_product->lifting_price * $request->return_qty[$lifting_product_id];
            }

            $lifting_return = LiftingReturn::create([
                'company_id' => Auth::user()->company_id ?? 1,
                'vendor_id' => $request->vendor_id,
                'store_id' => $request->store_id,
                'return_no' => $return_no,
                'date' => date('Y-m-d', strtotime($request->date)),
                'amount' => $amount,
                'remarks' => $request->remarks,
                'created_by' => Auth::user()->id,
            ]);

            $log_data = '';
            foreach ($request->lifting_product_id as $lifting_product_id) {
                if ($request->return_qty[$lifting_product_id] == 0) {
                    continue;
                } else {
                    $lifting_product = LiftingProduct::findOrFail($lifting_product_id);
                    $log_data .= ' ' . $lifting_product->product->name . ' ' . $request->return_qty[$lifting_product_id] . ' ' . $lifting_product->product->attribute->name . ' ';

                    $discount = ($lifting_product->discount / $lifting_product->total_amount) * ($request->return_qty[$lifting_product_id] * $lifting_product->lifting_price);
                    $total_return_qty = $lifting_product->return_qty + $request->return_qty[$lifting_product_id];
                    $lifting_product->update(['return_qty' => $total_return_qty]);

                    LiftingReturnList::create([
                        'company_id' => Auth::user()->company_id ?? 1,
                        'lifting_return_id' => $lifting_return->id,
                        'vendor_id' => $request->vendor_id,
                        'store_id' => $request->store_id,
                        'lifting_product_id' => $lifting_product_id,
                        'product_id' => $lifting_product->product_id,
                        'lifting_price' => $lifting_product->lifting_price,
                        'qty' => $request->return_qty[$lifting_product_id],
                        'amount' => $request->return_qty[$lifting_product_id] * $lifting_product->lifting_price,
                        'lifting_discount' => $discount,
                        'remarks' => $request->remarks,
                    ]);
                }
            }

            $vendor = Vendor::find($request->vendor_id);
            if ($vendor->coa && @$admin_setting->accounting == 1) {
                $expense_head = CoaSetup::where('head_name', 'Product Purchase')->first();
                $headCode = collect([
                    '0' => $vendor->coa->head_code,
                    '1' => $expense_head->head_code
                ]);

                $debit_amount = collect([
                    '0' => $amount,
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => $amount,
                ]);

                $countHead = count($headCode);
                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('company_id', Auth::user()->company_id ?? 1)->where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'company_id' => Auth::user()->company_id ?? 1,
                        'voucher_no' => $lifting_return->return_no,
                        'voucher_type' => "Purchase Return",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Product Purchase Return Against Voucher No - ' . $lifting_return->return_no,
                        'debit_amount' => $debit_amount[$i],
                        'credit_amount' => $credit_amount[$i],
                        'created_by' => Auth::user()->id,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now()
                    ];
                }
                AccountTransactionAuto::insert($postData);
            }

            AccessLog::create([
                'date_time' => Carbon::now(),
                'page' => 'Purchase Return',
                'action' => 'Add',
                'description' => 'Create a new purchase Return with Return no ' . $lifting_return->return_no . ' to ' . $vendor->name . ' return amount is ' . $lifting_return->amount . ' products ' . $log_data . ' for reason ' . $request->remarks,
                'user_id' => Auth::user()->id,
            ]);
        });
        return redirect()->Route('admin.lifting-return.index')->withSuccessMessage('Created Successfully!');
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
        $data = LiftingReturn::findOrFail($id);
        $report_title = 'Purchase Return Voucher';
        // return view('admin.lifting_return.print', compact('title', 'informations', 'report_title', 'data'));
        $pdf = Pdf::loadView('admin.lifting_return.print', compact('title', 'informations', 'report_title', 'data'));
        return $pdf->stream('lifting_return_chalan_' . date('d_m_Y_H_i_s') . '.pdf');
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        if ($request->ajax()) {
            $query = LiftingProduct::with(['vendor', 'product', 'lifting'])->where('vendor_id', $request->vendor_id)->whereColumn('qty', '>', 'return_qty');
            if (!empty($request->product_id)) {
                $query->whereIn('product_id', $request->product_id);
            }
            $data = $query->get();
            return response()->json(['status' => 'success', 'data' => $data]);
        }

        $title = 'Update Purchase Return';
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', 1)->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $data = LiftingReturn::findOrFail($id);
        $link = Route('admin.lifting-return.update', $id);
        return view('admin.lifting_return.edit', compact('title', 'vendors', 'stores', 'products', 'data', 'link'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'vendor_id' => 'required',
            'store_id' => 'required',
            'date' => 'required',
            'return_no' => 'required',
            'remarks' => 'required',
            'lifting_product_id' => 'required',
        ]);

        $vendor = Vendor::find($request->vendor_id);
        $admin_setting = AdminSetting::first();
        if (@$admin_setting->accounting == 1 && is_null($vendor->coa)) {
            return redirect()->back()->withErrors('Please Setup a vendors account!');
        }
        DB::transaction(function () use ($request, $id, $admin_setting) {
            $amount = 0;
            foreach ($request->lifting_product_id as $key => $lifting_product_id) {
                $sales_list = LiftingProduct::findOrFail($lifting_product_id);
                $amount += $sales_list->lifting_price * $request->return_qty[$lifting_product_id];
            }

            $lifting_return = LiftingReturn::findOrFail($id);
            $lifting_return->update([
                'company_id' => Auth::user()->company_id ?? 1,
                'vendor_id' => $request->vendor_id,
                'store_id' => $request->store_id,
                'date' => date('Y-m-d', strtotime($request->date)),
                'amount' => $amount,
                'remarks' => $request->remarks,
                'updated_by' => Auth::user()->id,
            ]);

            $lifting_return_list = LiftingReturnList::where('lifting_return_id', $id)->get(['lifting_product_id', 'qty']);
            foreach ($lifting_return_list as $lifting_return_list_item) {
                $lifting_product = LiftingProduct::findOrFail($lifting_return_list_item->lifting_product_id);
                $return_qty = $lifting_product->return_qty - $lifting_return_list_item->qty;
                $lifting_product->update(['return_qty' => $return_qty]);
            }

            AccountTransactionAuto::withTrashed()->where('voucher_no', $lifting_return->return_no)->where('voucher_type', 'Purchase Return')->forceDelete();
            LiftingReturnList::where('lifting_return_id', $id)->delete();
            $log_data = '';
            foreach ($request->lifting_product_id as $lifting_product_id) {
                if ($request->return_qty[$lifting_product_id] == 0) {
                    continue;
                } else {
                    $lifting_product = LiftingProduct::findOrFail($lifting_product_id);
                    $log_data .= ' ' . $lifting_product->product->name . ' ' . $request->return_qty[$lifting_product_id] . ' ' . $lifting_product->product->attribute->name . ' ';

                    $discount = ($lifting_product->discount / $lifting_product->total_amount) * ($request->return_qty[$lifting_product_id] * $lifting_product->lifting_price);
                    $total_return_qty = $lifting_product->return_qty + $request->return_qty[$lifting_product_id];
                    $lifting_product->update(['return_qty' => $total_return_qty]);

                    LiftingReturnList::create([
                        'company_id' => Auth::user()->company_id ?? 1,
                        'lifting_return_id' => $lifting_return->id,
                        'vendor_id' => $request->vendor_id,
                        'store_id' => $request->store_id,
                        'lifting_product_id' => $lifting_product_id,
                        'product_id' => $lifting_product->product_id,
                        'lifting_price' => $lifting_product->lifting_price,
                        'qty' => $request->return_qty[$lifting_product_id],
                        'amount' => $request->return_qty[$lifting_product_id] * $lifting_product->lifting_price,
                        'lifting_discount' => $discount,
                        'remarks' => $request->remarks,
                    ]);
                }
            }

            $vendor = Vendor::findOrFail($request->vendor_id);
            if ($vendor->coa && @$admin_setting->accounting == 1) {
                $expense_head = CoaSetup::where('head_name', 'Product Purchase')->first();
                $headCode = collect([
                    '0' => $vendor->coa->head_code,
                    '1' => $expense_head->head_code
                ]);

                $debit_amount = collect([
                    '0' => $amount,
                    '1' => 0.00
                ]);

                $credit_amount = collect([
                    '0' => 0.00,
                    '1' => $amount,
                ]);

                $countHead = count($headCode);
                $postData = [];
                for ($i = 0; $i < $countHead; $i++) {
                    $coa = CoaSetup::where('company_id', Auth::user()->company_id ?? 1)->where('head_code', $headCode[$i])->first();
                    $postData[] = [
                        'company_id' => Auth::user()->company_id ?? 1,
                        'voucher_no' => $lifting_return->return_no,
                        'voucher_type' => "Purchase Return",
                        'voucher_date' => date('Y-m-d', strtotime($request->date)),
                        'coa_setup_id' => $coa->id,
                        'coa_head_code' => $headCode[$i],
                        'narration' => 'Product Purchase Return Against Voucher No - ' . $lifting_return->return_no,
                        'debit_amount' => $debit_amount[$i],
                        'credit_amount' => $credit_amount[$i],
                        'created_by' => Auth::user()->id,
                        'created_at' => Carbon::now(),
                        'updated_at' => Carbon::now()
                    ];
                }
                AccountTransactionAuto::insert($postData);
            }

            AccessLog::create([
                'date_time' => Carbon::now(),
                'page' => 'Purchase Return',
                'action' => 'Update',
                'description' => 'Update purchase Return against Return no ' . $lifting_return->return_no . ' to ' . $vendor->name . ' return amount is ' . $lifting_return->amount . ' products ' . $log_data . ' for reason ' . $request->remarks,
                'user_id' => Auth::user()->id,
            ]);
        });
        return redirect()->Route('admin.lifting-return.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            DB::transaction(function () use ($id) {
                $data = LiftingReturn::onlyTrashed()->findOrFail($id);
                $lifting_return_list = LiftingReturnList::where('lifting_return_id', $id)->get(['lifting_product_id', 'qty']);
                foreach ($lifting_return_list as $lifting_return_list_item) {
                    $lifting_product = LiftingProduct::findOrFail($lifting_return_list_item->lifting_product_id);
                    $return_qty = $lifting_product->return_qty + $lifting_return_list_item->qty;
                    $lifting_product->update(['return_qty' => $return_qty]);
                }
                AccountTransactionAuto::onlyTrashed()->where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->restore();
                $data->restore();
            });
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            $ids = request('id');
            DB::transaction(function () use ($ids) {
                foreach ($ids as $id) {
                    $data = LiftingReturn::onlyTrashed()->findOrFail($id);
                    AccountTransactionAuto::onlyTrashed()->where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->forceDelete();
                    $data->forceDelete();
                }
            });
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            DB::transaction(function () use ($id) {
                $data = LiftingReturn::onlyTrashed()->findOrFail($id);
                AccountTransactionAuto::onlyTrashed()->where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->forceDelete();
                $data->forceDelete();
            });
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            $ids = request('id');
            DB::transaction(function () use ($ids) {
                foreach ($ids as $id) {
                    $data = LiftingReturn::findOrFail($id);
                    $lifting_return_list = LiftingReturnList::where('lifting_return_id', $id)->get(['lifting_product_id', 'qty']);
                    foreach ($lifting_return_list as $lifting_return_list_item) {
                        $lifting_product = LiftingProduct::findOrFail($lifting_return_list_item->lifting_product_id);
                        $return_qty = $lifting_product->return_qty - $lifting_return_list_item->qty;
                        $lifting_product->update(['return_qty' => $return_qty]);
                    }

                    AccountTransactionAuto::where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->update(['deleted_by' => Auth::user()->id]);
                    AccountTransactionAuto::where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->delete();

                    $log_data = '';
                    foreach ($data->list as $item) {
                        $log_data .= ' ' . $item->product->name . ' ' . $item->qty . ' ' . $item->product->attribute->name . ' ';
                    }
                    AccessLog::create([
                        'date_time' => Carbon::now(),
                        'page' => 'Sales Return',
                        'action' => 'Delete',
                        'description' => 'Purchase return delete against return no ' . $data->return_no . ' on vendor ' . $data->vendor->name . ' products ' . $log_data,
                        'user_id' => Auth::user()->id,
                    ]);

                    $data->update(['deleted_by' => Auth::user()->id]);
                    $data->delete();
                }
            });
            return response()->json(['status' => 'success']);
        }

        DB::transaction(function () use ($id) {
            $data = LiftingReturn::findOrFail($id);
            $lifting_return_list = LiftingReturnList::where('lifting_return_id', $id)->get(['lifting_product_id', 'qty']);
            foreach ($lifting_return_list as $lifting_return_list_item) {
                $lifting_product = LiftingProduct::findOrFail($lifting_return_list_item->lifting_product_id);
                $return_qty = $lifting_product->return_qty - $lifting_return_list_item->qty;
                $lifting_product->update(['return_qty' => $return_qty]);
            }

            AccountTransactionAuto::where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->update(['deleted_by' => Auth::user()->id]);
            AccountTransactionAuto::where('voucher_no', $data->return_no)->where('voucher_type', 'Purchase Return')->delete();

            $log_data = '';
            foreach ($data->list as $item) {
                $log_data .= ' ' . $item->product->name . ' ' . $item->qty . ' ' . $item->product->attribute->name . ' ';
            }
            AccessLog::create([
                'date_time' => Carbon::now(),
                'page' => 'Sales Return',
                'action' => 'Delete',
                'description' => 'Purchase return delete against return no ' . $data->return_no . ' on vendor ' . $data->vendor->name . ' products ' . $log_data,
                'user_id' => Auth::user()->id,
            ]);

            $data->update(['deleted_by' => Auth::user()->id]);
            $data->delete();
        });

        return response()->json(['status' => 'success']);
    }
}
