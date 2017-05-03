<?php

namespace App\Http\Controllers;

use App\ShiftWorker;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ShiftWorkerController extends Controller
{
    public function index()
    {
      $shiftworkers = ShiftWorker::where('company_id',Auth::user()->id)->get();

      foreach($shiftworkers as $shiftworker) {
         $result[] = array(
           "id" => $shiftworker->id,
           "company_id" => $shiftworker->company_id,
           "employee_id" => $shiftworker->employee_id,
           "shift_id" => $shiftworker->shift_id,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/shiftworker/".$shiftworker->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function create($shift, $worker)
    {
        $shiftworkers = new ShiftWorker;
        $shiftworkers->employee_id = $worker;
        $shiftworkers->shift_id = $shift;
        $shiftworkers->company_id = Auth::user()->id;
        $shiftworkers->save();
        return response()->json(201);
    }

    public function read($id)
    {
      $shiftworkers = Shift::where([
        ['company_id',Auth::user()->id],
        ['id',$id],
      ])->get();
      foreach($shiftworkers as $shiftworker) {
         $result[] = array(
           "id" => $shiftworker->id,
           "company_id" => $shiftworker->company_id,
           "employee_id" => $shiftworker->employee_id,
           "shift_id" => $shiftworker->shift_id,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/shiftworker/".$shiftworker->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function update($id, $shift, $worker)
    {
      $shiftworker = ShiftWorker::find($id);
      $shiftworker->employee_id = $worker;
      $shiftworker->shift_id = $shift;
      $shiftworker->save();
      return response()->json(200);
    }

    public function delete($id)
    {
      $shiftworker = ShiftWorker::find($id);
      $shiftworker->delete();
      return response()->json(200);
    }
}
