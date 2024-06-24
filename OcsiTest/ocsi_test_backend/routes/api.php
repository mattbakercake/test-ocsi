<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GeometryController;
use App\Http\Controllers\MessageController;
use App\Models\Message;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::get('/message', [MessageController::class, 'fetchRandom']);
Route::get('/invalid_geo', [GeometryController::class, 'invalid']);
