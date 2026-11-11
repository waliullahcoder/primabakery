<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\AccessLogDataTable;
use App\DataTables\ClientListDataTable;
use App\DataTables\CoaListDataTable;
use App\DataTables\CollectionHistoryDataTable;
use App\DataTables\DeliveryStatementDataTable;
use App\DataTables\LiftingHistoryDataTable;
use App\DataTables\LiftingReturnHistoryDataTable;
use App\DataTables\LiftingReturnSummaryDataTable;
use App\DataTables\LiftingSummeryHistoryDataTable;
use App\DataTables\OnlineSalesHistoryDataTable;
use App\DataTables\OnlineSalesSummaryDataTable;
use App\DataTables\ProductListDataTable;
use App\DataTables\ReturnHistoryDataTable;
use App\DataTables\ReturnSummaryDataTable;
use App\DataTables\SalesHistoryDataTable;
use App\DataTables\SalesSummaryDataTable;
use App\DataTables\SalesTargetAchivementDataTable;
use App\DataTables\TransferLogDataTable;
use App\DataTables\VendorPaymentHistoryDataTable;
use App\DataTables\VendorPaymentSummaryDataTable;
use App\DataTables\voucherListDataTable;
use App\Http\Controllers\Controller;
use App\Models\AccessLog;
use App\Models\AccountTransaction;
use App\Models\Area;
use App\Models\Category;
use App\Models\Client;
use App\Models\ClientCategory;
use App\Models\CoaSetup;
use App\Models\Collection;
use App\Models\CollectionHistory;
use App\Models\Company;
use App\Models\DeliveryList;
use App\Models\Group;
use App\Models\LiftingProduct;
use App\Models\LiftingReturnList;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\Region;
use App\Models\Sales;
use App\Models\SalesHistory;
use App\Models\SalesReturnList;
use App\Models\Scopes\CompanyScope;
use App\Models\Staff;
use App\Models\Store;
use App\Models\Territory;
use App\Models\TransferProduct;
use App\Models\TrialBalance;
use App\Models\User;
use App\Models\Vendor;
use App\Models\VendorPayment;
use App\Services\LiftingRealization\LiftingRealization;
use App\Services\Statement\Vendor\Statement;
use App\Services\Statement\Client\ClientStatement;
use App\Services\Statement\Product\ProductStatement;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    public function productList(Request $request, ProductListDataTable $dataTable)
    {
        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $query = Product::with(['vendor', 'category', 'attribute']);
            if (!is_null($request->vendor_id)) {
                $query->where('vendor_id', $request->vendor_id);
            }
            if (!is_null($request->category_id)) {
                $query->where('category_id', $request->category_id);
            }
            $data = $query->orderBy('name', 'asc')->get();

            $report_title = 'Product Price List';
            $pdf = Pdf::loadView('admin.reports.product_list.print', compact('title', 'informations', 'report_title', 'data'));
            return $pdf->stream('product_list_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Product List Report';
        $categories = Category::root()->where('status', 1)->orderBy('name', 'asc')->get();
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.product_list.index', compact('title', 'categories', 'vendors'));
    }

    public function liftingHistroy(Request $request, LiftingHistoryDataTable $historyDataTable, LiftingSummeryHistoryDataTable $historySummaryDataTable)
    {
        if ($request->ajax() && $request->has('getProducts')) {
            $query = Product::query();
            if (!is_null($request->vendor_id)) {
                $query->whereIn('vendor_id', $request->vendor_id);
            }
            if (!is_null($request->category_id)) {
                $query->whereIn('category_id', $request->category_id);
            }
            $products = $query->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        $vendor_ids = $request->vendor_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        $category_ids = $request->category_id;
        $store_id = $request->store_id;
        $product_ids = $request->product_id;
        $report_type = $request->report_type;

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            if (request('report_type') == 'summary') {
                $report_type = 'summary';
                $report_title = 'Lifting Summary Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $query = LiftingProduct::with(['lifting', 'product', 'vendor'])->select(
                    'product_id',
                    'vendor_id',
                    DB::raw('SUM(qty) as total_lifting_qty'),
                    DB::raw('SUM(total_amount - discount) as total_lifting_price')
                );
                if (!is_null($category_ids)) {
                    $query->whereHas('product', function ($squery) use ($category_ids) {
                        $squery->whereIn('category_id', $category_ids);
                    });
                }
                if (!is_null($vendor_ids)) {
                    $query->whereIn('vendor_id', $vendor_ids);
                }
                if (!is_null($product_ids)) {
                    $query->whereIn('product_id', $product_ids);
                }
                if (!is_null($store_id)) {
                    $query->where('store_id', $store_id);
                }
                $query->whereHas('lifting', function ($squery) use ($start_date, $end_date) {
                    $squery->where('lifting_date', '>=', $start_date)->where('lifting_date', '<=', $end_date);
                });
                $data = $query->groupBy('vendor_id')->groupBy('product_id')->get();
                // return view('admin.reports.lifting_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf = Pdf::loadView('admin.reports.lifting_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                return $pdf->stream('lifting_summary_' . date('d_m_Y_H_i_s') . '.pdf');
            } else {
                $report_type = 'history';
                $report_title = 'Lifting History Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';

                $query = LiftingProduct::with(['lifting', 'product', 'store', 'vendor']);
                if (!is_null($request->vendor_id)) {
                    $query->whereHas('lifting', function ($squery) use ($vendor_ids) {
                        $squery->whereIn('vendor_id', $vendor_ids);
                    });
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_ids) {
                        $squery->whereIn('category_id', $category_ids);
                    });
                }
                if (!is_null($request->store_id)) {
                    $query->where('store_id', $store_id);
                }
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_ids);
                }
                $query->whereHas('lifting', function ($squery) use ($start_date, $end_date) {
                    $squery->where('lifting_date', '>=', $start_date)->where('lifting_date', '<=', $end_date);
                });
                $data = $query->get();
                // return view('admin.reports.lifting_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf = Pdf::loadView('admin.reports.lifting_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf->setPaper('A4', 'landscape');
                return $pdf->stream('lifting_history_' . date('d_m_Y_h_i_s') . '.pdf');
            }
        }

        $query = Product::query();
        if (!is_null($request->vendor_id)) {
            $query->whereIn('vendor_id', $request->vendor_id);
        }
        if (!is_null($request->category_id)) {
            $query->whereIn('category_id', $request->category_id);
        }
        $products = $query->orderBy('name', 'asc')->get();

        $filter_link = Route('admin.lifting-history.index');
        $categories = Category::root()->where('status', 1)->orderBy('name', 'asc')->get();
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', 1)->get();
        if ($request->report_type == 'summary') {
            $title = 'Lifting Summary Report';
            return $historySummaryDataTable->render('admin.reports.lifting_history.index', compact('title', 'filter_link', 'report_type', 'categories', 'vendors', 'stores', 'vendor_ids', 'start_date', 'end_date', 'category_ids', 'store_id', 'product_ids', 'products'));
        } else {
            $title = 'Lifting History Report';
            return $historyDataTable->render('admin.reports.lifting_history.index', compact('title', 'filter_link', 'report_type', 'categories', 'vendors', 'stores', 'vendor_ids', 'start_date', 'end_date', 'category_ids', 'store_id', 'product_ids', 'products'));
        }
    }

    public function liftingReturnHistory(Request $request, LiftingReturnHistoryDataTable $historyDataTable, LiftingReturnSummaryDataTable $summaryDataTable)
    {
        if ($request->ajax() && $request->has('getProducts')) {
            $query = Product::query();
            if (!is_null($request->vendor_id)) {
                $query->whereIn('vendor_id', $request->vendor_id);
            }
            if (!is_null($request->category_id)) {
                $query->whereIn('category_id', $request->category_id);
            }
            $products = $query->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $vendor_ids = explode(',', $request->vendor_id);
            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
            $category_ids = explode(',', $request->category_id);
            $store_id =  $request->store_id;
            $product_ids =  explode(',', $request->product_id);

            if (request('report_type') == 'summary') {
                $report_type = 'summary';
                $report_title = 'Lifting Return Summary <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';

                $query = LiftingReturnList::with(['return', 'product', 'lifting_product', 'vendor', 'store'])->select(
                    'lifting_return_lists.product_id',
                    'lifting_return_lists.vendor_id',
                    DB::raw('SUM(lifting_return_lists.qty) as total_qty'),
                    DB::raw('SUM(lifting_return_lists.lifting_price) as total_price')
                );
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_ids) {
                        $squery->whereIn('category_id', $category_ids);
                    });
                }
                if (!is_null($request->vendor_id)) {
                    $query->whereIn('vendor_id', $vendor_ids);
                }
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_ids);
                }
                if (!is_null($request->store_id)) {
                    $query->where('store_id', $store_id);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('return', function ($squery) use ($start_date, $end_date) {
                        $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                    });
                }
                $data = $query->groupBy('vendor_id')
                    ->groupBy('product_id')->get();

                $pdf = Pdf::loadView('admin.reports.lifting_return_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                return $pdf->stream('lifting_return_summary_' . date('d_m_Y_H_i_s') . '.pdf');
            } else {
                $report_type = 'history';
                $report_title = 'Lifting Return History <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';

                $query = LiftingReturnList::with(['return', 'product', 'lifting_product', 'vendor', 'store']);
                if (!is_null($request->vendor_id)) {
                    $query->whereHas('return', function ($squery) use ($vendor_ids) {
                        $squery->whereIn('vendor_id', $vendor_ids);
                    });
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_ids) {
                        $squery->whereIn('category_id', $category_ids);
                    });
                }
                if (!is_null($store_id)) {
                    $query->where('store_id', $store_id);
                }
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_ids);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('return', function ($squery) use ($start_date, $end_date) {
                        $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                    });
                }
                $data = $query->get();
                $pdf = Pdf::loadView('admin.reports.lifting_return_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf->setPaper('A4', 'landscape');
                return $pdf->stream('lifting_return_history' . date('d_m_Y_H_i_s') . '.pdf');
            }
        }

        $vendor_ids = $request->vendor_id;
        $date_range = explode('to', $request->date_range);
        $start_date = isset($date_range[0]) ? $date_range[0] : NULL;
        $end_date = isset($date_range[1]) ? $date_range[1] : NULL;
        $category_ids = $request->category_id;
        $store_id = $request->store_id;
        $product_ids = $request->product_id;
        $report_type = $request->report_type;
        $query = Product::query();
        if (!is_null($request->vendor_id)) {
            $query->whereIn('vendor_id', $request->vendor_id);
        }
        if (!is_null($request->category_id)) {
            $query->whereIn('category_id', $request->category_id);
        }
        if (is_null($request->vendor_id) && is_null($request->category_id)) {
            $query->where('company_id', 0);
        }
        $products = $query->orderBy('name', 'asc')->get();

        $filter_link = Route('admin.lifting-return-history.index');
        $categories = Category::root()->where('status', 1)->orderBy('name', 'asc')->get();
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', 1)->get();
        if ($request->report_type == 'summary') {
            $title = 'Lifting History Summary Report';
            return $summaryDataTable->render('admin.reports.lifting_return_history.index', compact('title', 'filter_link', 'report_type', 'categories', 'vendors', 'stores', 'vendor_ids', 'start_date', 'end_date', 'category_ids', 'store_id', 'product_ids', 'products'));
        } else {
            $title = 'Lifting History Report';
            return $historyDataTable->render('admin.reports.lifting_return_history.index', compact('title', 'filter_link', 'report_type', 'categories', 'vendors', 'stores', 'vendor_ids', 'start_date', 'end_date', 'category_ids', 'store_id', 'product_ids', 'products'));
        }
    }

    public function vendorPayment(Request $request, VendorPaymentHistoryDataTable $historyDataTable, VendorPaymentSummaryDataTable $summaryDataTable)
    {
        $report_type = $request->report_type;
        $vendor_id = $request->vendor_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            if ($report_type == 'history') {
                $report_title = 'Payment History Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $query = VendorPayment::with(['vendor']);
                if (!is_null($request->vendor_id)) {
                    $query->whereIn('vendor_id', $vendor_id);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->where('payment_date', '>=', $start_date)->where('payment_date', '<=', $end_date);
                }
                $data = $query->orderBy('payment_date', 'desc')->get();
            } else {
                $report_title = 'Payment Summary Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $query = VendorPayment::with(['vendor']);
                if (!is_null($request->vendor_id)) {
                    $query->whereIn('vendor_id', $vendor_id);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->where('payment_date', '>=', $start_date)->where('payment_date', '<=', $end_date);
                }
                $data = $query->select(
                    'vendor_payments.vendor_id',
                    DB::raw('SUM(vendor_payments.amount) as total_amount')
                )->groupBy('vendor_payments.vendor_id')->get();
            }
            // return view('admin.reports.vendor_payment.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
            $pdf = Pdf::loadView('admin.reports.vendor_payment.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
            return $pdf->stream('vendor_payment_history' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $filter_link = Route('admin.vendor-payment-history.index');
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        if ($report_type == 'summary') {
            $title = 'Payment Summary';
            return $summaryDataTable->render('admin.reports.vendor_payment.index', compact('filter_link', 'title', 'vendors', 'report_type', 'vendor_id', 'start_date', 'end_date'));
        } else {
            $title = 'Payment History';
            return $historyDataTable->render('admin.reports.vendor_payment.index', compact('filter_link', 'title', 'vendors', 'report_type', 'vendor_id', 'start_date', 'end_date'));
        }
    }

    public function vendorStatement(Request $request)
    {
        $date_range = explode('to', $request->date_range);
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
        $vendor_id = $request->vendor_id;

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $vendor = Vendor::find($vendor_id);
            $report_title = 'Vendor Statement (' . $vendor->name . ') <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';

            $previousBalance = Statement::previousBalance($vendor_id, $start_date);
            $statements = Statement::Statement($vendor_id, $start_date, $end_date, $previousBalance);
            $data = [
                'previousBalance' => $previousBalance,
                'statements' => $statements,
            ];

            // return view('admin.reports.vendor_statement.print', compact('title', 'informations', 'report_title', 'data', 'vendor'));
            $pdf = Pdf::loadView('admin.reports.vendor_statement.print', compact('title', 'informations', 'report_title', 'data', 'vendor'));
            return $pdf->stream('vendor_statement_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        if ($request->has('filter')) {
            $previousBalance = Statement::previousBalance($vendor_id, $start_date);
            $statements = Statement::Statement($vendor_id, $start_date, $end_date, $previousBalance);
            $data = [
                'previousBalance' => $previousBalance,
                'statements' => $statements,
            ];
        } else {
            $data = [];
        }
        $title = 'Vendor Statement';
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        $filter_link = Route('admin.vendor-statement.index');
        return view('admin.reports.vendor_statement.index', compact('title', 'filter_link', 'vendors', 'data', 'vendor_id', 'start_date', 'end_date'));
    }

    public function clientList(Request $request, ClientListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getArea')) {
            $areas = Area::where('region_id', $request->region_id)->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'areas' => $areas]);
        }

        if ($request->ajax() && $request->has('getTerrigory')) {
            $territories = Territory::where('area_id', $request->area_id)->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'territories' => $territories]);
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $query = Client::with(['reference', 'client_category', 'area', 'territory']);
            $region_id = $request->region_id;
            $area_id = $request->area_id;
            $territory_id = $request->territory_id;
            $category_id = $request->category_id;
            $staff_id = $request->staff_id;
            $client_type = $request->client_type;
            $start_date = $request->start_date;
            if (!is_null($request->region_id)) {
                $query->whereHas('area', function ($squery) use ($region_id) {
                    $squery->where('region_id', $region_id);
                });
            }
            if (!is_null($request->area_id)) {
                $query->where('area_id', $area_id);
            }
            if (!is_null($request->territory_id)) {
                $query->where('territory_id', $territory_id);
            }
            if (!is_null($request->category_id)) {
                $query->where('client_category_id', $category_id);
            }
            if (!is_null($request->staff_id)) {
                $query->where('reference_by', $staff_id);
            }
            if (!is_null($request->client_type)) {
            }
            if (!is_null($request->start_date)) {
                $query->where('created_at', '>=', date('Y-m-d', strtotime($start_date)));
            }
            $data = $query->orderBy('name', 'asc')->get();

            $report_title = 'Client List';
            // return view('admin.reports.client_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.client_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('client_list_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Client List';
        $regions = Region::where('status', 1)->orderBy('name', 'asc')->get();
        $categories = ClientCategory::where('status', 1)->orderBy('name', 'asc')->get();
        $staffs = Staff::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.client_list.index', compact('title', 'regions', 'categories', 'staffs'));
    }

  
 
