<?php

namespace App\Providers;

use App\Models\Setting;
use App\Models\Category;
use App\Models\AdminSetting;
use App\Models\Page;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        view()->composer('*', function ($view) {
            $admin_setting = NULL;
            if (Schema::hasTable('admin_settings')) {
                $admin_setting = Cache::remember('admin_settings', 3600, function () {
                    return AdminSetting::latest('id')->first();
                });
            }
            $setting = NULL;
            if (Schema::hasTable('settings')) {
                $setting = Cache::remember('setting', 3600, function () {
                    return Setting::latest('id')->first();
                });
            }
            $pages = NULL;
            if (Schema::hasTable('pages')) {
                $pages = Cache::remember('pages', 3600, function () {
                    return Page::where('status', 1)->get();
                });
            }
            $categories = NULL;
            if (Schema::hasTable('categories')) {
                $categories = Cache::remember('categories', 3600, function () {
                    return Category::root()->with(['children'])->where('status', 1)->orderBy('name')->get();
                });
            }
            $cart = session()->get('cart');
            $view->with(['admin_setting' => $admin_setting, 'setting' => $setting, 'cart' => $cart, 'pages' => $pages, 'categories' => $categories]);
        });
    }
}
