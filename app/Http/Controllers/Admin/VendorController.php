<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminSetting;
use App\Models\CoaSetup;
use App\Models\Company;
use App\Models\Vendor;
use App\Services\ActionButtons\ActionButtons;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Vendor::with(['company']);
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
                ->addColumn('status', function ($row) {
                    $status = '<div class="form-check form-switch">
                    <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.vendor.edit', $row->id) . '" type="checkbox" name="status" ' . ($row->status == 1 ? 'checked' : '') . '>
                    </div>';
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $type = request('type');
                    $data = [
                        'id' => $row->id,
                        'edit' => !empty($type) && $type == 'trash' ? false : true,
                    ];
                    return ActionButtons::actions($data);
                })
                ->rawColumns(['checkbox', 'status', 'actions'])
                ->make(true);
        }

        $title = "Vendor Setup";
        return view('admin.vendor.index', compact('title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $title = 'Add New Vendor';
        $companies = Company::orderBy('name')->get();
        $client_coa_id = Vendor::whereNotNull('coa_setup_id')->get('coa_setup_id')->pluck('coa_setup_id')->toArray();
        $coas = CoaSetup::with('parent')->whereNotIn('id', $client_coa_id)->whereHas('parent', function ($query) {
            $query->where('head_name', 'Cash Payable');
        })->where('transaction', 1)->get();
        return view('admin.vendor.create', compact('title', 'companies', 'coas'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'company_id' => 'required',
            'code' => 'required',
            'name' => 'required',
        ]);
        $admin_setting = AdminSetting::first();
        if (@$admin_setting->accounting == 1) {
            $request->validate([
                'coa_setup_id' => 'required',
            ]);
        }
        Vendor::create([
            'company_id' => $request->company_id,
            'code' => $request->code,
            'name' => $request->name,
            'contact_person' => $request->contact_person,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'coa_setup_id' => $request->coa_setup_id,
            'created_by' => Auth::user()->id,
        ]);
        return redirect()->route('admin.vendor.index')->withSuccessMessage('Created Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        if (request()->ajax() && request('status')) {
            $data = Vendor::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $title = 'Update Vendor';
        $data = Vendor::findOrFail($id);
        $link = Route('admin.vendor.update', $id);
        $companies = Company::orderBy('name')->get();
        $client_coa_id = Vendor::whereNotIn('id', [$id])->whereNotNull('coa_setup_id')->get('coa_setup_id')->pluck('coa_setup_id')->toArray();
        $coas = CoaSetup::with('parent')->whereNotIn('id', $client_coa_id)->whereHas('parent', function ($query) {
            $query->where('head_name', 'Cash Payable');
        })->where('transaction', 1)->get();
        return view('admin.vendor.edit', compact('title', 'data', 'link', 'companies', 'coas'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'company_id' => 'required',
            'name' => 'required',
            'code' => 'required',
        ]);

        $data = Vendor::findOrFail($id);
        $data->update([
            'company_id' => $request->company_id,
            'code' => $request->code,
            'name' => $request->name,
            'contact_person' => $request->contact_person,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'coa_setup_id' => $request->coa_setup_id,
            'updated_by' => Auth::user()->id,
        ]);
        return redirect()->route('admin.vendor.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = Vendor::onlyTrashed()->findOrFail($id);
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $data = Vendor::onlyTrashed()->findOrFail($id);
                $data->forceDelete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = Vendor::onlyTrashed()->findOrFail($id);
            $data->forceDelete();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $data = Vendor::findOrFail($id);
                $data->update(['deleted_by' => Auth::user()->id]);
                $data->delete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $data = Vendor::findOrFail($id);
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
