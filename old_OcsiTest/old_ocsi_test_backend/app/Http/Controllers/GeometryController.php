<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Geometry;
use Illuminate\Support\Facades\App;

class GeometryController extends Controller
{
    function invalid(Request $request) {

        try {
            $data = Geometry::select(
                    'id', //id
                    'area_name', //name
                    DB::raw('reason(ST_IsValidDetail(geom))'), //reason
                    DB::raw('ST_AsText(location(ST_IsValidDetail(geom))) as location')) //geometry where error is
                ->whereRaw('NOT ST_IsValid(geom)')
                ->get();
            
            return response()->json($data);
        } catch (\Exception $e) {

            $message = 'There was an API error';
            if (App::hasDebugModeEnabled()) {
                $message = $e->getMessage();
            }

            return response()->json(['error' => $message],500);
        }
    }
}
