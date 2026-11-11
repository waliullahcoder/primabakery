<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\Store;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Throwable;
use Yajra\DataTables\Facades\DataTables;

class OrderDashboardController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Order::with(['address'])->where('order_type', 'online')->whereNotIn('status', ['Canceled', 'Successed']);
            return DataTables::eloquent($model)
                ->addIndexColumn()
                ->addColumn('order_date', function ($row) {
                    return date('d M Y', strtotime($row->created_at));
                })
                ->addColumn('action', function ($row) {
                    if ($row->status == 'Canceled') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-danger" style="min-width: 80px;">Canceled</span>';
                    } elseif ($row->status == 'Successed') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-success" style="min-width: 80px;">Successed</span>';
                    } else {
                        $status = '<a class="btn btn-xs text-white px-2 ';
                        if ($row->status == 'Pending') {
                            $status .= 'bg-primary';
                        } elseif ($row->status == 'Confirmed') {
                            $status .= 'bg-info';
                        } elseif ($row->status == 'Processing') {
                            $status .= 'bg-warning';
                        } elseif ($row->status == 'Delivered') {
                            $status .= 'bg-delivered';
                        }
                        $status .= '" style="min-width: 80px;" href="' . Route('admin.order-dashboard.edit', $row->id) . '">' . $row->status . '</a>';
                    }
                    return $status;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        $total_orders = Order::where('order_type', 'online')->count();
        $success_orders = Order::where('order_type', 'online')->where('status', 'successed')->count();
        $ranked_products = OrderProduct::with(['order', 'product'])->whereHas('order', function ($query) {
            $query->where('order_type', 'online');
        })->groupBy('product_id')->select(['product_id', DB::raw('SUM(quantity) as total_qty')])->orderBy('total_qty', 'desc')->limit(12)->get();
        $orders = Order::where('order_type', 'online')->get();
        return view('admin.order_dashboard.index', compact('total_orders', 'success_orders', 'ranked_products', 'orders'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Request $request, string $id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $order = Order::findOrFail($id);
        $stores = Store::where('status', 1)->get();
        return view('admin.order_dashboard.change_status', compact('order', 'stores'));
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
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        try {
            $data = Order::findOrFail($id);
            if ($data->status == 'Pending') {
                DB::transaction(function () use ($request, $data) {
                    foreach ($data->products as $product) {
                        $store_id = $request->store_id;
                        $product_id = $product->product_id;
                        $stock = $this->stock($product_id, $store_id);
                        $product = Product::find($product_id);
                        if ($product->quantity > $stock) {
                            throw new Exception('stock not available for ' . $product->name);
                        }
                    }
                });
            }
            $data->update(['status' => $request->status, 'store_id' => $request->store_id]);
        } catch (Throwable $caught) {
            if ($caught) {
                return redirect()->back()->withErrors('Stock not available!');
            }
        }
        return redirect()->route('admin.order-dashboard.index')->withSuccessMessage('Status Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
