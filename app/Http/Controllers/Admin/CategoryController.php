<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\CategoryVendor;
use App\Models\Company;
use App\Models\Vendor;
use App\Services\ActionButtons\ActionButtons;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Category::with(['company', 'parent']);
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
                ->addColumn('image', function ($row) {
                    return file_exists($row->image) ? '<img src="' . asset($row->image) . '" height="40" alt="">' : 'No Image';
                })
                ->addColumn('status', function ($row) {
                    $status = '<div class="form-check form-switch">
                    <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.category.edit', $row->id) . '" type="checkbox" name="status" ' . ($row->status == 1 ? 'checked' : '') . '>
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
                ->rawColumns(['checkbox', 'image', 'status', 'actions'])
                ->make(true);
        }

        $title = "Category Setup";
        return view('admin.category.index', compact('title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $title = 'Add New Category';
        $companies = Company::orderBy('name')->get();
        $categories = Category::root()->with(['children'])->orderBy('name')->get();
        $vendors = Vendor::where('status', 1)->orderBy('name')->get();
        return view('admin.category.create', compact('title', 'companies', 'categories', 'vendors'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'company_id' => 'required',
            'vendor_id' => 'required',
            'name' => 'required',
            'image' => 'image|required',
        ]);

        $slug = Str::slug($request->name);
        $same_slug_count = Category::withTrashed()->where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        $image = $request->file('image');
        if (isset($image)) {
            $response = HelperClass::storeImage($image, 500, 'media/category/');
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = NULL;
            }
        } else {
            $path_name = NULL;
        }

        $data = Category::create([
            'company_id' => $request->company_id,
            'parent_id' => $request->parent_id,
            'name' => $request->name,
            'slug' => $slug,
            'image' => $path_name,
            'meta_title' => $request->meta_title,
            'meta_keyword' => $request->meta_keyword,
            'meta_description' => $request->meta_description,
            // 'featured' => $request->has('featured') ? 1 : 0,
            'status' => $request->has('status') ? 1 : 0,
            'show_frontend' => $request->has('show_frontend') ? 1 : 0,
            'created_by' => Auth::user()->id,
        ]);

        foreach ($request->vendor_id as $vendor_id) {
            CategoryVendor::create([
                'category_id' => $data->id,
                'vendor_id' => $vendor_id
            ]);
        }

        return redirect()->Route('admin.category.index')->withSuccessMessage('Created Successfully!');
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
            $data = Category::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $title = 'Update Category';
        $companies = Company::orderBy('name')->get();
        $categories = Category::root()->with(['children'])->orderBy('name')->get();
        $vendors = Vendor::where('status', 1)->orderBy('name')->get();
        $data = Category::findOrFail($id);
        $link = route('admin.category.update', $id);
        $selected_vendors = $data->vendors->pluck('vendor_id')->toArray();
        return view('admin.category.edit', compact('title', 'companies', 'categories', 'vendors', 'data', 'link', 'selected_vendors'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'company_id' => 'required',
            'vendor_id' => 'required',
            'name' => 'required',
            'image' => 'image',
        ]);

        $data = Category::findOrFail($id);
        $slug = Str::slug($request->name);
        $same_slug_count = Category::withTrashed()->whereNotIn('id', [$id])->where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        $image = $request->file('image');
        if (isset($image)) {
            $response = HelperClass::storeImage($image, 500, 'media/category/', $data->image);
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = $data->image;
            }
        } else {
            $path_name = $data->image;
        }

        $data->update([
            'company_id' => $request->company_id,
            'parent_id' => $request->parent_id,
            'name' => $request->name,
            'slug' => $slug,
            'image' => $path_name,
            'meta_title' => $request->meta_title,
            'meta_keyword' => $request->meta_keyword,
            'meta_description' => $request->meta_description,
            // 'featured' => $request->has('featured') ? 1 : 0,
            'status' => $request->has('status') ? 1 : 0,
            'show_frontend' => $request->has('show_frontend') ? 1 : 0,
            'updated_by' => Auth::user()->id,
        ]);

        CategoryVendor::where('category_id', $id)->delete();
        foreach ($request->vendor_id as $vendor_id) {
            CategoryVendor::create([
                'category_id' => $data->id,
                'vendor_id' => $vendor_id
            ]);
        }

        return redirect()->Route('admin.category.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = Category::onlyTrashed()->findOrFail($id);
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $data = Category::onlyTrashed()->findOrFail($id);
                if (count($data->products) == 0) {
                    if (file_exists($data->image)) {
                        unlink($data->image);
                    }
                    foreach ($data->vendors as $vendor) {
                        $vendor->delete();
                    }
                    $data->forceDelete();
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = Category::onlyTrashed()->findOrFail($id);
            if (count($data->products) == 0) {
                if (file_exists($data->image)) {
                    unlink($data->image);
                }
                foreach ($data->vendors as $vendor) {
                    $vendor->delete();
                }
                $data->forceDelete();
            } else {
                return response()->json(['status' => 'error']);
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $data = Category::findOrFail($id);
                $data->update(['deleted_by' => Auth::user()->id]);
                $data->delete();
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $data = Category::findOrFail($id);
        $data->update(['deleted_by' => Auth::user()->id]);
        $data->delete();

        return response()->json(['status' => 'success']);
    }
}
