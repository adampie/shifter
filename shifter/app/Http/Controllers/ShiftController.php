<?php

namespace App\Http\Controllers;

use App\Shift;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShiftController extends Controller
{
    public function index()
    {
      $shifts = Shift::where('company_id',Auth::user()->id)->get();

      foreach($shifts as $shift) {
         $result[] = array(
           "id" => $shift->id,
           "company_id" => $shift->company_id,
           "name" => $shift->name,
           "start" => $shift->start,
           "end" => $shift->end,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/shift/".$shift->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function create($name, $start, $end)
    {
        $shift = new Shift;
        $shift->name = $name;
        $shift->start = $start;
        $shift->end = $end;
        $shift->company_id = Auth::user()->id;
        $shift->save();
        return response()->json(201);
    }

    public function read($id)
    {
      $shifts = Shift::where([
        ['company_id',Auth::user()->id],
        ['id',$id],
      ])->get();
      foreach($shifts as $shift) {
         $result[] = array(
           "id" => $shift->id,
           "company_id" => $shift->company_id,
           "name" => $shift->name,
           "start" => $shift->start,
           "end" => $shift->end,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/shift/".$shift->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function update($id, $name, $start, $end)
    {
      $shift = Shift::find($id);
      $shift->name = $name;
      $shift->start = $start;
      $shift->end = $end;
      $shift->save();
      return response()->json(200);
    }

    public function delete($id)
    {
      $shift = Shift::find($id);
      $shift->delete();
      return response()->json(200);
    }
}