private function applySalesFilters($query, Request $request)
{
    $category_id = array_filter((array) $request->category_id);
    $product_id  = array_filter((array) $request->product_id);

    if (!empty($category_id)) {
        $query->whereIn('category_id', $category_id);
    }
    if (!empty($product_id)) {
        $query->whereIn('product_id', $product_id);
    }
    if ($request->filled('date_range')) {
        $range = array_map('trim', explode(' to ', $request->date_range));
        $start = date('Y-m-d', strtotime($range[0]));
        $end   = date('Y-m-d', strtotime($range[1] ?? $range[0]));
        $query->whereDate('date', '>=', $start)->whereDate('date', '<=', $end);
    }

    return $query;
}
 
public function salesHistroy(Request $request, SalesHistoryDataTable $dataTable)
{
    // ---------- Filter values ----------
    $client_id = array_filter((array) $request->client_id);
    $staff_id  = array_filter((array) $request->staff_id);
 
    $start_date = null;
    $end_date   = null;
    if ($request->filled('date_range')) {
        $range      = array_map('trim', explode(' to ', $request->date_range));
        $start_date = date('Y-m-d', strtotime($range[0]));
        $end_date   = date('Y-m-d', strtotime($range[1] ?? $range[0]));
    }
 
    // ---------- PDF print ----------
    if ($request->filled('print')) {
        if (Auth::user()->company_id) {
            $company = Company::find(Auth::user()->company_id);
            $title = $company->name;
            $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
        } else {
            $title = 'Company Name Goes Here.';
            $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
        }
 
        $range_text = $start_date
            ? date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date))
            : 'All Dates';
        $report_title = 'Sales History Report <br> <span class="text-sm">' . $range_text . '</span>';
 
        // DataTable er query() ei filter apply kore, tai table/excel/print shob same data dey
        
        
        $data = $dataTable->query($request, new Sales())->get();

        $total = $data->sum('total_amount');

        $total_discount = $data->sum('discount');

        $net_total = $data->sum(function ($row) {
            return (float) $row->total_amount - (float) $row->discount;
        });

        $total_paid = $data->sum('total_paid');

        $pdf = Pdf::loadView(
            'admin.reports.sales_history.print',
            compact(
                'title',
                'informations',
                'report_title',
                'data',
                'total',
                'total_discount',
                'net_total',
                'total_paid'
            )
        );

        $pdf->setPaper('A4', 'landscape');

        return $pdf->stream(
            'sales_history_' . date('d_m_Y_h_i_s') . '.pdf'
        );


        $pdf->setPaper('A4', 'landscape');
        return $pdf->stream('sales_history_' . date('d_m_Y_h_i_s') . '.pdf');
    }
 
    // ---------- Page data ----------
    $title       = 'Sales History Report';
    $filter_link = route('admin.sales-history.index');
    $clients     = Client::where('status', 1)->orderBy('name', 'asc')->get();
    $staffs      = Staff::where('status', 1)->where('type', 'sales')->orderBy('name', 'asc')->get();
 
    return $dataTable->render('admin.reports.sales_history.index', compact(
        'title',
        'filter_link',
        'clients',
        'staffs',
        'client_id',
        'staff_id',
        'start_date',
        'end_date'
    ));
}

    public function collectionHistory(Request $request, CollectionHistoryDataTable $historyDataTable)
    {
        $report_type = $request->report_type;
        $collection_type = $request->collection_type;
        $staff_id = $request->staff_id;
        $client_id = $request->client_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $query = CollectionHistory::query();

            if (!is_null($collection_type)) {
                $query->where('collection_type', $collection_type);
            }
            if (!is_null($client_id)) {
                $query->whereIn('client_id', $client_id);
            }
            if (!is_null($staff_id)) {
                $query->whereIn('staff_id', $staff_id);
            }
            $query->where('date', '>=', $start_date)->where('date', '<=', $end_date);

            if ($report_type == 'summary') {
                $report_title = 'Collection History Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $data = $query->select('*', DB::raw('SUM(amount) as total_amount'))->groupBy('client_id')->get();
            } elseif ($report_type == 'history') {
                $report_title = 'Collection Summary Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $data = $query->orderBy('date', 'desc')->get();
            }
            // return view('admin.reports.collection_history.print', compact('title', 'informations', 'report_title', 'report_type', 'collection_type', 'data'));
            $pdf = Pdf::loadView('admin.reports.collection_history.print', compact('title', 'informations', 'report_title', 'report_type', 'collection_type', 'data'));
            return $pdf->stream('collection_history_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $filter_link = Route('admin.collection-history.index');
        $staffs = User::where('is_staff', 1)->where('status', 1)->orderBy('name', 'asc')->get();
        $clients = Client::where('status', 1)->orderBy('name', 'asc')->get();
        $collection_type = $request->collection_type;
        if ($report_type == 'summary') {
            $title = 'Collection Summary';
        } else {
            $title = 'Collection History';
        }
        return $historyDataTable->render('admin.reports.collection_history.index', compact('filter_link', 'title', 'staffs', 'clients', 'report_type', 'client_id', 'staff_id', 'start_date', 'end_date', 'collection_type'));
    }

    public function returnHistory(Request $request, ReturnSummaryDataTable $summaryDataTable, ReturnHistoryDataTable $historyDataTable)
    {
        if ($request->ajax() && $request->has('get_area')) {
            $areas = Area::where('status', 1)->where('region_id', $request->region_id)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'areas' => $areas]);
        }
        if ($request->ajax() && $request->has('get_territory')) {
            $territories = Territory::where('status', 1)->where('area_id', $request->area_id)->orderBy('name', 'asc')->get();
            $clients = Client::where('status', 1)->where('area_id', $request->area_id)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'territories' => $territories, 'clients' => $clients]);
        }
        if ($request->ajax() && $request->has('get_clients')) {
            $clients = Client::where('status', 1)->where('territory_id', $request->territory_id)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'clients' => $clients]);
        }
        if ($request->ajax() && $request->has('get_products')) {
            if (!is_null($request->category_id)) {
                $query = Product::query();
                $query->whereIn('category_id', $request->category_id);
                $products = $query->where('status', 1)->orderBy('name', 'asc')->get();
            } else {
                $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_type = $request->report_type;
            $region_id = $request->region_id;
            $area_id = $request->area_id;
            $territory_id = $request->territory_id;
            $category_id = explode(',', $request->category_id);
            $client_id = explode(',', $request->client_id);
            $product_id = explode(',', $request->product_id);
            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            if ($report_type == 'history') {
                $report_title = 'Return History Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $query = SalesReturnList::with(['return', 'client', 'client.area', 'product']);

                if (!is_null($request->region_id)) {
                    $query->whereHas('client.area', function ($squery) use ($region_id) {
                        $squery->where('region_id', $region_id);
                    });
                }
                if (!is_null($request->area_id)) {
                    $query->whereHas('client', function ($squery) use ($area_id) {
                        $squery->where('area_id', $area_id);
                    });
                }
                if (!is_null($request->territory_id)) {
                    $query->whereHas('client', function ($squery) use ($territory_id) {
                        $squery->where('territory_id', $territory_id);
                    });
                }
                if (!is_null($request->client_id)) {
                    $query->whereIn('client_id', $client_id);
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_id) {
                        $squery->whereIn('category_id', $category_id);
                    });
                }
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_id);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('return', function ($squery) use ($start_date, $end_date) {
                        $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                    });
                }
                $data = $query->select(['*', DB::raw('(amount - sales_discount) as amount')])->get();
            } else {
                $report_title = 'Return Summary Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
                $query = SalesReturnList::with(['return', 'client', 'client.area', 'product']);

                if (!is_null($request->region_id)) {
                    $query->whereHas('client.area', function ($squery) use ($region_id) {
                        $squery->where('region_id', $region_id);
                    });
                }
                if (!is_null($request->area_id)) {
                    $query->whereHas('client', function ($squery) use ($area_id) {
                        $squery->where('area_id', $area_id);
                    });
                }
                if (!is_null($request->territory_id)) {
                    $query->whereHas('client', function ($squery) use ($territory_id) {
                        $squery->where('territory_id', $territory_id);
                    });
                }
                if (!is_null($request->client_id)) {
                    $query->whereIn('client_id', $client_id);
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_id) {
                        $squery->whereIn('category_id', $category_id);
                    });
                }
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_id);
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('return', function ($squery) use ($start_date, $end_date) {
                        $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                    });
                }
                if ($report_type == 'product_summary') {
                    $query->select(
                        'product_id',
                        DB::raw('SUM(qty) as total_qty'),
                        DB::raw('SUM(amount-sales_discount) as total_amount')
                    );
                    $query->groupBy('product_id');
                    $data = $query->groupBy('product_id')->get();
                }
                if ($report_type == 'client_summary') {
                    $query->select(
                        'client_id',
                        DB::raw('SUM(qty) as total_qty'),
                        DB::raw('SUM(amount-sales_discount) as total_amount')
                    );
                    $query->groupBy('client_id');
                    $data = $query->groupBy('client_id')->get();
                }
            }
            // return view('admin.reports.return_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
            $pdf = Pdf::loadView('admin.reports.return_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
            return $pdf->stream('return_history' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $filter_link = Route('admin.return-history.index');
        $report_type = $request->report_type;
        $client_id = $request->client_id;
        $region_id = $request->region_id;
        $area_id = $request->area_id;
        $territory_id = $request->territory_id;
        $category_id = $request->category_id;
        $product_id = $request->product_id;
        $date_range = explode('to', $request->date_range);
        $start_date = isset($date_range[0]) ? date('d-m-Y', strtotime($date_range[0])) : NULL;
        $end_date = isset($date_range[1]) ? date('d-m-Y', strtotime($date_range[1])) : NULL;

        $regions = Region::where('status', 1)->orderBy('name', 'asc')->get();
        $areas = Area::where('status', 1)->where('region_id', $region_id)->orderBy('name', 'asc')->get();
        $territories = Territory::where('status', 1)->where('area_id', $area_id)->orderBy('name', 'asc')->get();
        if (!is_null($area_id) || !is_null($territory_id)) {
            $clients = Client::where('status', 1)->where('area_id', $area_id)->orWhere('territory_id', $territory_id)->orderBy('name', 'asc')->get();
        } else {
            $clients = array();
        }
        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        if (!is_null($request->category_id)) {
            $products = Product::where('status', 1)->whereIn('category_id', $category_id)->orderBy('name', 'asc')->get();
        } else {
            $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        }

        if ($report_type == 'product_summary' || $report_type == 'client_summary') {
            $title = 'Return Summary';
            return $summaryDataTable->render('admin.reports.return_history.index', compact('filter_link', 'title', 'regions', 'areas', 'territories', 'clients', 'categories', 'products', 'report_type', 'client_id', 'region_id', 'area_id', 'territory_id', 'category_id', 'product_id', 'start_date', 'end_date'));
        } else {
            $title = 'Return History';
            return $historyDataTable->render('admin.reports.return_history.index', compact('filter_link', 'title', 'regions', 'areas', 'territories', 'clients', 'categories', 'products', 'report_type', 'client_id', 'region_id', 'area_id', 'territory_id', 'category_id', 'product_id', 'start_date', 'end_date'));
        }
    }

    public function clientStatement(Request $request)
    {
        $date_range = explode('to', $request->date_range);
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;

        if ($request->client_id) {
            $client = Client::findOrFail($request->client_id);
            if (!is_null($client->chain_client_id)) {
                $client_id = Client::where('chain_client_id', $client->chain_client_id)->get(['id'])->pluck('id');
            } else {
                $client_id = [$request->client_id];
            }
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $header_title = 'Client Statement On ' . $start_date . ' To ' . $end_date;
            $previousBalance = ClientStatement::previousBalance($client_id, $start_date);
            $statements = ClientStatement::Statement($client_id, $start_date, $end_date, $previousBalance);
            $data = [
                'previousBalance' => $previousBalance,
                'statements' => $statements,
            ];
            $client = Client::find($request->client_id);
            // return view('admin.reports.client_statement.print', compact('title', 'informations', 'header_title', 'data', 'client'));
            $pdf = Pdf::loadView('admin.reports.client_statement.print', compact('title', 'informations', 'header_title', 'data', 'client'));
            return $pdf->stream('client_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $data = [];
        if ($request->has('filter')) {
            $previousBalance = ClientStatement::previousBalance($client_id, $start_date);
            $statements = ClientStatement::Statement($client_id, $start_date, $end_date, $previousBalance);
            $data = [
                'previousBalance' => $previousBalance,
                'statements' => $statements,
            ];
        }
        $title = 'Client Statement';
        $clients = Client::where('status', 1)->orderBy('name', 'asc')->get();
        $client_id = $request->client_id;
        $filter_link = Route('admin.client-statement.index');
        return view('admin.reports.client_statement.index', compact('title', 'filter_link', 'clients', 'data', 'client_id', 'start_date', 'end_date'));
    }

    public function deliveryStatement(Request $request, DeliveryStatementDataTable $dataTable)
    {
        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            $client_id = $request->client_id;
            $client = Client::find($client_id);
            $header_title = 'Delivery Statement On ' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date));

            $query = DeliveryList::with(['sales', 'delivery']);
            if (!is_null($request->client_id)) {
                $query->where('client_id', $client_id);
            }
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->whereHas('delivery', function ($squery) use ($start_date, $end_date) {
                    $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                });
            }
            $data = $query->latest('id')->get();
            // return view('admin.reports.delivery_statement.print', compact('title', 'informations', 'header_title', 'data', 'client'));
            $pdf = Pdf::loadView('admin.reports.delivery_statement.print', compact('title', 'informations', 'header_title', 'data', 'client'));
            return $pdf->stream('delivery_statement_' . date('d_m_Y_H_i_s') . '.pdf');
        }
        $title = 'Delivery Statement';
        $clients = Client::where('status', 1)->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.delivery_statement.index', compact('title', 'clients'));
    }

    public function transferLog(Request $request, TransferLogDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('get_destination_store')) {
            $destination_stores = Store::where('status', 1)->where('id', '!=', $request->host_id)->get();
            return response()->json(['status' => 'success', 'destination_stores' => $destination_stores]);
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $host_id = $request->host_id;
            $destination_id = $request->destination_id;
            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            $report_title = 'Transfer History Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';

            $query = TransferProduct::with(['transfer', 'product']);
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->whereHas('transfer', function ($squery) use ($start_date, $end_date) {
                    $squery->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                });
            }
            if (!is_null($request->host_id)) {
                $query->whereHas('transfer', function ($squery) use ($host_id) {
                    $squery->where('host_id', $host_id);
                });
            }
            if (!is_null($request->destination_id)) {
                $query->whereHas('transfer', function ($squery) use ($destination_id) {
                    $squery->where('destination_id', $destination_id);
                });
            }
            $data = $query->latest('id')->get();
            // return view('admin.reports.transfer_log.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.transfer_log.print', compact('title', 'informations', 'report_title', 'data'));
            return $pdf->stream('transfer_log_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Transfer Log';
        $stores = Store::where('status', 1)->get();
        return $dataTable->render('admin.reports.transfer_log.index', compact('title', 'stores'));
    }

    public function stockStatus(Request $request)
    {
        if ($request->ajax()) {
            if (!is_null($request->category_id)) {
                $products = Product::where('status', 1)->whereIn('category_id', $request->category_id)->orderBy('name', 'asc')->get();
            } else {
                $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'products' => $products]);
        }
    
        $category_id = $request->category_id;
        $product_id = $request->product_id;
        if (!is_null($request->date_range)) {
            $date_range = explode('to', $request->date_range);
        }
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->store_id) {
            $store_id = $request->store_id;
            $selected_stores = Store::where('status', 1)->whereIn('id', $store_id)->get(['name']);
        } else {
            $store_id = Store::withoutGlobalScope(CompanyScope::class)->where('status', 1)->get(['id'])->pluck('id')->toArray();
            $selected_stores = [];
        }
    
        $data = [];
        if ($request->has('filter')) {
            $company_id = Auth::user()->company_id;
    
            // ---------- Product list (UOM shoho) ----------
            $query = DB::table('products as p')
                ->leftJoin('attributes as a', 'a.id', '=', 'p.attribute_id')
                ->select('p.id as product_id', 'p.name', 'p.code', 'a.name as attribute_name');
            if ($company_id) {
                $query->where('p.company_id', $company_id);
            }
            if ($category_id) {
                $query->whereIn('p.category_id', array_filter((array) $category_id));
            }
            if ($product_id) {
                $query->whereIn('p.id', array_filter((array) $product_id));
            }
            $searched_products = $query->orderBy('p.name', 'asc')->get();
            $product_ids = $searched_products->pluck('product_id')->toArray();
    
            // ---------- Lifting (purchase) ----------
            $liftings = DB::table('lifting_products as lp')
                ->join('liftings as l', 'l.id', '=', 'lp.lifting_id')
                ->whereNull('l.deleted_at')
                ->whereIn('lp.product_id', $product_ids)
                ->whereIn('l.store_id', $store_id)
                ->get(['lp.product_id', 'lp.qty', 'l.lifting_date as date', 'l.store_id']);
    
            // ---------- Lifting return ----------
            $lifting_returns = DB::table('lifting_return_lists as lrl')
                ->join('lifting_returns as lr', 'lr.id', '=', 'lrl.lifting_return_id')
                ->whereNull('lr.deleted_at')
                ->whereIn('lrl.product_id', $product_ids)
                ->whereIn('lr.store_id', $store_id)
                ->get(['lrl.product_id', 'lrl.qty', 'lr.date', 'lr.store_id']);
    
            // ---------- Sales ----------
            $sales = DB::table('sales_lists as sl')
                ->join('sales as s', 's.id', '=', 'sl.sales_id')
                ->whereNull('s.deleted_at')
                ->whereIn('sl.product_id', $product_ids)
                ->whereIn('s.store_id', $store_id)
                ->get(['sl.product_id', 'sl.qty', 's.date', 's.store_id']);
    
            // ---------- Sales return (shudhu approved, damaged bad) ----------
            $sales_returns = DB::table('sales_return_lists as srl')
                ->join('sales_returns as sr', 'sr.id', '=', 'srl.sales_return_id')
                ->whereNull('sr.deleted_at')
                ->where('sr.approve', 1)
                ->where('sr.reject', 0)
                ->whereIn('srl.product_id', $product_ids)
                ->whereIn('sr.store_id', $store_id)
                ->get(['srl.product_id', DB::raw('(srl.qty - srl.damaged_qty) as qty'), 'sr.date', 'sr.store_id']);
    
            // ---------- Online sales ----------
            $online_sales = DB::table('order_products as op')
                ->join('orders as o', 'o.id', '=', 'op.order_id')
                ->whereNull('o.deleted_at')
                ->where('o.order_type', 'online')
                ->where('op.sold', 1)
                ->whereNotNull('o.store_id')
                ->whereIn('op.product_id', $product_ids)
                ->whereIn('o.store_id', $store_id)
                ->get(['op.product_id', 'op.quantity as qty', 'o.date', 'o.store_id']);
    
            // ---------- Transfer / Receive (shudhu approved) ----------
            $transfer_or_receives = DB::table('transfer_products as tp')
                ->join('transfers as t', 't.id', '=', 'tp.transfer_id')
                ->whereNull('t.deleted_at')
                ->where('t.approve', 1)
                ->whereIn('tp.product_id', $product_ids)
                ->get(['tp.product_id', 'tp.qty', 't.date', 't.host_id', 't.destination_id']);
    
            $data = [
                'start_date' => $start_date,
                'end_date' => $end_date,
                'store_id' => $store_id,
                'searched_products' => $searched_products,
                'liftings' => $liftings,
                'lifting_returns' => $lifting_returns,
                'sales' => $sales,
                'sales_returns' => $sales_returns,
                'online_sales' => $online_sales,
                'transfer_or_receives' => $transfer_or_receives,
            ];
        }
    
        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            if (count($selected_stores) > 0) {
                $string = '';
                foreach ($selected_stores as $key => $store_item) {
                    $string .= $store_item->name;
                    if ($key > 0) {
                        $string .= ', ';
                    }
                }
                $report_title = 'Stock Status (' . $string . ') <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            } else {
                $report_title = 'Stock Status (ALL) <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            }
    
            // Ekhon HTML view dekhay. PDF chaile nicher line muche tarpor 3 line er comment tule din.
            return view('admin.reports.stock_status.print', compact('title', 'informations', 'report_title', 'data'));
    
            // $pdf = Pdf::loadView('admin.reports.stock_status.print', compact('title', 'informations', 'report_title', 'data'));
            // $pdf->setPaper('A4', 'landscape');
            // return $pdf->stream('stock_status_' . date('d_m_Y_H_i_s') . '.pdf');
        }
    
        $title = 'Stock Status';
        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        if ($category_id) {
            $products = Product::where('status', 1)->whereIn('category_id', $category_id)->orderBy('name', 'asc')->get();
        } else {
            $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        }
        $stores = Store::where('status', 1)->get();
        $store_id = $request->store_id;
        $filter_link = Route('admin.stock-status.index');
        return view('admin.reports.stock_status.index', compact('title', 'filter_link', 'stores', 'categories', 'products', 'data', 'store_id', 'category_id', 'product_id', 'start_date', 'end_date'));
    }

    public function stockValuation(Request $request)
    {
        if ($request->ajax()) {
            if (!is_null($request->category_id)) {
                $products = Product::where('status', 1)->whereIn('category_id', $request->category_id)->orderBy('name', 'asc')->get();
            } else {
                $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        $category_id = $request->category_id;
        $product_id = $request->product_id;

        if ($request->store_id) {
            $store_id = $request->store_id;
            $selected_stores = Store::where('status', 1)->whereIn('id', $store_id)->get(['name']);
        } else {
            $store_id = Store::withoutGlobalScope(CompanyScope::class)->where('status', 1)->get(['id'])->pluck('id')->toArray();
            $selected_stores = [];
        }

        $data = [];
        if ($request->has('filter')) {
            $query = DB::table('view_liftings')->whereNotNull('date');
            $company_id = Auth::user()->company_id;
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            if ($category_id) {
                $query->whereIn('category_id', $category_id);
            }
            if ($product_id) {
                $query->whereIn('product_id', $product_id);
            }
            $product_prices = $query->groupBy('product_id')->orderBy('name', 'asc')->get(['product_id', 'name', 'code', 'attribute_name', 'category_name', 'sale_price']);
            $product_ids = $product_prices->pluck('product_id')->toArray();

            $liftings = DB::table('view_liftings')->whereIn('store_id', $store_id)->whereNotNull('date')->whereIn('product_id', $product_ids)->orderBy('name', 'asc')->get();
            $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $sales = DB::table('view_sales')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $transfer_or_receives = DB::table('view_transfers')->whereNotNull('date')->whereIn('product_id', $product_ids)->get();

            $data = [
                'product_prices' => $product_prices,
                'store_id' => $store_id,
                'liftings' => $liftings,
                'lifting_returns' => $lifting_returns,
                'sales' => $sales,
                'sales_returns' => $sales_returns,
                'online_sales' => $online_sales,
                'transfer_or_receives' => $transfer_or_receives,
            ];
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            if (count($selected_stores) > 0) {
                $string = '';
                foreach ($selected_stores as $key => $store_item) {
                    $string .= $store_item->name;
                    if ($key > 0) {
                        $string .= ', ';
                    }
                }
                $report_title = 'Stock Valuation (' . $string . ')';
            } else {
                $report_title = 'Stock Status (ALL)';
            }
            // return view('admin.reports.stock_valuation.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.stock_valuation.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('stock_valuation_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Stock Valuation';
        $store_id = $request->store_id;
        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        if ($category_id) {
            $products = Product::where('status', 1)->whereIn('category_id', $category_id)->orderBy('name', 'asc')->get();
        } else {
            $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        }
        $stores = Store::where('status', 1)->get();
        $filter_link = Route('admin.stock-valuation.index');
        return view('admin.reports.stock_valuation.index', compact('title', 'filter_link', 'stores', 'categories', 'products', 'data', 'store_id', 'category_id', 'product_id'));
    }

    public function salesContribution(Request $request)
    {
        $criteria = $request->criteria;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        $data = [];

        if ($request->has('filter')) {
            if ($request->criteria == "client") {
                $company_id = Auth::user()->company_id;
                $query = DB::table('view_client_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('client_name', 'asc');
                if ($company_id) {
                    $query->where('company_id', $company_id);
                }
                $client_sales = $query->select('*', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();
                $client_ids = $client_sales->pluck('client_id')->toArray();
                $client_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->select('client_id', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();

                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->get();
                $data = [
                    'client_sales' => $client_sales,
                    'client_returns' => $client_returns,
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "product") {
                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->select('*', DB::raw('SUM(qty) as qty'), DB::raw('SUM(amount) as amount'))->groupBy('product_id')->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->select('*', DB::raw('SUM(amount) as amount', DB::raw('SUM(qty) as qty')))->groupBy('product_id')->get();

                $data = [
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "category") {
                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $category_ids = $sales->groupBy('category_id')->pluck('category_id')->toArray();
                $sales = $sales->select('*', DB::raw('SUM(qty) as qty'), DB::raw('SUM(amount) as amount'))->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $category_ids2 = $online_sales->groupBy('category_id')->pluck('category_id')->toArray();
                $online_sales = $online_sales->select('*', DB::raw('SUM(qty) as qty'), DB::raw('SUM(amount) as amount'))->get();

                $data = [
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "employee") {
                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('staff_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->groupBy('staff_id')->select('*', DB::raw('SUM(amount) as amount'))->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->sum('amount');

                $total_sales = $sales->sum('amount') +  $online_sales;
                $data = [
                    'sales' => $sales,
                    'online_sales' => $online_sales,
                    'total_sales' => $total_sales,
                ];
            }

            if ($request->criteria == "client_type") {
                $company_id = Auth::user()->company_id;
                $query = DB::table('view_client_sales')->whereNotNull('date')->whereNotNull('client_category_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('client_category_name', 'asc');
                if ($company_id) {
                    $query->where('company_id', $company_id);
                }
                $cateogry_sales = $query->select('*', DB::raw('SUM(amount) as amount'))->groupBy('client_category_id')->get();
                $client_category_ids = $cateogry_sales->pluck('client_category_id')->toArray();
                $category_returns = DB::table('view_client_returns')->whereIn('client_category_id', $client_category_ids)->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->select('client_category_id', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();

                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->get();
                $data = [
                    'cateogry_sales' => $cateogry_sales,
                    'category_returns' => $category_returns,
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "region") {
                $company_id = Auth::user()->company_id;
                $query = DB::table('view_client_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('region_name', 'asc');
                if ($company_id) {
                    $query->where('company_id', $company_id);
                }
                $client_sales = $query->select('*', DB::raw('SUM(amount) as amount'))->groupBy('region_id')->get();
                $client_ids = $client_sales->pluck('client_id')->toArray();
                $client_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->select('client_id', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();

                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->get();
                $data = [
                    'client_sales' => $client_sales,
                    'client_returns' => $client_returns,
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "area") {
                $company_id = Auth::user()->company_id;
                $query = DB::table('view_client_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('area_name', 'asc');
                if ($company_id) {
                    $query->where('company_id', $company_id);
                }
                $client_sales = $query->select('*', DB::raw('SUM(amount) as amount'))->groupBy('region_id')->get();
                $client_ids = $client_sales->pluck('client_id')->toArray();
                $client_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->select('client_id', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();

                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->get();
                $data = [
                    'client_sales' => $client_sales,
                    'client_returns' => $client_returns,
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }

            if ($request->criteria == "territory") {
                $company_id = Auth::user()->company_id;
                $query = DB::table('view_client_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->orderBy('territory_name', 'asc');
                if ($company_id) {
                    $query->where('company_id', $company_id);
                }
                $client_sales = $query->select('*', DB::raw('SUM(amount) as amount'))->groupBy('region_id')->get();
                $client_ids = $client_sales->pluck('client_id')->toArray();
                $client_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date)->select('client_id', DB::raw('SUM(amount) as amount'))->groupBy('client_id')->get();

                $company_id = Auth::user()->company_id;
                $sales = DB::table('view_product_sales')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales->where('company_id', $company_id);
                }
                $sales = $sales->get();

                $sales_returns = DB::table('view_product_returns')->whereNotNull('date')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $sales_returns->where('company_id', $company_id);
                }
                $sales_returns = $sales_returns->get();

                $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('date', '>=', $start_date)->where('date', '<=', $end_date);
                if ($company_id) {
                    $online_sales->where('company_id', $company_id);
                }
                $online_sales = $online_sales->get();
                $data = [
                    'client_sales' => $client_sales,
                    'client_returns' => $client_returns,
                    'sales' => $sales,
                    'sales_returns' => $sales_returns,
                    'online_sales' => $online_sales,
                ];
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $report_title = 'Sales Contribution Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.sales_contribution.print', compact('title', 'informations', 'report_title', 'criteria', 'data'));
            $pdf = Pdf::loadView('admin.reports.sales_contribution.print', compact('title', 'informations', 'report_title', 'criteria', 'data'));
            // $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('sales_contribution_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Sales Contribution';
        $filter_link = Route('admin.sales-contribution.index');
        return view('admin.reports.sales_contribution.index', compact('title', 'filter_link', 'criteria', 'start_date', 'end_date', 'data'));
    }

    public function salesRealization(Request $request)
    {
        if ($request->ajax() && $request->has('get_area')) {
            $region_id = $request->region_id;
            $client_type = $request->client_type;
            $areas = Area::where('region_id', $region_id)->where('status', 1)->orderBy('name', 'asc')->get();
            $query = Client::with(['area'])->where('status', 1);
            if (!is_null($region_id)) {
                $query->whereHas('area', function ($squery) use ($region_id) {
                    $squery->where('region_id', $region_id);
                });
            }
            if (!is_null($request->client_type)) {
                $query->where('client_category_id', $client_type);
            }
            $clients = $query->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'areas' => $areas, 'clients' => $clients]);
        }
        if ($request->ajax() && $request->has('get_territory')) {
            $area_id = $request->area_id;
            $client_type = $request->client_type;
            $territories = Territory::where('area_id', $area_id)->where('status', 1)->orderBy('name', 'asc')->get();
            $query = Client::with(['area'])->where('status', 1);
            if (!is_null($request->area_id)) {
                $query->where('area_id', $area_id);
            }
            if (!is_null($request->client_type)) {
                $query->where('client_category_id', $client_type);
            }
            $clients = $query->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'territories' => $territories, 'clients' => $clients]);
        }
        if ($request->ajax() && $request->has('get_clients')) {
            $territory_id = $request->territory_id;
            $client_type = $request->client_type;
            $query = Client::with(['area'])->where('status', 1);
            if (!is_null($request->territory_id)) {
                $query->where('territory_id', $territory_id);
            }
            if (!is_null($request->client_category_id)) {
                $query->where('client_category_id', $client_type);
            }
            $clients = $query->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'clients' => $clients]);
        }

        $month = !is_null($request->month) ? $request->month : date('m');
        $year = !is_null($request->year) ? $request->year : date('Y');
        $region_id = $request->region_id;
        $area_id = $request->area_id;
        $territory_id = $request->territory_id;
        $client_category_id = $request->client_type;
        $client_id = $request->client_id;

        $query = DB::table('view_client_sales');
        $company_id = Auth::user()->company_id;
        if ($company_id) {
            $query->where('company_id', $company_id);
        }
        if (!is_null($client_category_id)) {
            $query->where('client_category_id', $client_category_id);
        }
        if (!is_null($region_id)) {
            $query->where('region_id', $region_id);
        }
        if (!is_null($area_id)) {
            $query->where('area_id', $area_id);
        }
        if (!is_null($territory_id)) {
            $query->where('territory_id', $territory_id);
        }
        $all_clients = $query->select('client_id as id', 'client_name as name')->groupBy('client_id')->orderBy('client_name', 'asc')->get();
        if ($client_id) {
            $query->whereIn('client_id', $client_id);
        }
        $clients = $query->select('client_id', 'client_name')->whereNotNull('amount')->groupBy('client_id')->orderBy('client_name', 'asc')->get();

        $data = [];
        if ($request->has('filter')) {
            $client_ids = $clients->pluck('client_id')->toArray();
            $client_sales = DB::table('view_client_sales')->whereIn('client_id', $client_ids)->get();
            $client_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->get();
            $client_collections = DB::table('view_client_collections')->whereIn('client_id', $client_ids)->get();
            $data = [
                'clients' => $clients,
                'client_sales' => $client_sales,
                'client_returns' => $client_returns,
                'client_collections' => $client_collections,
                'first_of_month' => Carbon::create($year, $month)->firstOfMonth()->format('Y-m-d'),
                'last_of_month' => Carbon::create($year, $month)->lastOfMonth()->format('Y-m-d'),
                'first_of_year' => Carbon::create($year)->firstOfYear()->format('Y-m-d'),
                'last_of_year' => Carbon::create($year)->lastofYear()->format('Y-m-d'),
                'previous_year' => Carbon::create($year)->firstOfYear()->format('Y-m-d')
            ];
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Sales Realization For The Month Of ' . date('F', mktime(0, 0, 0, $month, 10)) . ' - ' . $year;
            // return view('admin.reports.sales_realization.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            $pdf = Pdf::loadView('admin.reports.sales_realization.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('sales_realization_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Sales Realization';
        $filter_link = Route('admin.sales-realization.index');
        $regions = Region::where('status', 1)->orderBy('name', 'asc')->get();
        if ($region_id) {
            $areas = Area::where('status', 1)->where('region_id', $region_id)->orderBy('name', 'asc')->get();
        } else {
            $areas = [];
        }
        if ($area_id) {
            $territories = Territory::where('status', 1)->where('area_id', $area_id)->orderBy('name', 'asc')->get();
        } else {
            $territories = [];
        }
        $categories = ClientCategory::where('status', 1)->orderBy('name', 'asc')->get();
        return view('admin.reports.sales_realization.index', compact('title', 'filter_link', 'regions', 'areas', 'territories', 'categories', 'all_clients', 'client_id', 'region_id', 'area_id', 'territory_id', 'client_category_id', 'month', 'year', 'data'));
    }

    public function salesAgeing(Request $request)
    {
        if ($request->ajax() && $request->has('get_area')) {
            $areas = Area::where('region_id', $request->region_id)->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'areas' => $areas]);
        }
        if ($request->ajax() && $request->has('get_territory')) {
            $territories = Territory::where('area_id', $request->area_id)->where('status', 1)->orderBy('name', 'asc')->get();
            return response()->json(['status' => 'success', 'territories' => $territories]);
        }

        $region_id = $request->region_id;
        $area_id = $request->area_id;
        $territory_id = $request->territory_id;

        $data = [];
        if ($request->has('filter')) {
            $one_start_date = Carbon::now()->subDays(0)->format('Y-m-d');
            $one_end_date = Carbon::now()->subDays(30)->format('Y-m-d');
            $two_start_date = Carbon::now()->subDays(31)->format('Y-m-d');
            $two_end_date = Carbon::now()->subDays(60)->format('Y-m-d');
            $three_start_date = Carbon::now()->subDays(61)->format('Y-m-d');
            $three_end_date = Carbon::now()->subDays(90)->format('Y-m-d');
            $over_three_start_date = Carbon::now()->subDays(91)->format('Y-m-d');

            $query = DB::table('view_client_sales');
            $company_id = Auth::user()->company_id;
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            if (!is_null($region_id)) {
                $query->where('region_id', $region_id);
            }
            if (!is_null($area_id)) {
                $query->where('area_id', $area_id);
            }
            if (!is_null($territory_id)) {
                $query->where('territory_id', $territory_id);
            }
            $clients = $query->select('client_id', 'client_name')->whereNotNull('amount')->groupBy('client_id')->orderBy('client_name', 'asc')->get();
            $client_ids = $clients->pluck('client_id')->toArray();
            $client_sales = DB::table('view_client_sales')->whereIn('client_id', $client_ids)->get();
            $data = [
                'clients' => $clients,
                'client_sales' => $client_sales,
                'one_start_date' => $one_start_date,
                'one_end_date' => $one_end_date,
                'two_start_date' => $two_start_date,
                'two_end_date' => $two_end_date,
                'three_start_date' => $three_start_date,
                'three_end_date' => $three_end_date,
                'over_three_start_date' => $over_three_start_date
            ];
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Ageing Report';
            // return view('admin.reports.sales_ageing.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.sales_ageing.print', compact('title', 'informations', 'report_title', 'data'));
            return $pdf->stream('sales_ageing_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Ageing Report';
        $filter_link = Route('admin.sales-ageing.index');
        $regions = Region::where('status', 1)->orderBy('name', 'asc')->get();
        if ($region_id) {
            $areas = Area::where('status', 1)->where('region_id', $region_id)->orderBy('name', 'asc')->get();
        } else {
            $areas = [];
        }
        if ($area_id) {
            $territories = Territory::where('status', 1)->where('area_id', $area_id)->orderBy('name', 'asc')->get();
        } else {
            $territories = [];
        }
        return view('admin.reports.sales_ageing.index', compact('title', 'filter_link', 'regions', 'areas', 'territories', 'region_id', 'area_id', 'territory_id', 'data'));
    }


    public function liftingRealization(Request $request)
    {
        $vendor_id = $request->vendor_id;
        $month = !is_null(request('month')) ? request('month') : date('m');
        $year = !is_null(request('year')) ? request('year') : date('Y');
        $data = [];
        if ($request->has('filter')) {
            $query = Vendor::where('status', 1);
            if (!is_null($vendor_id)) {
                $query->whereIn('id', $vendor_id);
            }
            $vendors = $query->orderBy('name', 'asc')->get();
            foreach ($vendors as $vendor) {
                $realization = new LiftingRealization($vendor->id, $year, $month);
                $payable = $realization->getPreviousBalance() + $realization->getYearlyInfo()['balance'];
                if ($payable > 0) {
                    $data[] = [
                        'vendor' => $vendor,
                        'previousBalance' => $realization->getPreviousBalance(),
                        'year_liftings' => $realization->getYearlyInfo()['lifting'],
                        'year_payments' => $realization->getYearlyInfo()['payment'],
                        'year_return' => $realization->getYearlyInfo()['return'],
                        'year_balance' => $realization->getYearlyInfo()['balance'],
                        'month_liftings' => $realization->getMonthlyInfo()['lifting'],
                        'month_payments' => $realization->getMonthlyInfo()['payment'],
                        'month_return' => $realization->getMonthlyInfo()['return'],
                        'month_balance' => $realization->getMonthlyInfo()['balance'],
                        'payable' => $payable,
                    ];
                }
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Lifting Payment Summary Till ' . date('F', strtotime($month))  . ' - ' . $year;
            // return view('admin.reports.lifting_realization.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            $pdf = Pdf::loadView('admin.reports.lifting_realization.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('lifting_realization_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Lifting Realization';
        $filter_link = Route('admin.lifting-realization.index');
        $vendors = Vendor::where('status', 1)->orderBy('name', 'asc')->get();
        return view('admin.reports.lifting_realization.index', compact('title', 'filter_link', 'vendors', 'vendor_id', 'year', 'month', 'data'));
    }

    public function clientOutstanding(Request $request)
    {
        if ($request->ajax() && $request->has('get_location')) {
            if ($request->distribution == 'region') {
                $locations = Region::where('status', 1)->orderBy('name', 'asc')->get();
                return response()->json(['status' => 'success', 'locations' => $locations]);
            }
            if ($request->distribution == 'area') {
                $locations = Area::where('status', 1)->orderBy('name', 'asc')->get();
                return response()->json(['status' => 'success', 'locations' => $locations]);
            }
            if ($request->distribution == 'territory') {
                $locations = Territory::where('status', 1)->orderBy('name', 'asc')->get();
                return response()->json(['status' => 'success', 'locations' => $locations]);
            }
        }

        $staff_id = $request->staff_id;
        $distribution = $request->distribution;
        $location_id = $request->location_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $data = [];
        if ($request->has('filter')) {
            $company_id = Auth::user()->company_id;
            $query = DB::table('view_client_sales');
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            if (!is_null($staff_id)) {
                $query->where('staff_id', $staff_id);
            }
            if ($distribution == 'region' && !is_null($location_id)) {
                $query->where('region_id', $location_id);
            }
            if ($distribution == 'area' && !is_null($location_id)) {
                $query->where('area_id', $location_id);
            }
            if ($distribution == 'territory' && !is_null($location_id)) {
                $query->where('territory_id', $location_id);
            }
            $clients = $query->whereNotNull('date')->groupBy('client_id')->orderBy('client_name', 'asc')->get();
            $client_ids = $clients->pluck('client_id')->toArray();

            $query = DB::table('view_client_sales');
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            if (!is_null($staff_id)) {
                $query->where('staff_id', $staff_id);
            }
            if ($distribution == 'region' && !is_null($location_id)) {
                $query->where('region_id', $location_id);
            }
            if ($distribution == 'area' && !is_null($location_id)) {
                $query->where('area_id', $location_id);
            }
            if ($distribution == 'territory' && !is_null($location_id)) {
                $query->where('territory_id', $location_id);
            }
            $total_sales = $query->whereNotNull('date')->orderBy('client_name', 'asc')->get();

            // ====== ************************************** ====== //
            $total_returns = DB::table('view_client_returns')->whereIn('client_id', $client_ids)->get();
            $total_collections = DB::table('view_client_collections')->whereIn('client_id', $client_ids)->get();
            // ====== ************************************** ====== //

            $data = [
                'clients' => $clients,
                'opening_sales' => $total_sales->where('date', '<', $start_date),
                'opening_returns' => $total_returns->where('date', '<', $start_date),
                'opening_collections' => $total_collections->where('payment_date', '<', $start_date),
                'sales' => $total_sales->where('date', '>=', $start_date)->where('date', '<=', $end_date),
                'returns' => $total_returns->where('date', '>=', $start_date)->where('date', '<=', $end_date),
                'collections' => $total_collections->where('payment_date', '>=', $start_date)->where('payment_date', '<=', $end_date),
            ];
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Client Outstanding Ratio';
            // return view('admin.reports.client_outstanding.print', compact('title', 'informations', 'report_title', 'start_date', 'end_date', 'data'));
            $pdf = Pdf::loadView('admin.reports.client_outstanding.print', compact('title', 'informations', 'report_title', 'start_date', 'end_date', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('client_outstanding_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Client Outstanding';
        $filter_link = Route('admin.client-outstanding.index');
        $staffs = Staff::where('status', 1)->where('type', 'sales')->orderBy('name', 'asc')->get();
        $distributions = ['region' => 'Region', 'area' => 'Area', 'territory' => 'Territory'];
        $locations = [];
        if (!is_null($distribution) && $distribution == 'region') {
            $locations = Region::where('status', 1)->orderBy('name', 'asc')->get();
        } elseif (!is_null($distribution) && $distribution == 'area') {
            $locations = Area::where('status', 1)->orderBy('name', 'asc')->get();
        } elseif (!is_null($distribution) && $distribution == 'territory') {
            $locations = Territory::where('status', 1)->orderBy('name', 'asc')->get();
        }

        return view('admin.reports.client_outstanding.index', compact('title', 'filter_link', 'staffs', 'distributions', 'locations', 'staff_id', 'distribution', 'location_id', 'start_date', 'end_date', 'data'));
    }

    public function SalesTargetAchievement(Request $request, SalesTargetAchivementDataTable $dataTable)
    {
        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $query = Group::with(['leader', 'members', 'targets']);
            $group_id = $request->group_id;
            if (!is_null($group_id)) {
                $query->whereIn('id', $group_id);
            }
            $month = $request->month;
            $year = $request->year;
            $query->whereHas('targets', function ($squery) use ($month, $year) {
                $squery->where('month', $month)->where('year', $year);
            });
            $data = $query->orderBy('name', 'asc')->get();

            $report_title = 'Sales Target & Achievement';
            // return view('admin.reports.sales_target_achievement.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            $pdf = Pdf::loadView('admin.reports.sales_target_achievement.print', compact('title', 'informations', 'report_title', 'month', 'year', 'data'));
            return $pdf->stream('sales_target_achievement_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Sales Target & Achievement';
        $groups = Group::orderBy('name')->get();
        return $dataTable->render('admin.reports.sales_target_achievement.index', compact('title', 'groups'));
    }

    public function productWiseProfit(Request $request)
    {
        if ($request->ajax() && $request->has('get_products')) {
            if (!is_null($request->category_id)) {
                $products = Product::whereIn('category_id', $request->category_id)->where('status', 1)->orderBy('name', 'asc')->get();
            } else {
                $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        $category_id = $request->category_id;
        $product_id = $request->product_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $data = [];
        if ($request->has('filter')) {
            $query = DB::table('view_liftings')->whereNotNull('date')
                ->where('date', '>=', $start_date)
                ->where('date', '<=', $end_date);
            $company_id = Auth::user()->company_id;
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            if ($category_id) {
                $query->whereIn('category_id', $category_id);
            }
            if ($product_id) {
                $query->whereIn('product_id', $product_id);
            }
            $searched_products = $query->groupBy('product_id')->orderBy('name', 'asc')->get(['product_id', 'name', 'code', 'attribute_name', 'category_name']);
            $product_ids = $searched_products->pluck('product_id')->toArray();

            $liftings = DB::table('view_liftings')->whereNotNull('date')->whereIn('product_id', $product_ids)->orderBy('name', 'asc')->get();
            $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->get();
            $sales = DB::table('view_sales')->whereNotNull('date')->whereIn('product_id', $product_ids)->get();
            $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->whereIn('product_id', $product_ids)->get();
            $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->get();

            $data = [
                'start_date' => $start_date,
                'end_date' => $end_date,
                'searched_products' => $searched_products,
                'liftings' => $liftings,
                'lifting_returns' => $lifting_returns,
                'sales' => $sales,
                'sales_returns' => $sales_returns,
                'online_sales' => $online_sales,
            ];
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Product Wise Profit';
            // return view('admin.reports.product_wise_profit.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.product_wise_profit.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('product_wise_profit_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Product Wise Profit';
        $filter_link = Route('admin.product-wise-profit.index');
        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        return view('admin.reports.product_wise_profit.index', compact('title', 'filter_link', 'categories', 'products', 'category_id', 'product_id', 'data', 'start_date', 'end_date'));
    }

    public function accessLog(Request $request, AccessLogDataTable $dataTable)
    {
        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $query = AccessLog::with(['user']);
            $user_id = $request->user_id;
            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
            if (!is_null($user_id)) {
                $query->where('user_id', '>=', $user_id);
                $user = User::find($user_id)->name;
            } else {
                $user = 'All';
            }
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->where('date_time', '>=', $start_date)->where('date_time', '<=', $end_date);
            }
            $data = $query->orderBy('date_time', 'desc')->get();

            $report_title = 'Access Log';
            // return view('admin.reports.access_log.print', compact('title', 'informations', 'report_title', 'data', 'start_date', 'end_date', 'user'));
            $pdf = Pdf::loadView('admin.reports.access_log.print', compact('title', 'informations', 'report_title', 'data', 'start_date', 'end_date', 'user'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('access_log_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Access Log';
        $query = User::where('status', 1);
        $company_id = Auth::user()->company_id;
        if ($company_id) {
            $query->where('company_id', $company_id);
        }
        $users = $query->orderBy('name', 'asc')->get();
        return $dataTable->render('admin.reports.access_log.index', compact('title', 'users'));
    }

    public function productStatement(Request $request)
    {
        $product_id = $request->product_id;
        if (!is_null($request->date_range)) {
            $date_range = explode('to', $request->date_range);
        }
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        if ($request->store_id) {
            $store_id = [$request->store_id];
        } else {
            $store_id = Store::where('status', 1)->get(['id'])->pluck('id')->toArray();
        }

        $data = [
            'opening' => 0,
            'statements' => [],
        ];

        if ($request->has('filter') && $request->product_id) {
            $previousBalance = ProductStatement::previousBalance($start_date, $product_id, $store_id);
            $statements = ProductStatement::Statement($start_date, $end_date, $product_id, $store_id, $previousBalance);
            $data = [
                'opening' => $previousBalance,
                'statements' => $statements,
            ];
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $report_title = 'Product Statement Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.product_statement.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.product_statement.print', compact('title', 'informations', 'report_title', 'data'));
            return $pdf->stream('product_statement_' . date('d_m_Y_H_i_s') . '.pdf');
        }

        $title = 'Product Statement';
        $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        $stores = Store::where('status', 1)->get();
        $store_id = $request->store_id;
        $filter_link = Route('admin.product-statement.index');
        return view('admin.reports.product_statement.index', compact('title', 'filter_link', 'stores', 'products', 'data', 'store_id', 'product_id', 'start_date', 'end_date'));
    }

    public function salesManFlowChart(Request $request)
    {
        if (!is_null($request->date_range)) {
            $date_range = explode('to', $request->date_range);
        }
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $sales = 0;
        $collections = 0;
        $staff_id = $request->staff_id;

        // Dealer Chart
        $total_sales_collections = [];
        if ($staff_id) {
            $dateRange = CarbonPeriod::create($start_date, $end_date);
            foreach ($dateRange as $date) {
                $date = $date->format('Y-m-d');
                $total_sales = Sales::where('staff_id', $staff_id)->where('date', $date)->sum(DB::raw('total_amount - discount'));
                $total_collection = Collection::where('staff_id', $staff_id)->where('payment_date', $date)->where('collection_type', '!=', 'adjust')->sum('amount');

                $info = [
                    'total_sales' => number_format($total_sales, 2, '.', ''),
                    'total_collection' => number_format($total_collection, 2, '.', ''),
                    'date' => date('d-m', strtotime($date)),
                ];

                $total_sales_collections[] = $info;
                $sales += $total_sales;
                $collections += $total_collection;
            }
        }

        $title = 'Sales Man Performance Flow';
        $staffs = Staff::where('status', 1)->where('type', 'sales')->orderBy('name', 'asc')->get();
        $filter_link = Route('admin.salesman-flowchart.index');
        return view('admin.reports.salesman_flowchart.index', compact('title', 'filter_link', 'staffs', 'staff_id', 'start_date', 'end_date', 'sales', 'collections', 'total_sales_collections'));
    }

    public function clientSalesFlow(Request $request)
    {
        if (!is_null($request->date_range)) {
            $date_range = explode('to', $request->date_range);
        }
        $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $sales = 0;
        $collections = 0;
        $client_id = $request->client_id;

        // Dealer Chart
        $total_sales_collections = [];
        if ($client_id) {
            $dateRange = CarbonPeriod::create($start_date, $end_date);
            foreach ($dateRange as $date) {
                $date = $date->format('Y-m-d');
                $total_sales = Sales::where('client_id', $client_id)->where('date', $date)->sum(DB::raw('total_amount - discount'));
                $total_collection = Collection::where('client_id', $client_id)->where('payment_date', $date)->where('collection_type', '!=', 'adjust')->sum('amount');

                $info = [
                    'total_sales' => number_format($total_sales, 2, '.', ''),
                    'total_collection' => number_format($total_collection, 2, '.', ''),
                    'date' => date('d-m', strtotime($date)),
                ];

                $total_sales_collections[] = $info;
                $sales += $total_sales;
                $collections += $total_collection;
            }
        }

        $title = 'Client Sales Flow';
        $clients = Client::where('status', 1)->orderBy('name', 'asc')->get();
        $filter_link = Route('admin.client-sales-flow.index');
        return view('admin.reports.client_sales_flow.index', compact('title', 'filter_link', 'clients', 'client_id', 'start_date', 'end_date', 'sales', 'collections', 'total_sales_collections'));
    }

    public function onlineSalesHistory(Request $request, OnlineSalesHistoryDataTable $dataTable, OnlineSalesSummaryDataTable $summaryDatatable)
    {
        if ($request->ajax() && $request->has('get_products')) {
            if (!is_null($request->category_id)) {
                $query = Product::query();
                $query->whereIn('category_id', $request->category_id);
                $products = $query->where('status', 1)->orderBy('name', 'asc')->get();
            } else {
                $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        if ($request->has('print')) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }


            $date_range = explode('to', $request->date_range);
            $start_date = isset($date_range[0]) ? date('Y-m-d', strtotime($date_range[0])) : NULL;
            $end_date = isset($date_range[1]) ? date('Y-m-d', strtotime($date_range[1])) : NULL;
            $category_id = $request->category_id;
            $product_id = $request->product_id;
            $report_type = $request->report_type;

            if ($request->report_type == 'history') {
                $report_title = 'Online Sales History On ' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date));

                $query = OrderProduct::with(['order', 'product']);
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_id);
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_id) {
                        $squery->whereIn('category_id', $category_id);
                    });
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                        $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
                    });
                } else {
                    $start_date = date('Y-m-01');
                    $end_date = date('Y-m-t');
                    $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                        $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
                    });
                }

                $data = $query->orderBy('id', 'desc')->get();
                // return view('admin.reports.online_sales_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf = Pdf::loadView('admin.reports.online_sales_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                return $pdf->stream('online_sales_history_' . date('d_m_Y_H_i_s') . '.pdf');
            } else {
                $report_title = 'Online Sales Summary On ' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date));

                $query = OrderProduct::with(['order', 'product']);
                if (!is_null($request->product_id)) {
                    $query->whereIn('product_id', $product_id);
                }
                if (!is_null($request->category_id)) {
                    $query->whereHas('product', function ($squery) use ($category_id) {
                        $squery->whereIn('category_id', $category_id);
                    });
                }
                if (!is_null($start_date) && !is_null($end_date)) {
                    $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                        $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
                    });
                } else {
                    $start_date = date('Y-m-01');
                    $end_date = date('Y-m-t');
                    $query->whereHas('order', function ($squery) use ($start_date, $end_date) {
                        $squery->where('created_at', '>=', $start_date)->where('created_at', '<=', $end_date)->where('order_type', 'online');
                    });
                }
                $data = $query->groupBy('product_id')->select(['product_id', DB::raw('SUM(order_price) as total_amount'), DB::raw('SUM(order_products.quantity) as total_qty')])->get();
                // return view('admin.reports.online_sales_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                $pdf = Pdf::loadView('admin.reports.online_sales_history.print', compact('title', 'informations', 'report_title', 'report_type', 'data'));
                return $pdf->stream('online_sales_summary_' . date('d_m_Y_H_i_s') . '.pdf');
            }
        }

        $filter_link = Route('admin.online-sales-history.index');
        $category_id = $request->category_id;
        $product_id = $request->product_id;
        $date_range = explode('to', $request->date_range);
        $start_date = isset($date_range[0]) ? date('d-m-Y', strtotime($date_range[0])) : NULL;
        $end_date = isset($date_range[1]) ? date('d-m-Y', strtotime($date_range[1])) : NULL;

        $categories = Category::where('status', 1)->orderBy('name', 'asc')->get();
        if (is_array($category_id)) {
            $products = Product::where('status', 1)->whereIn('category_id', $category_id)->orderBy('name', 'asc')->get();
        } else {
            $products = Product::where('status', 1)->orderBy('name', 'asc')->get();
        }

        $report_type = $request->report_type;
        if ($report_type == 'product_summary') {
            $title = 'Online Sales Summary Report';
            return $summaryDatatable->render('admin.reports.online_sales_history.index', compact('title', 'filter_link', 'products', 'categories', 'start_date', 'end_date', 'category_id', 'product_id', 'report_type'));
        } else {
            $title = 'Online Sales History Report';
            return $dataTable->render('admin.reports.online_sales_history.index', compact('title', 'filter_link', 'products', 'categories', 'start_date', 'end_date', 'category_id', 'product_id', 'report_type'));
        }
    }

    public function coaList(Request $request, CoaListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $query = CoaSetup::query();
            $parent_head = $request->parent_head;
            if ($parent_head) {
                $query->where('head_code', 'LIKE', $parent_head . '%')->where('transaction', 1);
            }
            $data = $query->orderBy('head_name', 'asc')->get();

            $report_title = 'Chart of Accounts';
            // return view('admin.reports.coa_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.coa_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4');
            return $pdf->stream('coa_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Chart of Accounts';
        $filter_link = Route('admin.coa-list.index');
        return $dataTable->render('admin.reports.coa_list.index', compact('title', 'filter_link'));
    }

    public function voucherList(Request $request, voucherListDataTable $dataTable)
    {
        if ($request->ajax() && $request->has('getHeads')) {
            $value = $request->head_type;
            if ($value == 'gl') {
                $heads = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
            } else {
                $heads = CoaSetup::whereNull('parent_id')->orderBy('head_name', 'asc')->get();
            }
            return response()->json(['status' => 'success', 'heads' => $heads]);
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $query = AccountTransaction::query();
            $voucher_type = $request->voucher_type;
            $date_range = explode('to', $request->date_range);
            $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
            $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
            if (!is_null($voucher_type)) {
                $query->where('voucher_type', $voucher_type);
            }
            if (!is_null($start_date) && !is_null($end_date)) {
                $query->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date);
            }

            $data = $query->select('*', DB::raw('SUM(debit_amount) as amount'))->orderBY('id', 'desc')
                ->orderBY('voucher_date', 'desc')
                ->groupBy('voucher_no')->get();

            $report_title = 'Voucher List';
            // return view('admin.reports.voucher_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.voucher_list.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('voucher_list_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Voucher List';
        $filter_link = Route('admin.voucher-list.index');
        $voucher_types = AccountTransaction::groupBy('voucher_type')->orderBy('voucher_type', 'asc')->get();
        return $dataTable->render('admin.reports.voucher_list.index', compact('title', 'filter_link', 'voucher_types'));
    }

    public function cashBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_setup_id = $request->coa_setup_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'desc')->get();
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Cash book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.cash_book.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf = Pdf::loadView('admin.reports.cash_book.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Book';
        $filter_link = Route('admin.cash-book.index');
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10102%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.cash_book.index', compact('title', 'filter_link', 'coas', 'coa_setup_id', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function bankBook(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_setup_id = $request->coa_setup_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'desc')->get();
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Bank book Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.bank_book.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf = Pdf::loadView('admin.reports.bank_book.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('bank_book_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Bank Book';
        $filter_link = Route('admin.bank-book.index');
        $coas = CoaSetup::where('transaction', 1)->where('head_code', 'LIKE', '10103%')->orderBy('head_name', 'asc')->get();
        return view('admin.reports.bank_book.index', compact('title', 'filter_link', 'coas', 'coa_setup_id', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function transactionLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_setup_id = $request->coa_setup_id;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_setup_id)) {
                $previousBalance = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_setup_id', $request->coa_setup_id)->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'desc')->get();
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Transaction Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.transaction_ledger.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf = Pdf::loadView('admin.reports.transaction_ledger.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('transaction_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Transaction Ledger';
        $filter_link = Route('admin.transaction-ledger.index');
        $coas = CoaSetup::where('transaction', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.transaction_ledger.index', compact('title', 'filter_link', 'coas', 'coa_setup_id', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function cashFlowStatement(Request $request)
    {
        $data = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        $generalLedgerHeadCash = 10102;
        $generalLedgerHeadBank = 10103;

        if ($request->has('filter')) {
            $data = AccountTransaction::where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->groupBy('voucher_date')->orderBy('voucher_date', 'desc')->get('voucher_date');
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Cash Flow Statement <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.cash_flow_statement.print', compact('title', 'informations', 'report_title', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
            $pdf = Pdf::loadView('admin.reports.cash_flow_statement.print', compact('title', 'informations', 'report_title', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('cash_flow_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Cash Flow Statement';
        $filter_link = Route('admin.cash-flow-statement.index');
        return view('admin.reports.cash_flow_statement.index', compact('title', 'filter_link', 'start_date', 'end_date', 'data', 'generalLedgerHeadCash', 'generalLedgerHeadBank'));
    }

    public function generalLedger(Request $request)
    {
        $previousBalance = 0;
        $data = array();
        $coa_head_code = $request->coa_head_code;
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            if (!is_null($request->coa_head_code)) {
                $previousBalance = AccountTransaction::where('coa_head_code', 'LIKE', $request->coa_head_code . '%')->where('voucher_date', '<', $start_date)->sum(DB::raw('debit_amount - credit_amount'));
                $data = AccountTransaction::where('coa_head_code', 'LIKE', $request->coa_head_code . '%')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->orderBy('voucher_date', 'asc')->get();
            }
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'General Ledger Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.general_ledger.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf = Pdf::loadView('admin.reports.general_ledger.print', compact('title', 'informations', 'report_title', 'previousBalance', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('general_ledger_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'General Ledger';
        $filter_link = Route('admin.general-ledger.index');
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.general_ledger.index', compact('title', 'filter_link', 'coas', 'coa_head_code', 'start_date', 'end_date', 'previousBalance', 'data'));
    }

    public function incomeStatement(Request $request)
    {
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');

        $opening_balance = 0;
        $closing_balance = 0;
        $incomes = array();
        $expenses = array();
        if ($request->has('filter')) {
            $query = DB::table('view_liftings');
            $company_id = Auth::user()->company_id;
            if ($company_id) {
                $query->where('company_id', $company_id);
            }
            $store_id = Store::where('status', 1)->get(['id'])->pluck('id')->toArray();
            $product_prices = $query->whereIn('store_id', $store_id)->whereNotNull('date')->groupBy('product_id')->orderBy('name', 'asc')->get(['product_id', 'name', 'code', 'attribute_name', 'category_name', 'sale_price']);
            $product_ids = $product_prices->pluck('product_id')->toArray();

            $liftings = DB::table('view_liftings')->whereIn('store_id', $store_id)->whereNotNull('date')->whereIn('product_id', $product_ids)->orderBy('name', 'asc')->get();
            $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $sales = DB::table('view_sales')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
            $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();

            $data = [
                'product_prices' => $product_prices,
                'store_id' => $store_id,
                'liftings' => $liftings,
                'lifting_returns' => $lifting_returns,
                'sales' => $sales,
                'sales_returns' => $sales_returns,
                'online_sales' => $online_sales,
            ];

            foreach ($data['product_prices'] as $key => $row) {
                $liftings = $data['liftings']->where('product_id', $row->product_id)->sum('qty');
                $lifting_amount = $data['liftings']->where('product_id', $row->product_id)->sum('amount');
                $avarage_lifting_price = $lifting_amount / $liftings;

                $opening_liftings = $data['liftings']->where('product_id', $row->product_id)->where('date', '<', $start_date)->sum('qty');
                $opening_lifting_returns = $data['lifting_returns']->where('product_id', $row->product_id)->where('date', '<', $start_date)->sum('qty');
                $opening_sales = $data['sales']->where('product_id', $row->product_id)->where('date', '<', $start_date)->sum('qty');
                $opening_sales_returns = $data['sales_returns']->where('product_id', $row->product_id)->where('date', '<', $start_date)->sum('qty');
                $opening_online_sales = $data['online_sales']->where('product_id', $row->product_id)->where('date', '<', $start_date)->sum('qty');
                $opening = $opening_liftings + $opening_sales_returns - $opening_lifting_returns - $opening_sales - $opening_online_sales;

                $closing_liftings = $data['liftings']->where('product_id', $row->product_id)->where('date', '<=', $end_date)->sum('qty');
                $closing_lifting_returns = $data['lifting_returns']->where('product_id', $row->product_id)->where('date', '<=', $end_date)->sum('qty');
                $closing_sales = $data['sales']->where('product_id', $row->product_id)->where('date', '<=', $end_date)->sum('qty');
                $closing_sales_returns = $data['sales_returns']->where('product_id', $row->product_id)->where('date', '<=', $end_date)->sum('qty');
                $closing_online_sales = $data['online_sales']->where('product_id', $row->product_id)->where('date', '<=', $end_date)->sum('qty');
                $balance = $closing_liftings + $closing_sales_returns - $closing_lifting_returns - $closing_sales - $closing_online_sales;

                $opening_balance += $opening * $avarage_lifting_price;
                $closing_balance += $balance * $avarage_lifting_price;
            }

            $incomes = AccountTransaction::with('coa')
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa', function ($query) {
                    $query->where('head_type', 'I');
                })
                ->groupBy('coa_setup_id')
                ->select('coa_head_code', 'coa_setup_id', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))
                ->get();

            $expenses = AccountTransaction::with('coa')->select('*', DB::raw('SUM(debit_amount - credit_amount) as amount'))
                ->where('voucher_date', '>=', $start_date)
                ->where('voucher_date', '<=', $end_date)
                ->whereHas('coa', function ($query) {
                    $query->where('head_type', 'E')->where('transaction', 1);
                })
                ->groupBy('coa_setup_id')
                ->get();
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Income Statement Report <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            // return view('admin.reports.income_statement.print', compact('title', 'informations', 'report_title', 'opening_balance', 'closing_balance', 'incomes', 'expenses'));
            $pdf = Pdf::loadView('admin.reports.income_statement.print', compact('title', 'informations', 'report_title', 'opening_balance', 'closing_balance', 'incomes', 'expenses'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('income_statement_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Income Statement';
        $filter_link = Route('admin.income-statement.index');
        $print_buttons = '<button type="button" class="btn btn-sm btn-primary text-uppercase getPdf">Print</button>';
        return view('admin.reports.income_statement.index', compact('title', 'filter_link', 'start_date', 'end_date', 'opening_balance', 'closing_balance', 'incomes', 'expenses', 'print_buttons'));
    }

    public function trialBalance(Request $request)
    {
        $coaLists = array();
        $coaLists1 = array();
        $date_range = explode('to', $request->date_range);
        $start_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[0])) : date('Y-m-01');
        $end_date = !is_null($request->date_range) ? date('Y-m-d', strtotime($date_range[1])) : date('Y-m-t');
        if ($request->has('filter')) {
            $coaLists = TrialBalance::with('coa_setup')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->where('transaction', 1)->where('general', 1)->groupBy('coa_setup_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
            $coaLists1 = TrialBalance::with('parent_head')->where('voucher_date', '>=', $start_date)->where('voucher_date', '<=', $end_date)->where('transaction', 1)->where('general', 0)->groupBy('parent_id')->select('*', DB::raw('SUM(debit_amount) as debit_amount'), DB::raw('SUM(credit_amount) as credit_amount'))->get();
        }

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }
            $report_title = 'Trial Balance <br> <span class="text-sm">' . date('d-m-Y', strtotime($start_date)) . ' To ' . date('d-m-Y', strtotime($end_date)) . '</span>';
            $pdf = Pdf::loadView('admin.reports.trial_balance.print', compact('title', 'informations', 'report_title', 'coaLists', 'coaLists1'));
            return $pdf->stream('trial_balance_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Trial Balance';
        $filter_link = Route('admin.trial-balance.index');
        return view('admin.reports.trial_balance.index', compact('title', 'filter_link', 'start_date', 'end_date', 'coaLists', 'coaLists1'));
    }

    public function balanceSheet(Request $request)
    {
        $closing_stock = 0;
        $query = DB::table('view_liftings');
        $company_id = Auth::user()->company_id;
        if ($company_id) {
            $query->where('company_id', $company_id);
        }
        $store_id = Store::where('status', 1)->get(['id'])->pluck('id')->toArray();
        $product_prices = $query->whereIn('store_id', $store_id)->whereNotNull('date')->groupBy('product_id')->orderBy('name', 'asc')->get(['product_id', 'name', 'code', 'attribute_name', 'category_name', 'sale_price']);
        $product_ids = $product_prices->pluck('product_id')->toArray();

        $liftings = DB::table('view_liftings')->whereIn('store_id', $store_id)->whereNotNull('date')->whereIn('product_id', $product_ids)->orderBy('name', 'asc')->get();
        $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $sales = DB::table('view_sales')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();
        $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->whereIn('product_id', $product_ids)->whereIn('store_id', $store_id)->get();

        $data = [
            'product_prices' => $product_prices,
            'store_id' => $store_id,
            'liftings' => $liftings,
            'lifting_returns' => $lifting_returns,
            'sales' => $sales,
            'sales_returns' => $sales_returns,
            'online_sales' => $online_sales,
        ];

        foreach ($data['product_prices'] as $key => $row) {
            $liftings = $data['liftings']->where('product_id', $row->product_id)->sum('qty');
            $lifting_amount = $data['liftings']->where('product_id', $row->product_id)->sum('amount');
            $avarage_lifting_price = $lifting_amount / $liftings;

            $closing_liftings = $data['liftings']->where('product_id', $row->product_id)->sum('qty');
            $closing_lifting_returns = $data['lifting_returns']->where('product_id', $row->product_id)->sum('qty');
            $closing_sales = $data['sales']->where('product_id', $row->product_id)->sum('qty');
            $closing_sales_returns = $data['sales_returns']->where('product_id', $row->product_id)->sum('qty');
            $closing_online_sales = $data['online_sales']->where('product_id', $row->product_id)->sum('qty');
            $balance = $closing_liftings + $closing_sales_returns - $closing_lifting_returns - $closing_sales - $closing_online_sales;
            $closing_stock += $balance * $avarage_lifting_price;
        }
        $assets = $this->assets('Assets');
        $liabilities = $this->assets('Liabilities');
        $currentPFL = $this->profitLoss($closing_stock);
        $data = [
            'assets' => $assets,
            'liabilities' => $liabilities,
            'currentPFL' => $currentPFL,
            'closing_stock' => $closing_stock,
        ];

        if (!is_null($request->print)) {
            if (Auth::user()->company_id) {
                $company = Company::find(Auth::user()->company_id);
                $title = $company->name;
                $informations = $company->address . '</br>' . $company->phone . ', ' . $company->email . ', ' . $company->website;
            } else {
                $title = 'Company Name Goes Here.';
                $informations = 'Company address will goes here </br> Mobile: 0967XXXXXX, Email: youremail@gmail.com, www.website.com';
            }

            $report_title = 'Balance Sheet';
            // return view('admin.reports.balance_sheet.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf = Pdf::loadView('admin.reports.balance_sheet.print', compact('title', 'informations', 'report_title', 'data'));
            $pdf->setPaper('A4', 'landscape');
            return $pdf->stream('balance_sheet_' . date('d_m_Y_h_i_s') . '.pdf');
        }

        $title = 'Balance Sheet';
        $filter_link = Route('admin.balance-sheet.index');
        $coas = CoaSetup::where('general', 1)->orderBy('head_name', 'asc')->get();
        return view('admin.reports.balance_sheet.index', compact('title', 'filter_link', 'coas', 'data'));
    }

    public function getAmount($headCode)
    {
        $balance = 0;
        $headReports = TrialBalance::select('*')
            ->where('coa_head_code', 'LIKE', $headCode . '%')
            ->get();

        foreach ($headReports as $headReport) {
            if ($headReport->head_type == 'I' || $headReport->head_type == 'L') {
                $balance += $headReport->credit_amount - $headReport->debit_amount;
            } else {
                $balance += $headReport->debit_amount - $headReport->credit_amount;
            }
        }
        return $balance;
    }

    public function assets($parent_head)
    {
        $parents = CoaSetup::with('parent')->whereHas('parent', function ($query) use ($parent_head) {
            $query->where('head_name', $parent_head);
        })->orderBy('head_name', 'asc')->get();

        $info = [];
        foreach ($parents as $parent) {
            $childs = CoaSetup::select('head_name', 'head_code')
                ->where('parent_id', $parent->id)
                ->get();
            $childInfo = [];
            foreach ($childs as $child) {
                $childInfo[] = [
                    'headName' => $parent->head_name,
                    'name' => $child->head_name,
                    'amount' => $this->getAmount($child->head_code)
                ];
            }

            $info[] = [
                'head' => $parent->head_name,
                'childs' => $childInfo
            ];
        }
        return $info;
    }

    private function profitLoss($closingStockValue)
    {
        $totalIncome = trialBalance::where('head_type', 'I')->sum(DB::raw('credit_amount - debit_amount'));
        $totalExpanse = trialBalance::where('head_type', 'E')->sum(DB::raw('debit_amount - credit_amount'));
        $netIncome = $totalIncome + $closingStockValue;
        return $profitLoss = $netIncome - $totalExpanse;
    }
}
