<?php

use App\Http\Controllers\ProductController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;
use App\Http\Controllers\Auth\RegisteredUserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

// Authentication routes
Route::post('/register', [RegisteredUserController::class, 'store']);
Route::post('/login', [AuthenticatedSessionController::class, 'store']);
Route::post('/logout', [AuthenticatedSessionController::class, 'destroy'])->middleware('auth:sanctum');

// Public products routes (for testing without authentication)
Route::apiResource('products', ProductController::class);

// Protected products routes (commented out initially, uncomment to enable auth)
// Route::middleware('auth:sanctum')->group(function () {
//     Route::apiResource('products', ProductController::class);
// });