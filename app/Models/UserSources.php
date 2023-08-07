<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserSources extends Model
{
    protected $table = 'user_sources';
    protected $fillable = [
        'user_id',
        'source',
        'is_active'
    ];
}
