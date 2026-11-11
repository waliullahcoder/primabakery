<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Page;
use App\Models\Slider;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\About;
use App\Models\Contact;
use App\Models\DetailsCard;
use App\Models\ShowcaseItem;
use App\Models\SocialWork;
use App\Models\SpecialFoodItems;
use App\Models\StaticSiteItem;
use App\Models\Store;
use Illuminate\Support\Facades\DB;

class FrontpageController extends Controller
{
    public function home()
    {
        $site_items = StaticSiteItem::latest()->first();
        $sliders = Slider::where('status', 1)->latest('updated_at')->get();
        $showcase_items = ShowcaseItem::where('status', 1)->latest('serial')->get();
        $card_details = DetailsCard::where('status', 1)->latest('serial')->get();
        $special_items = SpecialFoodItems::where('status', 1)->latest('serial')->get();
        $products = Product::where('status', 1)->where('show_on_website', 1)->inRandomOrder()->get();
        $categories = Category::with(['products'])->root()->where('status', 1)->where('show_frontend', 1)->orderBy('name', 'asc')->get();
        return view('frontend.home', compact('sliders', 'site_items', 'showcase_items', 'card_details', 'special_items', 'products', 'categories'));
    }

    public function Collections()
    {
        $categories = Category::root()->where('status', 1)->where('show_frontend', 1)->orderBy('name', 'asc')->get();
        return view('frontend.collections', compact('categories'));
    }

    public function AboutUs()
    {
        $site_items = StaticSiteItem::latest()->first();
        $about = About::latest('updated_at')->first();
        $social_works = SocialWork::where('status', true)->latest('serial')->get();

        return view('frontend.about', compact('about', 'site_items', 'social_works'));
    }

    public function ContactUs($slug = NULL)
    {
        if (!is_null($slug)) {
            $product_id = Product::where('slug', $slug)->first()->id;
        } else {
            $product_id = NULL;
        }
        $product = Product::where('slug', $slug)->first();
        $contact = Contact::latest('updated_at')->first();
        return view('frontend.contact', compact('contact', 'product_id'));
    }

    public function products(Request $request, $slug = NULL)
    {
        if ($request->ajax() && $request->show_more == 1) {
            $query = Product::where('status', 1)->where('show_on_website', 1)->where('category_id', $request->category_id);
            $sort = explode('-', $request->sort);
            if ($request->sort != 'price-asc' && $request->sort != 'price-desc') {
                $query->orderBy($sort[0], $sort[1]);
            } elseif ($request->sort == 'price-asc' || $request->sort == 'price-desc') {
                $query->leftJoin('product_prices', 'product_prices.product_id', 'products.id')
                    ->orderBy('product_prices.online_price', $sort[1]);
            }
            $count = $query->count();
            $total_show = $request->showed + $request->show;
            $query->limit($total_show);
            $products = $query->get();
            $showed = count($products);
            $html = '';
            foreach ($products as $key => $product) {
                $html .= '<div
                    class="product-showcase card card-' . ($key + 1) . ' border border-solid border-slate-300 hover:shadow-lg rounded-md hover:scale-125 relative bg-white hover:z-10 h-full">
                    <div class="before:content-[] before:pt-[100%] before:block relative image-area">
                        <a href="' . Route('frontend.single-product', $product->slug) . '">
                            <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                src="' . (file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png')) . '" alt="product">
                        </a>
                    </div>
                    <p class="p-4 font-normal leading-5 text-slate-600 text-center overflow-hidden">
                        <a href="' . Route('frontend.single-product', $product->slug) . '">' . $product->name . '</a>
                    </p>
                </div>';
            }
            return response()->json(['status' => 'success', 'html' => $html, 'count' => $count, 'showed' => $showed]);
        }

        if ($request->ajax()) {
            $query = Product::where('status', 1)->where('show_on_website', 1)->where('category_id', $request->category_id);
            $sort = explode('-', $request->sort);
            if ($request->sort != 'price-asc' && $request->sort != 'price-desc') {
                $query->orderBy($sort[0], $sort[1]);
            } elseif ($request->sort == 'price-asc' || $request->sort == 'price-desc') {
                $query->leftJoin('product_prices', 'product_prices.product_id', 'products.id')
                    ->orderBy('product_prices.online_price', $sort[1]);
            }
            $count = $query->count();
            if ($request->show != 'all') {
                $query->limit($request->show);
            }
            $products = $query->get();
            $showed = count($products);
            $html = '';
            foreach ($products as $key => $product) {
                $html .= '<div
                    class="product-showcase card card-' . ($key + 1) . ' border border-solid border-slate-300 hover:shadow-lg rounded-md hover:scale-125 relative bg-white hover:z-10 h-full">
                    <div class="before:content-[] before:pt-[100%] before:block relative image-area">
                        <a href="' . Route('frontend.single-product', $product->slug) . '">
                            <img class="w-full rounded-md absolute inset-0 h-full object-cover"
                                src="' . (file_exists($product->thumbnail) ? asset($product->thumbnail) : asset('frontend/assets/images/default/no_image2.png')) . '" alt="product">
                        </a>
                    </div>
                    <p class="p-4 font-normal leading-5 text-slate-600 text-center overflow-hidden">
                        <a href="' . Route('frontend.single-product', $product->slug) . '">' . $product->name . '</a>
                    </p>
                </div>';
            }
            return response()->json(['status' => 'success', 'html' => $html, 'count' => $count, 'showed' => $showed]);
        }

        if (!is_null($slug)) {
            $category = Category::where('slug', $slug)->first();
            $products = Product::where('status', 1)->where('show_on_website', 1)->where('category_id', $category->id)->orderBy('name', 'asc')->limit(16)->get();
            $count = Product::where('status', 1)->where('show_on_website', 1)->where('category_id', $category->id)->orderBy('name', 'asc')->count();
        } else {
            $category = NULL;
            $products = Product::where('status', 1)->where('show_on_website', 1)->orderBy('name', 'asc')->limit(16)->get();
            $count = Product::where('status', 1)->where('show_on_website', 1)->orderBy('name', 'asc')->count();
        }
        $categories = Category::root()->with(['children'])->where('status', 1)->orderBy('name')->get();
        return view('frontend.products', compact('products', 'category', 'categories', 'count'));
    }

