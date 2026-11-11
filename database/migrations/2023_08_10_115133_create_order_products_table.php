<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('order_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained()->onDelete('cascade');
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('variant_id')->nullable();
            $table->unsignedBigInteger('flash_deal_id')->nullable();
            $table->unsignedBigInteger('flash_deal_item_id')->nullable();
            $table->decimal('discount', 16, 2)->default(0.00);
            $table->decimal('sale_price', 16, 2);
            $table->decimal('regular_price', 16, 2);
            $table->decimal('discount_price', 16, 2)->default(0.00);
            $table->decimal('order_price', 16, 2)->default(0.00);
            $table->decimal('quantity', 16, 2);
            $table->tinyInteger('sold')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_products');
    }
};
