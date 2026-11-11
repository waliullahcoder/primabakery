<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdminSetting extends Model
{
    use HasFactory;

    protected $fillable = ['logo', 'favicon', 'title', 'footer_text', 'primary_color', 'secondary_color', 'compare_chart_start', 'compare_chart_end', 'accounting', 'facebook', 'twitter', 'linkedin', 'whatsapp', 'google'];
}
