<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function addToCart(Request $request)
    {
        $cart = session()->get('cart');
        if (!$cart) {
            $data = $this->sessionData($request->product_id);
            $cart = [
                $request->product_id => $data
            ];
            session()->put('cart', $cart);

            $product = Product::findOrFail($request->product_id);
            $data['category_name'] = $product->category->name;
            $data['product_url'] = Route('frontend.single-product', $product->slug);

            if ($request->ajax()) {
                return response()->json(['status' => 'success', 'data' => $data, 'total_cart_items' => 1, 'total_cart_price' => number_format($data['price'] * $data['qty'], 2)]);
            } else {
                return redirect()->route('customer.checkout')->withSuccessMessage('Product Added Successfully!');
            }
        }

        if (isset($cart[$request->product_id])) {
            $cart[$request->product_id]['qty'] += $request->quantity;
            session()->put('cart', $cart);
            $total_cart_price = 0;
            foreach ($cart as $item) {
                $total_cart_price += $item['price'] * $item['qty'];
            }
            if ($request->ajax()) {
                return response()->json(['status' => 'quantity_updated', 'qty' => $cart[$request->product_id]['qty'], 'product_id' => $request->product_id, 'total_cart_price' => number_format($total_cart_price, 2)]);
            } else {
                return redirect()->route('customer.checkout')->withSuccessMessage('Product Added Successfully!');
            }
        }

        $data = $this->sessionData($request->product_id);
        $cart[$request->product_id] = $data;

        $product = Product::findOrFail($request->product_id);
        $data['category_name'] = $product->category->name;
        $data['product_url'] = Route('frontend.single-product', $product->slug);

        session()->put('cart', $cart);
        $cart = session()->get('cart');
        $total_items = count($cart);
        $total_cart_price = 0;
        foreach ($cart as $item) {
            $total_cart_price += $item['price'] * $item['qty'];
        }
        if ($request->ajax()) {
            return response()->json(['status' => 'success', 'data' => $data, 'total_cart_items' => $total_items, 'total_cart_price' => number_format($total_cart_price, 2)]);
        } else {
            return redirect()->route('customer.checkout')->withSuccessMessage('Product Added Successfully!');
        }
    }

    public function updateCart(Request $request)
    {
        $cart = session()->get('cart');
        if (isset($cart[$request->product_id])) {
            $cart[$request->product_id]['qty'] = $request->quantity;
            session()->put('cart', $cart);
            $total_cart_price = 0;
            foreach ($cart as $item) {
                $total_cart_price += $item['price'] * $item['qty'];
            }
            if ($request->ajax()) {
                return response()->json(['status' => 'success', 'qty' => $cart[$request->product_id]['qty'], 'product_id' => $request->product_id, 'total_cart_price' => number_format($total_cart_price, 2)]);
            }
        }
    }

    protected function sessionData($product_id)
    {
        $product = Product::findOrFail($product_id);
        return [
            'product_type' => $product->product_type,
            'product_id' => $product_id,
            'name' => $product->name,
            'price' => $product->price->online_price,
            'slug' => $product->slug,
            'category_slug' => $product->category->slug,
            'image' => $product->thumbnail,
            'qty' => request('quantity'),
        ];
    }

    public function cart()
    {
        return view('customer.cart');
    }

    public function removeFromCart(Request $request)
    {
        $cart = session()->get('cart');
        if (isset($cart[$request->id])) {
            unset($cart[$request->id]);
            session()->put('cart', $cart);
        }
        $cart = session()->get('cart');
        $total_items = count($cart);
        $total_cart_price = 0;
        foreach ($cart as $item) {
            $total_cart_price += $item['price'] * $item['qty'];
        }
        return response()->json(['status' => 'success', 'total_cart_items' => $total_items, 'total_cart_price' => $total_cart_price]);
    }
}
