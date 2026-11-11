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
        Schema::create('lifting_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('lifting_id')->constrained('liftings')->onDelete('cascade');
            $table->foreignId('company_id');
            $table->foreignId('store_id');
            $table->foreignId('vendor_id');
            $table->foreignId('product_id');
            $table->decimal('lifting_price', 16, 2);
            $table->date('expiry_date')->nullable();
            $table->decimal('qty', 16, 2)->default(1);
            $table->decimal('total_amount', 16, 2);
            $table->decimal('discount', 16, 2);
            $table->decimal('total_paid', 16, 2)->default(0.00);
            $table->decimal('sold_qty')->default(0.00);
            $table->decimal('sales_return_qty')->default(0.00);
            $table->decimal('return_qty')->default(0.00);
            $table->decimal('transfer_qty')->default(0.00);
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('all_finished')->default(0);
            $table->unsignedBigInteger('created_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lifting_products');
    }
};
