<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::get('/dashboard', function () {
    return Inertia::render('Dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
    Route::get('/theguardian', [\App\Http\Controllers\ApiControllers\TheGuardianController::class, 'getData'])->name('theguardianapi');
    Route::get('/nyt', [\App\Http\Controllers\ApiControllers\NYTController::class, 'getData'])->name('nytapi');
    Route::get('/newsapi', [\App\Http\Controllers\ApiControllers\NewsApiController::class, 'getData'])->name('newsapi');
    Route::get('/savedata', [\App\Http\Controllers\NewsController::class, 'createData']);
    Route::get('/getall', [\App\Http\Controllers\NewsController::class, 'getAll']);
    Route::post('/updateprefs', [ProfileController::class, 'updatePreferences'])->name('profile.update.prefs');
    Route::get('/getprefs', [ProfileController::class, 'getPreferences'])->name('profile.get.prefs');
    Route::get('/getalluser', [\App\Http\Controllers\NewsController::class, 'getAllWithPrefs']);

});

require __DIR__.'/auth.php';
