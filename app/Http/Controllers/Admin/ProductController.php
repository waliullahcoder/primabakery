<?php

namespace App\Http\Controllers\Admin;

use App\HelperClass;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\CategoryVendor;
use App\Models\Vendor;
use App\Models\ProductPrice;
use App\Services\ActionButtons\ActionButtons;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Product::with(['company', 'orderProducts', 'price', 'vendor', 'attribute'])
                ->orderBy('name', 'asc');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input ';
                    if (!empty(request('type')) && request('type') == "trash") {
                        $checkbox .= 'trash_multi_checkbox';
                    } else {
                        $checkbox .= 'multi_checkbox';
                    }
                    $checkbox .= '" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('image', function ($row) {
                    return file_exists($row->thumbnail) ? '<img src="' . asset($row->thumbnail) . '" height="50" alt="' . $row->name . '">' : 'No Image';
                })
                ->addColumn('lifting_price', function ($row) {
                    return $row->price->lifting_price . ' TK';
                })
                ->addColumn('sale_price', function ($row) {
                    return $row->price->sale_price . ' TK';
                })
                ->addColumn('discount', function ($row) {
                    return $row->price->discount_tk . ' TK';
                })
                ->addColumn('category', function ($row) {
                    if ($row->category) {
                        return $row->category->name;
                    }
                })
                ->addColumn('status', function ($row) {
                    $status = '<div class="form-check form-switch">
                    <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.product.edit', $row->id) . '" type="checkbox" name="status" ' . ($row->status == 1 ? 'checked' : '') . '>
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
        $title = 'Product Setup';
        return view('admin.product.index', compact('title'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        if (request()->ajax()) {
            $child_categories = Category::where('parent_id', request('id'))->where('status', 1)->get();
            $vendors = CategoryVendor::where('category_id', request('id'))->get();
            $html = '';
            foreach ($vendors as $vendor) {
                $html .= "<option value='{$vendor->vendor_id}'>{$vendor->vendor->name}</option>";
            }
            return response()->json(['status' => 'success', 'child_categories' => $child_categories, 'html' => $html]);
        }

        $title = 'Add New Product';
        $pcategories =  Category::root()->where('status', 1)->get();
        $attributes = Attribute::where('status', 1)->orderBy('name', 'asc')->get();
        // $vendors = Vendor::where('category_id', request('id'))->get();
        return view('admin.product.create', compact('title', 'pcategories', 'attributes'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'vendor_id' => 'required',
                'attribute_id' => 'required',
                'thumbnail' => 'image|required',
                'category_id' => 'required',
                'show_on_website' => 'required',
                'on_request' => 'required',
                'video' => 'max:15360',
            ],
            [
                'video.max' => 'Can not Upload video larget than 15MB'
            ]
        );

        foreach ($request->vendor_id as $key => $vendor_id) {
            $duplicate_check = Product::withTrashed()->where('name', $request->name)->where('code', $request->code)->where('vendor_id', $vendor_id)->first();
            if (!is_null($duplicate_check)) {
                return redirect()->back()->withErrors('Product Already Exist!');
            }
        }
        // Product Video
        $video = $request->file('video');
        if (isset($video)) {
            $video_name = 'product-video-' . uniqid() . '.' . $video->getClientOriginalExtension();
            $upload_path = 'media/video/';
            $video_path_name = $upload_path . $video_name;
            $video->move($upload_path, $video_name);
        } else {
            $video_path_name = NULL;
        }

        // Product Thumbnail
        $thumbnail = $request->file('thumbnail');
        if (isset($thumbnail)) {
            $response = HelperClass::storeImage($thumbnail, 800, 'media/product/');
            if ($response['status'] == 'success') {
                $thumbnail_path_name =  $response['path_name'];
            } else {
                $thumbnail_path_name = NULL;
            }
        } else {
            $thumbnail_path_name = NULL;
        }

        // Product Other Images
        $more_images = $request->file('more_images');
        if (isset($more_images)) {
            foreach ($more_images as $key => $more_image) {
                $response = HelperClass::storeImage($more_image, 800, 'media/product/');
                if ($response['status'] == 'success') {
                    $img_arr[$key] = $response['path_name'];
                }
            }
            $more_images_path_names = trim(implode('|', $img_arr), '|');
        } else {
            $more_images_path_names = NULL;
        }


        foreach ($request->vendor_id as $key => $vendor_id) {
            $slug = Str::slug($request->name);
            $same_slug_count = Product::withTrashed()->where('slug', 'LIKE', $slug . '%')->count();
            $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
            $slug .= $slug_suffix;
            // Store Product
            $product = Product::create([
                'company_id' => Auth::user()->company_id ?? 1,
                'vendor_id' => $vendor_id,
                'attribute_id' => $request->attribute_id,
                'category_id' => $request->category_id,
                // 'brand_id' => $request->brand_id,
                'code' => $request->code,
                'name' => $request->name,
                'slug' => $slug,
                'thumbnail' => $thumbnail_path_name,
                'more_images' => $more_images_path_names,
                'short_description' => $request->short_description,
                'description' => $request->description,
                'additional_info' => $request->additional_info,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
                'meta_keyword' => $request->meta_keyword,
                'alert_quantity' => $request->alert_quantity,
                'min_order' => $request->min_order,
                'show_on_website' => $request->show_on_website,
                'on_request' => $request->on_request,
                'video' => $video_path_name,
                'video_id' => $request->video_id,
                'ctn_size' => $request->ctn_size[$key],
                'created_by' => Auth::user()->id,
            ]);

            // Add Product Price
            ProductPrice::create([
                'product_id' => $product->id,
                'lifting_price' => $request->lifting_price[$key],
                'sale_price' => $request->sale_price[$key],
                'online_price' => $request->online_price[$key],
                'discount' => isset($request->discount[$key]) ? $request->discount[$key] : 0,
                'discount_tk' => isset($request->discount_tk[$key]) ? $request->discount_tk[$key] : 0,
            ]);
        }

        return redirect()->route('admin.product.index')->withSuccessMessage('Added Successfully!');
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
        if (request()->ajax() && request()->has('status')) {
            $data = Product::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax() && request()->has('getCategories')) {
            $child_categories = Category::where('parent_id', request('id'))->where('status', 1)->get();
            $vendors = CategoryVendor::where('category_id', request('id'))->get();
            $html = '';
            foreach ($vendors as $vendor) {
                $html .= "<option value='{$vendor->vendor_id}'>{$vendor->vendor->name}</option>";
            }
            return response()->json(['status' => 'success', 'child_categories' => $child_categories, 'html' => $html]);
        }

        $data = Product::findOrFail($id);
        $link = Route('admin.product.update', $data->id);
        $parent_id = NULL;
        $child_id = NULL;
        $subchild_id = NULL;

        $product_category = $data->category;
        if ($product_category->parent_id) {
            $check_parent = Category::findOrFail($product_category->parent_id);
            if ($check_parent->parent_id) {
                $parent_id = $check_parent->parent_id;
                $child_id = $check_parent->id;
                $subchild_id = $data->category->id;
            } else {
                $parent_id = $check_parent->id;
                $child_id = $data->category->id;
            }
        } else {
            $parent_id = $data->category->id;
        }

        $parent_categories =  Category::root()->where('status', 1)->get();
        $child_categories = Category::where('parent_id', $parent_id)->get();
        $subchild_categories = Category::where('parent_id', $child_id)->get();
        $title = 'Update Product';
        $attributes = Attribute::where('status', 1)->orderBy('name', 'asc')->get();
        $vendors = CategoryVendor::where('category_id', $data->category_id)->get();
        return view('admin.product.edit', compact('title', 'attributes', 'data', 'link', 'parent_id', 'child_id', 'subchild_id', 'parent_categories', 'child_categories', 'subchild_categories', 'vendors'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate(
            [
                'name' => 'required',
                'attribute_id' => 'required',
                'video' => 'max:15360',
                'show_on_website' => 'required',
                'on_request' => 'required',
            ],
            [
                'video.max' => 'Can not Upload video larget than 15MB'
            ]
        );

        $duplicate_check = Product::withTrashed()->where('id', '!=', $id)->where('name', $request->name)->where('code', $request->code)->where('vendor_id', $request->vendors)->first();
        if (!is_null($duplicate_check)) {
            return redirect()->back()->withErrors('Product Already Exist!');
        }

        $product = Product::findOrFail($id);

        // Product Video
        $video = $request->file('video');
        if (isset($video)) {
            $video_name = 'product-video-' . uniqid() . '.' . $video->getClientOriginalExtension();
            $upload_path = 'media/video/';
            $video_path_name = $upload_path . $video_name;
            $video->move($upload_path, $video_name);
            if (file_exists($product->video)) {
                unlink($product->video);
            }
        } else {
            $video_path_name = $product->video;
        }

        // Product Thumbnail
        $thumbnail = $request->file('thumbnail');
        if (isset($thumbnail)) {
            $response = HelperClass::storeImage($thumbnail, 800, 'media/product/', $product->thumbnail);
            if ($response['status'] == 'success') {
                $thumbnail_path_name =  $response['path_name'];
            } else {
                $thumbnail_path_name = $product->thumbnail;
            }
        } else {
            $thumbnail_path_name = $product->thumbnail;
        }

        // Product Other Images
        $more_images = $request->file('more_images');
        if (isset($more_images)) {
            foreach ($more_images as $key => $more_image) {
                $response = HelperClass::storeImage($more_image, 800, 'media/product/');
                if ($response['status'] == 'success') {
                    $img_arr[$key] = $response['path_name'];
                }
            }
            $more_images_path_names = trim(implode('|', $img_arr), '|');

            $old_more_images = explode('|', $product->more_images);
            foreach ($old_more_images as $key => $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        } else {
            $more_images_path_names = $product->more_images;
        }

        if ($request->name == $product->name) {
            $slug = $product->slug;
        } else {
            $slug = Str::slug($request->name);
            $same_slug_count = Product::withTrashed()->where('slug', 'LIKE', $slug . '%')->whereNotIn('id', [$id])->count();
            $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
            $slug .= $slug_suffix;
        }

        // Update Product
        $product->update([
            'company_id' => Auth::user()->company_id ?? 1,
            'attribute_id' => $request->attribute_id,
            'category_id' => isset($request->category_id) ? $request->category_id : $product->category_id,
            // 'brand_id' => $request->brand_id,
            'vendor_id' => $request->vendors,
            'name' => $request->name,
            'code' => $request->code,
            'slug' => $slug,
            'thumbnail' => $thumbnail_path_name,
            'more_images' => $more_images_path_names,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'additional_info' => $request->additional_info,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keyword' => $request->meta_keyword,
            'alert_quantity' => $request->alert_quantity,
            'min_order' => $request->min_order,
            'show_on_website' => $request->show_on_website,
            'on_request' => $request->on_request,
            'video' => $video_path_name,
            'video_id' => $request->video_id,
            'ctn_size' => $request->ctn_size,
            'updated_by' => Auth::user()->id,
        ]);

        // Add Product Price
        $product_price = ProductPrice::findOrFail($product->price->id);
        $product_price->update([
            'lifting_price' => $request->lifting_price,
            'sale_price' => $request->sale_price,
            'online_price' => $request->online_price,
            'discount' => isset($request->discount) ? $request->discount : 0,
            'discount_tk' => isset($request->discount_tk) ? $request->discount_tk : 0,
        ]);

        return redirect()->route('admin.product.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Recovery Deleted Data
        if (request()->has('recovery') && request('recovery') == 'true') {
            $data = Product::onlyTrashed()->findOrFail($id);
            $data->restore();
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $data = Product::onlyTrashed()->findOrFail($id);
                if (count($data->orderProducts) == 0) {
                    if (file_exists($data->thumbnail)) {
                        unlink($data->thumbnail);
                    }
                    $old_more_images = explode('|', $data->more_images);
                    foreach ($old_more_images as $key => $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                    if (file_exists($data->video)) {
                        unlink($data->video);
                    }
                    ProductPrice::where('product_id', $id)->delete();
                    $data->forceDelete();
                } else {
                    return response()->json(['status' => 'error']);
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $data = Product::onlyTrashed()->findOrFail($id);
            if (count($data->orderProducts) == 0) {
                if (file_exists($data->thumbnail)) {
                    unlink($data->thumbnail);
                }
                $old_more_images = explode('|', $data->more_images);
                foreach ($old_more_images as $key => $image) {
                    if (file_exists($image)) {
                        unlink($image);
                    }
                }
                if (file_exists($data->video)) {
                    unlink($data->video);
                }
                ProductPrice::where('product_id', $id)->delete();
                $data->forceDelete();
            } else {
                return response()->json(['status' => 'error']);
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $data = Product::findOrFail($id);
                if (count($data->orderProducts) == 0) {
                    $data->update(['deleted_by' => Auth::user()->id]);
                    $data->delete();
                } else {
                    return response()->json(['status' => 'error']);
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $data = Product::findOrFail($id);
        if (count($data->orderProducts) == 0) {
            $data->update(['deleted_by' => Auth::user()->id]);
            $data->delete();
        } else {
            return response()->json(['status' => 'error']);
        }
        return response()->json(['status' => 'success']);
    }
}
