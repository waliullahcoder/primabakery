<?php

use App\Http\Controllers\Admin\AboutController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminMenuActionController;
use App\Http\Controllers\Admin\AdminMenuController;
use App\Http\Controllers\Admin\AdminSettingController;
use App\Http\Controllers\Admin\AreaController;
use App\Http\Controllers\Admin\AttributeController;
use App\Http\Controllers\Admin\AttributeValueController;
use App\Http\Controllers\Admin\AutomationApproveController;
use App\Http\Controllers\Admin\AutomationRejectController;
use App\Http\Controllers\Admin\BranchController;
use App\Http\Controllers\Admin\BulkCollectionController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ClientCategoryController;
use App\Http\Controllers\Admin\CompanyController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\LocationController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\PageController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\RegionController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\StaffController;
use App\Http\Controllers\Admin\StoreController;
use App\Http\Controllers\Admin\TerritoryController;
use App\Http\Controllers\Admin\ChainClientController;
use App\Http\Controllers\Admin\ClientController;
use App\Http\Controllers\Admin\ClientMessageController;
use App\Http\Controllers\Admin\ClientPriceController;
use App\Http\Controllers\Admin\CoaSetupController;
use App\Http\Controllers\Admin\CollectionController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\CreditVoucherEntryController;
use App\Http\Controllers\Admin\DebitVoucherEntryController;
use App\Http\Controllers\Admin\DeliveryChargeController;
use App\Http\Controllers\Admin\DeliveryController;
use App\Http\Controllers\Admin\DetailsCardController;
use App\Http\Controllers\Admin\GroupController;
use App\Http\Controllers\Admin\GroupSaleTargetController;
use App\Http\Controllers\Admin\JournalVoucherEntryController;
use App\Http\Controllers\Admin\LiftingController;
use App\Http\Controllers\Admin\LiftingReturnController;
use App\Http\Controllers\Admin\OfflineOrderController;
use App\Http\Controllers\Admin\OnlineOrderDeliveryController;
use App\Http\Controllers\Admin\OrderDashboardController;
use App\Http\Controllers\Admin\ReportController;
use App\Http\Controllers\Admin\SalesController;
use App\Http\Controllers\Admin\SalesReturnApproveController;
use App\Http\Controllers\Admin\SalesReturnController;
use App\Http\Controllers\Admin\ShowcaseItemController;
use App\Http\Controllers\Admin\SiteItemsController;
use App\Http\Controllers\Admin\SocialWorkController;
use App\Http\Controllers\Admin\SpecialFoodItemsController;
use App\Http\Controllers\Admin\SubscriptionController;
use App\Http\Controllers\Admin\TestimonialController;
use App\Http\Controllers\Admin\TransferController;
use App\Http\Controllers\Admin\TransferReceiveController;
use App\Http\Controllers\Admin\VehicleController;
use App\Http\Controllers\Admin\VendorController;
use App\Http\Controllers\Admin\VendorPaymentController;
use App\Http\Controllers\Admin\VoucherApproveController;
use App\Http\Controllers\Admin\VoucherRejectController;