    public function search(Request $request)
    {
        $search_string = $request->search;
        $products = Product::where('status', 1)->where('show_on_website', 1)->where('name', 'LIKE', '%' . $search_string . '%')->orWhere('slug', 'LIKE', '%' . $search_string . '%')->latest('id')->paginate(9);
        return view('frontend.search_products', compact('products', 'search_string'));
    }

    public static function stock($product_id)
    {
        $liftings = DB::table('view_liftings')->whereNotNull('date')->where('product_id', $product_id)->sum('qty');
        $lifting_returns = DB::table('view_lifting_returns')->whereNotNull('date')->where('product_id', $product_id)->sum('qty');
        $client_sales = DB::table('view_sales')->whereNotNull('date')->where('product_id', $product_id)->sum('qty');
        $sales_returns = DB::table('view_sales_returns')->whereNotNull('date')->where('product_id', $product_id)->sum('qty');
        $online_sales = DB::table('view_online_sales')->whereNotNull('store_id')->where('product_id', $product_id)->sum('qty');
        return $liftings + $sales_returns - $lifting_returns - $client_sales - $online_sales;
    }
    
    public function singleProduct($slug)
    {
        $product = Product::with(['category', 'price'])->where('slug', $slug)->where('status', 1)->first();
        $related_products = Product::with(['price'])->whereNotIn('id', [$product->id])->where(function ($query) use ($product) {
            $query->where('vendor_id', $product->vendor_id)
                ->orWhere('category_id', $product->category_id);
        })->where('status', 1)->where('show_on_website', 1)->inRandomOrder()->limit(16)->get();

        $store_id = Store::where('status', 1)->get(['id'])->pluck('id')->toArray();
        $stock_qty = $this->stock($product->id);

        // Share Product
        $shareComponent = \Share::page(Route('frontend.single-product', $product->slug), $product->name)
            ->facebook()
            ->twitter()
            ->linkedin()
            ->telegram()
            ->whatsapp();

        return view('frontend.single_product', compact('product', 'stock_qty', 'related_products', 'shareComponent'));
    }

    public function page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        return view('frontend.page', compact('page'));
    }
}
