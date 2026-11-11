<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Branch;
use App\Models\Company;
use App\Models\Store;
use App\Services\ActionButtons\ActionButtons;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class StoreController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Store::with(['company', 'branch']);
            if (Auth::user()->store_id) {
                $model->where('id', Auth::user()->store_id);
            }
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
                    <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.store.edit', $row->id) . '" type="checkbox" name="status" ' . ($row->status == 1 ? 'checked' : '') . '>
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

        $title = "Store Setup";
        return view('admin.store.index', compact('title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        if (request()->ajax()) {
            $branches = Branch::where('company_id', request('company_id'))->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'branches' => $branches]);
        }

        $title = 'Add New Store';
        $companies = Company::orderBy('name', 'asc')->get();
        $branches = Branch::orderBy('name', 'asc')->get();
        return view('admin.store.create', compact('title', 'companies', 'branches'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'company_id' => 'required',
            'branch_id' => 'required',
            'code' => 'required',
            'name' => 'required',
        ]);

        $types = implode(',', $request->type);

        Store::create([
            'company_id' => $request->company_id,
            'branch_id' => $request->branch_id,
            'code' => $request->code,
            'type' => $types,
            'name' => $request->name,
            'address' => $request->address,
            'remarks' => $request->remarks,
            'created_by' => Auth::user()->id,
        ]);

        return redirect()->route('admin.store.index')->withSuccessMessage('Created Successfully!');
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
            $data = Store::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax()) {
            $branches = Branch::where('company_id', request('company_id'))->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'branches' => $branches]);
        }

        $title = 'Update Store';
        $data = Store::findOrFail($id);
        $link = Route('admin.store.update', $id);
        $companies = Company::orderBy('name', 'asc')->get();
        $branches = Branch::where('company_id', $data->company_id)->orderBy('name', 'asc')->get();
        return view('admin.store.edit', compact('title', 'data', 'link', 'companies', 'branches', 'id'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'company_id' => 'required',
            'branch_id' => 'required',
            'code' => 'required',
            'name' => 'required',
        ]);

        $types = implode(',', $request->type);

        $data = Store::findOrFail($id);
        $data->update([
            'company_id' => $request->company_id,
            'branch_id' => $request->branch_id,
            'code' => $request->code,
            'type' => $types,
            'name' => $request->name,
            'address' => $request->address,
            'remarks' => $request->remarks,
            'updated_by' => Auth::user()->id,
        ]);

        return redirect()->route('admin.store.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = Store::onlyTrashed()->findOrFail($id);
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $data = Store::onlyTrashed()->findOrFail($id);
                $data->forceDelete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = Store::onlyTrashed()->findOrFail($id);
            $data->forceDelete();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $data = Store::findOrFail($id);
                $data->update(['deleted_by' => Auth::user()->id]);
                $data->delete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $data = Store::findOrFail($id);
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