Route::group(['as' => 'admin.', 'prefix' => 'admin'], function () {
    Route::get('/', [AdminController::class, 'index'])->name('login.index');
    Route::post('/login', [AdminController::class, 'login'])->name('login');
    Route::post('/sidebar', [AdminController::class, 'sidebar'])->name('sidebar');
});

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission']], function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');
    Route::get('/profile', [AdminController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AdminController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AdminController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AdminController::class, 'update'])->name('profile.update');
    Route::get('/logout', [AdminController::class, 'logout'])->name('logout');

    // User Management
    Route::resource('/user', UserController::class);
    Route::get('/user/{id}/password', [UserController::class, 'changePassword'])->name('user.password');
    Route::put('/user/password/{id}', [UserController::class, 'passwordUpdate'])->name('user.password-update');

    // Admin Menu Management
    Route::resource('/admin-menu', AdminMenuController::class);

    // Admin Menu Actions Management
    Route::get('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'index'])->name('admin-menuAction.index');
    Route::get('/admin-menu-actions/{id}/create', [AdminMenuActionController::class, 'create'])->name('admin-menuAction.create');
    Route::post('/admin-menu-actions/{id}/store', [AdminMenuActionController::class, 'store'])->name('admin-menuAction.store');
    Route::get('/admin-menu-actions/{id}/edit', [AdminMenuActionController::class, 'edit'])->name('admin-menuAction.edit');
    Route::put('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'update'])->name('admin-menuAction.update');
    Route::delete('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'destroy'])->name('admin-menuAction.destroy');

    // Role Management
    Route::resource('/role', RoleController::class);

    // Permission Management
    Route::get('/permission/{id}', [RoleController::class, 'rolePermissionEdit'])->name('rolePermission.edit');
    Route::put('/permission/permissions-update/{id}', [RoleController::class, 'rolePermissionUpdate'])->name('rolePermission.update');

    // Admin Settings Management
    Route::resource('/admin-settings', AdminSettingController::class);

    // Company Setup Management
    Route::resource('/company', CompanyController::class);

    // Vehicle Setup Management
    Route::resource('/vehicle', VehicleController::class);

    // Branch Setup Management
    Route::resource('/branch', BranchController::class);

    // Store Setup Management
    Route::resource('/store', StoreController::class);

    // Staff Setup Management
    Route::resource('/staff', StaffController::class);

    // Region Setup Management
    Route::resource('/region', RegionController::class);

    // Area Setup Management
    Route::resource('/area', AreaController::class);

    // Territory Setup Management
    Route::resource('/territory', TerritoryController::class);

    // Client Category Setup Management
    Route::resource('/client-category', ClientCategoryController::class);

    // Chain Client Setup Management
    Route::resource('/chain-client', ChainClientController::class);

    // Vendor Setup Management
    Route::resource('/vendor', VendorController::class);

    // Vendor Payment Management
    Route::resource('/vendor-payment', VendorPaymentController::class);

    // Client Setup Management
    Route::resource('/client', ClientController::class);

    // Sales Group Setup Management
    Route::resource('/group', GroupController::class);

    // Group Sales Target Setup Management
    Route::resource('/group-target', GroupSaleTargetController::class);

    // Client Price Setup Management
    Route::resource('/client-price', ClientPriceController::class);

    // Lifting Product Management
    Route::resource('/lifting', LiftingController::class);
    Route::get('/lifting-document/{id}', [LiftingController::class, 'showDocument'])->name('lifting-document.show');

    // Lifting Product Return Management
    Route::resource('/lifting-return', LiftingReturnController::class);

    // Offline Order Management
    Route::resource('/offline-order', OfflineOrderController::class);

    // Sales Management
    Route::resource('/sales', SalesController::class);
    Route::get('/sales-invoice/{id}', [SalesController::class, 'invoice'])->name('sales.invoice');
    Route::get('/sales-vat/{id}', [SalesController::class, 'vat'])->name('sales.vat');
    Route::get('/search-edit', [SalesController::class, 'searchEdit'])->name('sales.search-edit');

    // Sales Management
    Route::resource('/sales-return', SalesReturnController::class);

    // Return Receive Management
    Route::resource('/return-approve', SalesReturnApproveController::class);

    // Collection Management
    Route::resource('/collection', CollectionController::class);

    // Bulk Collection Management
    Route::resource('/bulk-collection', BulkCollectionController::class);

    // Delivery Management
    Route::resource('/delivery', DeliveryController::class);
    Route::get('/delivery-gatepass/{id}', [DeliveryController::class, 'gatePass'])->name('delivery.gatepass');

    // Transfer Product Management
    Route::resource('/transfer', TransferController::class);

    // Transfer Product Receive Management
    Route::resource('/transfer-receive', TransferReceiveController::class);

    // Category Management
    Route::resource('/category', CategoryController::class);

    // Attribute Management
    Route::resource('/attribute', AttributeController::class);

    // Attribute Value Management
    Route::get('/attribute-values/{id}', [AttributeValueController::class, 'index'])->name('attribute-value.index');
    Route::post('/attribute-values/{id}', [AttributeValueController::class, 'store'])->name('attribute-value.store');
    Route::get('/attribute-values/{id}/edit', [AttributeValueController::class, 'edit'])->name('attribute-value.edit');
    Route::put('/attribute-values/{id}/update', [AttributeValueController::class, 'update'])->name('attribute-value.update');
    Route::delete('/attribute-values/{id}/delete', [AttributeValueController::class, 'destroy'])->name('attribute-value.destroy');

    // Product Management
    Route::resource('/product', ProductController::class);

    // Location Management
    Route::resource('/location', LocationController::class);

    // Customers Management
    Route::resource('/customers', CustomerController::class);

    // Order Management
    Route::resource('/online-order', OrderController::class);
    Route::get('/export-process-order', [OrderController::class, 'exportProcess'])->name('process-order.export');

    // Order Management
    Route::get('/cancel-orders', [OrderController::class, 'CancelOrder'])->name('cancel-order.index');
    Route::get('/cancel-order/{id}/approve', [OrderController::class, 'approveCancelOrder'])->name('cancel-order.approve');

    // Delivery Charge Setup
    Route::resource('/delivery-charge', DeliveryChargeController::class);

    // Online Order Delivery Management
    Route::resource('/online-order-delivery', OnlineOrderDeliveryController::class);
    Route::get('/online-order-delivery-gatepass/{id}', [OnlineOrderDeliveryController::class, 'gatePass'])->name('online-order-delivery.gatepass');

    // Online Order Dashboard Management
    Route::resource('/order-dashboard', OrderDashboardController::class);

    // Accounting Management
    Route::resource('/coa-setup', CoaSetupController::class);

    // Accounts Transaction Management
    Route::resource('/debit-voucher-entry', DebitVoucherEntryController::class);
    Route::get('/debit-voucher-entry/{id}/print', [DebitVoucherEntryController::class, 'print'])->name('debit-voucher-entry.print');
    Route::resource('/credit-voucher-entry', CreditVoucherEntryController::class);
    Route::get('/credit-voucher-entry/{id}/print', [creditVoucherEntryController::class, 'print'])->name('credit-voucher-entry.print');
    Route::resource('/journal-voucher-entry', JournalVoucherEntryController::class);
    Route::get('/journal-voucher-entry/{id}/print', [journalVoucherEntryController::class, 'print'])->name('journal-voucher-entry.print');
    Route::resource('/voucher-approve', VoucherApproveController::class);
    Route::resource('/voucher-reject', VoucherRejectController::class);
    Route::resource('/automation-approve', AutomationApproveController::class);
    Route::resource('/automation-reject', AutomationRejectController::class);
});

// ================== Reports Management ================== //
Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission']], function () {
    Route::get('/product-list', [ReportController::class, 'productList'])->name('product-list.index');
    Route::get('/lifting-history', [ReportController::class, 'liftingHistroy'])->name('lifting-history.index');
    Route::get('/lifting-return-history', [ReportController::class, 'liftingReturnHistory'])->name('lifting-return-history.index');
    Route::get('/vendor-payment-history', [ReportController::class, 'vendorPayment'])->name('vendor-payment-history.index');
    Route::get('/vendor-statement', [ReportController::class, 'vendorStatement'])->name('vendor-statement.index');
    Route::get('/client-list', [ReportController::class, 'clientList'])->name('client-list.index');
    Route::get('/sales-history', [ReportController::class, 'salesHistroy'])->name('sales-history.index');
    Route::get('/collection-history', [ReportController::class, 'collectionHistory'])->name('collection-history.index');
    Route::get('/return-history', [ReportController::class, 'returnHistory'])->name('return-history.index');
    Route::get('/client-statement', [ReportController::class, 'clientStatement'])->name('client-statement.index');
    Route::get('/delivery-statement', [ReportController::class, 'deliveryStatement'])->name('delivery-statement.index');
    Route::get('/transfer-log', [ReportController::class, 'transferLog'])->name('transfer-log.index');
    Route::get('/stock-status', [ReportController::class, 'stockStatus'])->name('stock-status.index');
    Route::get('/stock-valuation', [ReportController::class, 'stockValuation'])->name('stock-valuation.index');
    Route::get('/sales-contribution', [ReportController::class, 'salesContribution'])->name('sales-contribution.index');
    Route::get('/sales-realization', [ReportController::class, 'salesRealization'])->name('sales-realization.index');
    Route::get('/lifting-realization', [ReportController::class, 'liftingRealization'])->name('lifting-realization.index');
    Route::get('/sales-ageing', [ReportController::class, 'salesAgeing'])->name('sales-ageing.index');
    Route::get('/client-outstanding', [ReportController::class, 'clientOutstanding'])->name('client-outstanding.index');
    Route::get('/sales-target-achivement', [ReportController::class, 'SalesTargetAchievement'])->name('sales-target-achivement.index');
    Route::get('/product-wise-profit', [ReportController::class, 'productWiseProfit'])->name('product-wise-profit.index');
    Route::get('/access-log', [ReportController::class, 'accessLog'])->name('access-log.index');
    Route::get('/product-statement', [ReportController::class, 'productStatement'])->name('product-statement.index');
    Route::get('/salesman-flowchart', [ReportController::class, 'salesManFlowChart'])->name('salesman-flowchart.index');
    Route::get('/client-sales-flow', [ReportController::class, 'clientSalesFlow'])->name('client-sales-flow.index');
    Route::get('/online-sales-history', [ReportController::class, 'onlineSalesHistory'])->name('online-sales-history.index');
    Route::get('/coa-list', [ReportController::class, 'coaList'])->name('coa-list.index');
    Route::get('/voucher-list', [ReportController::class, 'voucherList'])->name('voucher-list.index');
    Route::get('/cash-book', [ReportController::class, 'cashBook'])->name('cash-book.index');
    Route::get('/bank-book', [ReportController::class, 'bankBook'])->name('bank-book.index');
    Route::get('/transaction-ledger', [ReportController::class, 'transactionLedger'])->name('transaction-ledger.index');
    Route::get('/cash-flow-statement', [ReportController::class, 'cashFlowStatement'])->name('cash-flow-statement.index');
    Route::get('/general-ledger', [ReportController::class, 'generalLedger'])->name('general-ledger.index');
    Route::get('/income-statement', [ReportController::class, 'incomeStatement'])->name('income-statement.index');
    Route::get('/trial-balance', [ReportController::class, 'trialBalance'])->name('trial-balance.index');
    Route::get('/balance-sheet', [ReportController::class, 'balanceSheet'])->name('balance-sheet.index');
});
// ================== Reports Management ================== //

