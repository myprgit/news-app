<?php

namespace App\Console\Commands;

use App\Http\Controllers\NewsController;

class FetchData extends \Illuminate\Console\Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'FetchData';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'get data from apis';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        try {
            NewsController::createData();
            $this->info('success');
        }
        catch (\Exception $e)
        {
            $this->info($e);
        }
    }
}
