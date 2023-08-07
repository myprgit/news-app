<?php
//https://api.nytimes.com/svc/archive/v1/2023/1.json?api-key=GI9ak4bNo066kjqo7Bt6VAWGxzAG2UKG

namespace App\Http\Controllers\ApiControllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

class NYTController extends Controller
{
    public static function getData()
    {
        $response = Http::get('https://api.nytimes.com/svc/archive/v1/'.Carbon::now()->year.'/'.Carbon::now()->month.'.json?api-key=GI9ak4bNo066kjqo7Bt6VAWGxzAG2UKG');
        try {
            $results = array_slice(json_decode($response->body(), true)['response']['docs'],0 ,10);
            $data = [];
            foreach ($results as $result)
            {
                $data[] = ['category' => str_replace(".", "", $result['section_name']), 'source' => strtoupper($result['source']), 'author' => !Empty($result['byline']['person'])?strtoupper($result['byline']['person'][0]['firstname'].' '.$result['byline']['person'][0]['lastname']):'', 'date' => new Carbon($result['pub_date']), 'title' => $result['headline']['main'], 'url' => $result['web_url'], 'content' => $result['lead_paragraph']];
            }
            return $data;
        }
        catch (\Exception $e)
        {
            return false;
        }
    }
}
