<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Company;
use App\Models\LiftingProduct;
use App\Models\Order;
use App\Models\OrderData;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\Store;
use Barryvdh\DomPDF\Facade\Pdf;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Throwable;
use Yajra\DataTables\Facades\DataTables;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Order::with(['company', 'products', 'customer'])->where('order_type', 'online');
            return DataTables::eloquent($model)
                ->filter(function ($query) {
                    $date_range = explode('to', request('date_range'));
                    $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
                    $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
                    if (!is_null($start_date) && !is_null($end_date)) {
                        $query->whereDate('created_at', '>=', $start_date)->whereDate('created_at', '<=', $end_date);
                    }
                    if (!is_null(request('status'))) {
                        $query->where('status', request('status'));
                    }
                }, true)
                ->addIndexColumn()
                ->addColumn('order_products', function ($row) {
                    return count($row->products);
                })
                ->addColumn('order_date', function ($row) {
                    return date('d M Y h:i A', strtotime($row->date));
                })
                ->addColumn('order_status', function ($row) {
                    if ($row->status == 'Canceled') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-danger" style="min-width: 80px;">Canceled</span>';
                    } elseif ($row->status == 'Successed') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-success" style="min-width: 80px;">Successed</span>';
                    } else {
                        $status = '<span class="btn btn-xs text-white px-2  ';
                        if ($row->status == 'Pending') {
                            $status .= 'bg-primary';
                        } elseif ($row->status == 'Confirmed') {
                            $status .= 'bg-info';
                        } elseif ($row->status == 'Processing') {
                            $status .= 'bg-warning';
                        } elseif ($row->status == 'Delivered') {
                            $status .= 'bg-delivered';
                        }
                        $status .= '" style="min-width: 80px;">' . $row->status . '</span>';
                    }
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <a href="' . Route('admin.online-order.edit', $row->id) . '" class="btn btn-sm btn-success border-0 px-10px tt fs-15" data-bs-toggle="tooltip" data-bs-placement="top" title="Show Order"><i class="fas fa-eye"></i></a>
                        <a href="' . Route('admin.online-order.show', $row->id) . '" target="_blank" class="btn btn-sm btn-info text-white border-0 px-10px tt fs-15" data-bs-toggle="tooltip" data-bs-placement="top" title="Print Voucher"><i class="fas fa-print"></i></a>
                    </div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'order_status', 'actions'])
                ->make(true);
        }
        return view('admin.order.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    public function exportProcess()
    {
        if (Auth::user()->company_id) {
            $company = Company::find(Auth::user()->company_id);
            $logo = $company->logo;
            $title = $company->name;
            $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
        } else {
            $logo = NULL;
            $title = 'Company Name Goes Here.';
            $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
        }
        $items = OrderProduct::with(['order', 'product'])->whereHas('order', function ($query) {
            $query->where('status', 'Processing')->where('order_type', 'online');
        })
            ->select(['product_id', DB::raw('SUM(quantity) as qty')])
            ->groupBy('product_id')->get();

        $invoices = Order::where('status', 'Processing')->where('order_type', 'online')->get(['order_code']);
        $report_title = 'Processing Order List';
        return view('admin.order.processing_orders_print', compact('title', 'logo', 'informations', 'report_title', 'items', 'invoices'));
        $pdf = Pdf::loadView('admin.order.processing_orders_print', compact('title', 'logo', 'informations', 'report_title', 'items', 'invoices'));
        return $pdf->stream('getepass_chalan_' . date('d_m_Y_H_i_s') . '.pdf');
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
    public function show(string $id)
    {
        $order = Order::findOrFail($id);
        return view('admin.order.print', compact('order'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Request $request, string $id)
    {
        $order = Order::findOrFail($id);
        $stores = Store::where('status', 1)->get();
        return view('admin.order.view', compact('order', 'stores'));
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

    public function CancelOrder()
    {
        if (request()->ajax()) {
            $model = Order::with(['company', 'products', 'customer'])->where('status', 'Canceled')->where('cancel_approve', 0);
            return DataTables::eloquent($model)
                ->addIndexColumn()
                ->addColumn('order_products', function ($row) {
                    return count($row->products);
                })
                ->addColumn('order_date', function ($row) {
                    return date('d M Y h:i A', strtotime($row->date));
                })
                ->addColumn('order_status', function ($row) {
                    if ($row->status == 'Canceled') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-danger">Canceled</span>';
                    } elseif ($row->status == 'Successed') {
                        $status = '<span class="btn btn-xs text-white px-2 bg-success">Successed</span>';
                    } else {
                        $status = '<span class="btn btn-xs text-white px-2 bg-primary">' . $row->status . '</span>';
                    }
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    return '<button data-url="' . Route('admin.cancel-order.approve', $row->id) . '" class="btn btn-xxs tt ms-1 btn-outline-success approve text-nowrap" data-bs-toggle="tooltip" data-bs-placement="top" title="Approve Cancelation">Approve</button>';
                })
                ->rawColumns(['checkbox', 'order_status', 'actions'])
                ->make(true);
        }
        return view('admin.cancelled_approval.index');
    }

    public function approveCancelOrder($id)
    {
        $data = Order::findOrFail($id);
        if ($data->status == 'Canceled') {
            $data->update(['cancel_approve' => 1]);
        }
        return response()->json(['status' => 'success']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
