<?php

namespace App\Models;

use App\Models\Scopes\CompanyScope;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BulkCollection extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['company_id', 'date', 'amount', 'remarks', 'created_by', 'updated_by', 'deleted_by'];

    protected static function booted()
    {
        static::addGlobalScope(new CompanyScope);
    }

    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id')->withTrashed();
    }

    public function staff()
    {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function list()
    {
        return $this->hasMany(BulkCollectionList::class, 'bulk_collection_id')->with(['sales', 'collection']);
    }
}
