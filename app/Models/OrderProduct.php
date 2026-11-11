<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{
    use HasFactory;
    protected $fillable = ['order_id', 'product_id', 'variant_id', 'flash_deal_id', 'flash_deal_item_id', 'discount', 'sale_price', 'regular_price', 'discount_price', 'order_price', 'quantity', 'sold'];

    public function variant()
    {
        return $this->belongsTo(ProductStock::class, 'variant_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id')->with(['customer'])->withTrashed();
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id')->with(['category', 'vendor']);
    }
}
