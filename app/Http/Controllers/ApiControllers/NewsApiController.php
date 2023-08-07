<?php
//https://newsapi.org/v2/top-headlines?country=us&apiKey=97f61d0da9fa48abac7cc0b64f5ab73f

namespace App\Http\Controllers\ApiControllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

class NewsApiController extends Controller
{
    public static function getData()
    {
        $response = Http::get('https://newsapi.org/v2/top-headlines?country=us&apiKey=97f61d0da9fa48abac7cc0b64f5ab73f');

        try {
            $results = array_slice(json_decode($response->body(), true)['articles'],0,10);
            $data = [];
            foreach ($results as $result)
            {
                $data[] = ['category' => '', 'source' => strtoupper($result['source']['name']), 'author' => strtoupper($result['author']?strtok($result['author'], ','):''), 'date' => new Carbon($result['publishedAt']), 'title' => $result['title'], 'url' => $result['url'], 'content' => $result['description']];
            }
            return $data;
        }
        catch (\Exception $e)
        {
            return false;
        }
    }
}
