<?php
//https://content.guardianapis.com/search?api-key=b344499a-ea01-4a63-8cb2-88c9eeaf7683
namespace App\Http\Controllers\ApiControllers;

use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\Http;

class TheGuardianController extends Controller
{
    public static function getData()
    {
        $response = Http::get('https://content.guardianapis.com/search?api-key=b344499a-ea01-4a63-8cb2-88c9eeaf7683');
        try {
            $results = json_decode($response->body(),true)['response']['results'];
            $data = [];

            foreach ($results as $result)
            {
                $data[] = ['category' => str_replace(" news", "", $result['sectionName']) , 'source' => 'THE GUARDIAN', 'author' => '', 'date' => new Carbon($result['webPublicationDate']), 'title' => $result['webTitle'], 'url' => $result['webUrl'], 'content' => $result['webTitle']];
            }
            return $data;
        }
        catch (\Exception $e)
        {
            return false;
        }
    }
}
