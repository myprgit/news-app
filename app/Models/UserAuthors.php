<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserAuthors extends Model
{
    protected $table = 'user_authors';
    protected $fillable = [
        'user_id',
        'author',
        'is_active'
    ];
}
