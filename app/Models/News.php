<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class News extends Model
{
    protected $table = "news";

    protected $fillable = [
        'category',
        'source',
        'author',
        'date',
        'title',
        'url',
        'content'
    ];
}
