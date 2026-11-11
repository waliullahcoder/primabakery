<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Mail\RegisterMail;
use App\Models\Location;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\Product;
use App\Models\ShippingAddress;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    public function checkout()
    {
        if (request()->ajax()) {
            $locations = Location::where('parent_id', request('id'))->orderBy('name')->get();
            return response()->json(['status' => 'success', 'locations' => $locations]);
        }

        $divisions = Location::whereNull('parent_id')->orderBy('name')->get();
        if (Auth::check()) {
            $shipping_address = ShippingAddress::where('user_id', Auth::user()->id)->first();
            if (!is_null($shipping_address)) {
                $selected_district = Location::find($shipping_address->district_id);
                $selected_upozila = Location::find($shipping_address->upozila_id);
            } else {
                $shipping_address = NULL;
                $selected_district = NULL;
                $selected_upozila = NULL;
            }
        } else {
            $shipping_address = NULL;
            $selected_district = NULL;
            $selected_upozila = NULL;
        }
        return view('customer.checkout', compact('divisions', 'shipping_address', 'selected_district', 'selected_upozila'));
    }

    public function invoice()
    {
        $first = date('Y-m-01');
        $last = new Carbon('last day of this month');
        $order = Order::withTrashed()->select(['invoice'])->where('created_at', '>=', $first)->where('created_at', '<=', $last)->where('order_type', 'offline')->latest('id')->first();
        if ($order) {
            $trim = str_replace("ST", '', $order->invoice);
            $orderPrefix = (int)$trim + 1;
            $invoice = "ST" . $orderPrefix;
        } else {
            $invoice = "ST" . date('Y') . date('m') . '000001';
        }
        return $invoice;
    }

    public function checkoutStore(Request $request)
    {
        $this->validate($request, [
            'address_type' => 'required',
            'payment_method' => 'required',
            'name' => 'required',
            'phone' => 'required',
            'division' => 'required',
            'district' => 'required',
            'upozila' => 'required',
            'street' => 'required',
        ]);

        $cart = session()->get('cart');
        if (!is_null($cart) && count($cart) > 0) {

            $total_cart_price = 0;
            foreach ($cart as $key => $item) {
                $total_cart_price += $item['price'] * $item['qty'];
            }

            DB::transaction(function () use ($request, $cart, $total_cart_price) {
                if (!Auth::user()) {
                    $check_user = User::query();
                    $check_user->where(function ($query) use ($request) {
                        $query->where('phone', $request->phone);
                        if (!is_null($request->email)) {
                            $query->orWhere('email', $request->email);
                        }
                    });
                    $check_user = $check_user->first();
                    if (!is_null($check_user)) {
                        Auth::login($check_user);
                        $user = Auth::user();
                        // return redirect()->back()->withErrors('User Exists Please Login First!');
                    } else {
                        $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
                        $pass = array(); //remember to declare $pass as an array
                        $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
                        for ($i = 0; $i < 8; $i++) {
                            $n = rand(0, $alphaLength);
                            $pass[] = $alphabet[$n];
                        }
                        $password = implode($pass);

                        $otp = rand(11111, 99999);
                        $user = new User();
                        $user->name = $request->name;
                        $user->email  = $request->email;
                        $three_ch = substr($request->input('phone'), 0, 3);
                        $two_ch = substr($request->input('phone'), 0, 2);
                        if ($three_ch == '+88') {
                            $user->phone = substr($request->input('phone'), 3);
                        } elseif ($two_ch == '+8' || $two_ch == '88') {
                            $user->phone = substr($request->input('phone'), 2);;
                        } else {
                            $user->phone = $request->phone;
                        }
                        // $user->otp = $otp;
                        // $user->phone_verified_at = Carbon::now();
                        $user->password = Hash::make($password);
                        $user->status = 1;
                        $user->save();

                        Auth::login($user);
                        // if (@$user) {
                        //     $login_link = Route('customer.login');
                        //     $mailData = [
                        //         'name' => $request->name,
                        //         'phone' => $request->phone,
                        //         'email' => $request->email,
                        //         'password' => $password,
                        //         'login_link' => $login_link,
                        //     ];
                        //     Mail::to($request->email)->send(new RegisterMail($mailData));
                        // }
                    }
                } else {
                    $user = Auth::user();
                }

                $upozila = Location::where('id', $request->upozila)->first()->name;
                $district = Location::where('id', $request->district)->first()->name;
                $division = Location::where('id', $request->division)->first()->name;
                $address = $request->street . ', ' . $upozila . ', ' . $district . ', ' . $division;

                if (is_null($request->shipping_address_id)) {
                    $shipping_address = ShippingAddress::where('user_id', $user->id)->first();
                    if (is_null($shipping_address)) {
                        $shipping_address = ShippingAddress::create([
                            'user_id' => $user->id,
                            'address_type' => $request->address_type,
                            'name' => $request->name,
                            'email' => $request->email,
                            'phone' => $request->phone,
                            'street' => $request->street,
                            'address' => $address,
                            'division_id' => $request->division,
                            'district_id' => $request->district,
                            'upozila_id' => $request->upozila,
                        ]);
                    }
                } else {
                    $shipping_address = ShippingAddress::findOrFail($request->shipping_address_id);
                    $shipping_address->update([
                        'address_type' => $request->address_type,
                        'name' => $request->name,
                        'email' => $request->email,
                        'phone' => $request->phone,
                        'street' => $request->street,
                        'address' => $address,
                        'division_id' => $request->division,
                        'district_id' => $request->district,
                        'upozila_id' => $request->upozila,
                    ]);
                }

                $order = Order::create([
                    'company_id' => 1,
                    'order_id' => mt_rand(111111, 999999),
                    'invoice' => $this->invoice(),
                    'customer_id' => $user->id,
                    'user_name' => $request->name,
                    'user_phone' => $request->phone,
                    'order_code' => 'R' . mt_rand(111111, 999999),
                    'shipping_charge' => $request->delivery_area == 'outside_city' ? $request->outside_charge : $request->inside_charge,
                    'shipping_address_id' => $shipping_address->id,
                    'sub_total' => $total_cart_price,
                    'total' => $total_cart_price,
                    'discount' => 0,
                    'paid' => 0,
                    'order_type' => 'online',
                    'due' => $total_cart_price,
                    'coupon_id' => NULL,
                    'order_note' => NULL,
                    'payment_method' => $request->payment_method,
                    'date' => date('Y-m-d'),
                    'pending_at' => Carbon::now(),
                ]);

                foreach ($cart as $key => $item) {
                    $product = Product::findOrFail($key);
                    $discount = 0.00;
                    OrderProduct::create([
                        'order_id' => $order->id,
                        'product_id' => $key,
                        'discount' => $discount,
                        'discount_price' => $product->price->online_price,
                        'sale_price' => $product->price->online_price,
                        'regular_price' => $product->price->online_price,
                        'order_price' => $item['price'] * $item['qty'],
                        'quantity' => $item['qty'],
                    ]);
                }
                session()->forget('cart');
            });
            return redirect()->route('customer.orders')->withSuccessMessage('Ordered Successfully!');
        } else {
            return redirect()->route('frontend.home')->withErrors('Please add some product into cart!');
        }
    }
}
