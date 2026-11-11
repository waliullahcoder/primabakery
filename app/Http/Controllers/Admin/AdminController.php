<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\AdminSetting;
use App\Models\Client;
use App\Models\Collection;
use App\Models\LiftingProduct;
use App\Models\LiftingReturnList;
use App\Models\Region;
use App\Models\SalesList;
use App\Models\SalesReturnList;
use App\Models\Store;
use App\Models\VendorPayment;
use DateInterval;
use DatePeriod;
use DateTime;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (Auth::check()) {
            if (Auth::user()->role == 1) {
                $intendedUrl = Session::pull('url.intended', route('admin.dashboard'));
                return redirect()->intended($intendedUrl);
            } elseif (Auth::user()->role == 0) {
                return redirect()->route('customer.profile');
            }
        } else {
            return view('admin.auth.login');
        }
    }

    public function login(Request $request)
    {
        $input = $request->all();
        if (auth()->attempt(array('user_name' => $input['user_name'], 'password' => $input['password']))) {
            $intendedUrl = Session::pull('url.intended', route('admin.dashboard'));
            return redirect()->intended($intendedUrl)->with('success', 'Logged in Successfully!');
        } else {
            return redirect()->back()->with('error', 'Invalid Email or Password!');
        }
    }

    public function dashboard()
    {
        if (request()->ajax()) {
            $date = date('Y-m-d');
            $start_year = date('Y-m-d', strtotime($date . '-1 year'));
            $end_year = date('Y-m-d');

            $start    = new DateTime(date('Y-m-d', strtotime($start_year)));
            $start->modify('first day of this month');
            $end      = new DateTime(date('Y-m-d', strtotime($end_year)));
            $end->modify('first day of next month');
            $interval = DateInterval::createFromDateString('1 month');
            $period   = new DatePeriod($start, $interval, $end);
            $one_year_months = [];
            $one_year_sales = [];
            $one_year_collections = [];
            foreach ($period as $dt) {
                $start_date = $dt->format("Y-m-01");
                $end_date = $dt->format("Y-m-t");
                $sales = SalesList::with('sales')->whereHas('sales', function ($query) use ($start_date, $end_date) {
                    $query->where('date', '>=', $start_date)->where('date', '<=', $end_date)->whereNull('deleted_at');
                })->sum(DB::raw('amount - discount'));

                $salesReturn = SalesReturnList::with('return')->whereHas('return', function ($query) use ($start_date, $end_date) {
                    $query->where('date', '>=', $start_date)->where('date', '<=', $end_date)->where('approve', 1)->whereNull('deleted_at');
                })->sum(DB::raw('amount - sales_discount'));
                $totalSales = $sales - $salesReturn;

                $collectons = Collection::where('payment_date', '>=', $start_date)->where('payment_date', '<=', $end_date)->where('collection_type', '!=', 'adjust')->sum('amount');
                $one_year_months[] = $dt->format("M-y");
                $one_year_sales[] = $totalSales;
                $one_year_collections[] = $collectons;
            }
            $monthlyData = [
                'month' => $one_year_months,
                'sales_amount' => $one_year_sales,
                'collection_amount' => $one_year_collections,
            ];

            $admin_setting = AdminSetting::latest('id')->first();
            $start    = new DateTime(date('Y-m-d', strtotime($admin_setting->compare_chart_start)));
            $end      = new DateTime(date('Y-m-d', strtotime($admin_setting->compare_chart_end)));
            $interval = DateInterval::createFromDateString('7 day');
            $period   = new DatePeriod($start, $interval, $end);
            $two_years_sales = [];
            $two_years_collections = [];
            $two_years_months = [];
            foreach ($period as $dt) {
                $start_date = date('Y-m-d', strtotime('20-12-2023'));
                $end_date = $dt->format("Y-m-d");
                $sales = SalesList::with('sales')->whereHas('sales', function ($query) use ($start_date, $end_date) {
                    $query->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                })->sum(DB::raw('amount - discount'));

                $salesReturn = SalesReturnList::with('return')->whereHas('return', function ($query) use ($start_date, $end_date) {
                    $query->where('date', '>=', $start_date)->where('date', '<=', $end_date)->where('approve', 1);
                })->sum(DB::raw('amount - sales_discount'));
                $totalSales = $sales - $salesReturn;

                $collectons = Collection::where('payment_date', '>=', $start_date)->where('payment_date', '<=', $end_date)->where('collection_type', '!=', 'adjust')->sum('amount');
                $two_years_months[] = $dt->format("d-M");
                if ($end_date < date('Y-m-d')) {
                    $two_years_sales[] = $totalSales;
                    $two_years_collections[] = $collectons;
                }
            }

            return response()->json(['status' => 'success', 'month' => $monthlyData['month'], 'sales_amount' => $monthlyData['sales_amount'], 'collection_amount' => $monthlyData['collection_amount'], 'two_years_months' => $two_years_months, 'two_years_sales' => $two_years_sales, 'two_years_collections' => $two_years_collections]);
        }

        $offlineSales = SalesList::with(['sales'])->whereHas('sales', function ($q) {
            $q->whereNull('deleted_at');
        })->sum(DB::raw('amount - discount'));

        $salesReturn = SalesReturnList::with('return')->whereHas('return', function ($query) {
            $query->whereNull('deleted_at')->where('approve', 1);
        })->sum(DB::raw('amount - sales_discount'));
        $totalSales = $offlineSales - $salesReturn;

        $collections = Collection::where('collection_type', '!=', 'adjust')->whereNull('deleted_at')->sum('amount');

        $outstanding = $totalSales - $collections;
        $total_clients = Client::where('status', 1)->count();
        $lifting = LiftingProduct::sum(DB::raw('total_amount - discount'));
        $liftingReturn = LiftingReturnList::with('return')->whereHas('return')->sum(DB::raw('amount - lifting_discount'));
        $paid = VendorPayment::where('type', '!=', 'adjust')->sum('amount');
        $paymentDue = $lifting - ($liftingReturn + $paid);

        $query = DB::table('view_liftings');
        $company_id = Auth::user()->company_id;
        if ($company_id) {
            $query->where('company_id', $company_id);
        }
        $store_id = Store::where('status', 1)->get(['id'])->pluck('id')->toArray();
      $product_prices = $query
    ->whereIn('store_id', $store_id)
    ->whereNotNull('date')
    ->groupBy('product_id', 'name', 'code', 'attribute_name', 'category_name', 'sale_price')
    ->orderBy('name', 'asc')
    ->get(['product_id', 'name', 'code', 'attribute_name', 'category_name', 'sale_price']);
        $product_ids = $product_prices->pluck('product_id')->toArray();

        $liftings = DB::table('view_liftings')->whereIn('store_id', $store_id)->whereNotNull('date')->whereIn('product_id', $product_ids)->select('product_id', 'name', 'code', 'category_name', 'attribute_name', 'qty', 'amount')->orderBy('name', 'asc')->get();
        $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $sales = DB::table('view_sales')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();

        $total_lifting_amount = 0;
        $total_sales_amount = 0;

        $data = [
            'product_prices' => $product_prices,
            'store_id' => $store_id,
            'liftings' => $liftings,
            'lifting_returns' => $lifting_returns,
            'sales' => $sales,
            'sales_returns' => $sales_returns,
            'online_sales' => $online_sales,
        ];

        foreach ($data['product_prices'] as $row) {
            $liftings = $data['liftings']->where('product_id', $row->product_id)->sum('qty');
            $lifting_amount = $data['liftings']->where('product_id', $row->product_id)->sum('amount');
            $avarage_lifting_price = $lifting_amount / $liftings;

            $lifting_returns = $data['lifting_returns']->where('product_id', $row->product_id)->sum('qty');
            $sales = $data['sales']->where('product_id', $row->product_id)->sum('qty');
            $sales_returns = $data['sales_returns']->where('product_id', $row->product_id)->sum('qty');
            $online_sales = $data['online_sales']->where('product_id', $row->product_id)->sum('qty');
            $balance_qty = $liftings + $sales_returns - $lifting_returns - $sales  - $online_sales;

            $total_lifting_amount += $balance_qty * $avarage_lifting_price;
            $total_sales_amount += $balance_qty * $row->sale_price;
        }

        $info = [
            'clients' => number_format($total_clients),
            'sales' => number_format($totalSales, 2, '.', ','),
            'collections' => number_format($collections, 2, '.', ','),
            'outstanding' => number_format($outstanding, 2, '.', ','),
            'payment_due' => number_format($paymentDue, 2, '.', ','),
            'stock_value' => number_format($total_lifting_amount, 2, '.', ','),
        ];

        $RegionSales = [];
        $regions = Region::where('status', 1)->orderBy('name', 'asc')->get();
        foreach ($regions as $region) {
            $region_id = $region->id;
            $offlineSales = SalesList::with(['sales', 'sales.client.area'])->whereHas('sales')->whereHas('sales.client.area', function ($query) use ($region_id) {
                $query->where('region_id', $region_id);
                $query->whereNull('deleted_at');
            })->sum(DB::raw('amount - discount'));

            $salesReturn = SalesReturnList::with('return', 'return.client.area')->whereHas('return')->whereHas('return.client.area',  function ($query) use ($region_id) {
                $query->where('region_id', $region_id);
                $query->whereNull('deleted_at')->where('approve', 1);
            })->sum(DB::raw('amount - sales_discount'));
            $totalSales = $offlineSales - $salesReturn;

            $data = ['name' => $region->name, 'amount' => number_format($totalSales, 2, '.', '')];
            array_push($RegionSales, $data);
        }

        return view('admin.profile.dashbaord', compact('info', 'RegionSales'));
    }

    /**
     * Manage Sidebar
     */
    public function sidebar()
    {
        if (!Session::has('sidebar-collapse')) {
            Session()->put('sidebar-collapse', 'active');
        } else {
            Session::forget('sidebar-collapse');
        }
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
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit()
    {
        $admin = Auth::user();
        return view('admin.profile.index', compact('admin'));
    }

    public function changeImages(Request $request)
    {
        $images = User::findOrFail(Auth::user()->id);
        $cover = $request->file('cover_image');
        if (isset($cover)) {
            $path = 'backend/images/avatar/';
            $file_name = 'cover-' . Str::random(40) . '.' . $cover->getClientOriginalExtension();
            $path_file_name = $path . $file_name;
            $cover->move($path, $file_name);
            if (file_exists($images->cover_image)) {
                unlink($images->cover_image);
            }
            $images->cover_image = $path_file_name;
        }

        $profile = $request->file('profile_image');
        if (isset($profile)) {
            $path = 'backend/images/avatar/';
            $file_name = 'profile-' . Str::random(40) . '.' . $profile->getClientOriginalExtension();
            $path_file_name = $path . $file_name;
            $profile->move($path, $file_name);
            if (file_exists($images->image)) {
                unlink($images->image);
            }
            $images->image = $path_file_name;
        }
        $images->save();
        return redirect()->back()->withSuccessMessage('Image Changed Successfully!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'email' => 'unique:users,email,' . Auth::user()->id,
            'name' => 'required',
        ]);
        $admin = User::findOrFail(Auth::user()->id);
        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->phone = $request->phone;
        $admin->address = $request->address;
        $admin->save();
        return redirect()->back()->withSuccessMessage('Information Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|string|min:8|confirmed',
        ]);

        $admin = User::findOrFail(Auth::user()->id);
        if (Hash::check($request->old_password, $admin->password)) {
            $admin->password = bcrypt($request->new_password);
            $admin->save();
            return redirect()->back()->withSuccessMessage('Updated Successfully!');
        } else {
            return redirect()->back()->withErrors('Old Password Does not Matched!');
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('admin.login.index');
    }
}
