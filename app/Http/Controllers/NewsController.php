<?php

namespace App\Http\Controllers;

use App\Http\Controllers\ApiControllers\NewsApiController;
use App\Http\Controllers\ApiControllers\NYTController;
use App\Http\Controllers\ApiControllers\TheGuardianController;
use App\Models\News;
use App\Models\UserAuthors;
use App\Models\UserCategories;
use App\Models\UserSources;
use Illuminate\Support\Facades\Auth;

class NewsController extends Controller
{
    public static function createData()
    {
        $data = array_merge(NYTController::getData()??'',NewsApiController::getData()??'',TheGuardianController::getData()??'');

        foreach ($data as $item)
        {
            News::updateOrInsert(
                ['title' => $item['title']],
                $item
            );
        }

        return true;
    }

    public static function getAll()
    {
        return News::all()->toArray();
    }

    public static function getAllWithPrefs()
    {
        $sources = [];
        $authors = [];
        $categories = [];
        foreach(UserSources::where(['user_id'=>Auth::id()])->get()->toArray() as $item)
        {
            $sources[] = $item['source'];
        }
        foreach(UserCategories::where(['user_id'=>Auth::id()])->get()->toArray() as $item)
        {
            $categories[] = $item['category'];
        }
        foreach(UserAuthors::where(['user_id'=>Auth::id()])->get()->toArray() as $item)
        {
            $authors[] = $item['author'];
        }
        return ['sources' => $sources, 'authors'=>$authors, 'categories'=>$categories];
    }
}
