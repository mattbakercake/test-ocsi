<?php

namespace App\Http\Controllers;

use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\App;

class MessageController extends Controller
{
    function fetchRandom() {
        try {
            $data = Message::inRandomOrder()->limit(1)->first();

            return response()->json($data);
        } catch (\Exception $e) {

            $message = 'There was an API error';
            if (App::hasDebugModeEnabled()) {
                $message = $e->getMessage();
            }

            return response()->json(['error' => $message], 500);
        }
    }
}
