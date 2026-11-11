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
        Schema::create('transfer_products', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id');
            $table->foreignId('transfer_id')->constrained()->onDelete('cascade');
            $table->foreignId('product_id');
            $table->decimal('qty', 16, 2);
            $table->decimal('amount', 16, 2);
            $table->tinyInteger('is_back')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transfer_products');
    }
};