// Frontend CMS Management
Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission']], function () {

    // Settings Management
    Route::resource('/settings', SettingController::class);

    // Page Management
    Route::resource('/page', PageController::class);

    // Home Page Slider management
    Route::resource('/slider', SliderController::class);

    // Site Items Management
    Route::resource('/site-item', SiteItemsController::class);

    // Special Food Items Management
    Route::resource('/special-food-item', SpecialFoodItemsController::class);

    // Details Card Items Management
    Route::resource('/details-card', DetailsCardController::class);

    // Details Showcase Items Management
    Route::resource('/showcase-item', ShowcaseItemController::class);

    // Site Contact Details Management
    Route::resource('/testimonial', TestimonialController::class);

    // Site About Us Details Management
    Route::resource('/about', AboutController::class);

    // Site About Us Details Management
    Route::resource('/social-working', SocialWorkController::class);

    // Site Contact Details Management
    Route::resource('/contact', ContactController::class);

    // Subscription Management
    Route::get('/subscription', [SubscriptionController::class, 'index'])->name('subscription.index');

    // Client Message Management
    Route::get('/client-message', [ClientMessageController::class, 'index'])->name('client-message.index');
    Route::get('/client-message/{id}', [ClientMessageController::class, 'show'])->name('client-message.show');

    // Online Requst Management
    Route::get('/client-request', [ClientMessageController::class, 'onlineRequest'])->name('client-request.index');
    Route::get('/client-request/{id}', [ClientMessageController::class, 'showMessage'])->name('client-request.show');
});
