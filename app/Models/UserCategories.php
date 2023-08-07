<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserCategories extends Model
{
    protected $table = 'user_categories';
    protected $fillable = [
        'user_id',
        'category',
        'is_active'
    ];
}
