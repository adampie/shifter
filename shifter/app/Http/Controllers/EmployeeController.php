<?php

namespace App\Http\Controllers;

use App\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmployeeController extends Controller
{
    public function index()
    {
      $employees = Employee::where('company_id',Auth::user()->id)->get();

      foreach($employees as $employee) {
         $result[] = array(
           "id" => $employee->id,
           "company_id" => $employee->company_id,
           "firstname" => $employee->firstname,
           "lastname" => $employee->lastname,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/employee/".$employee->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function create($firstname, $lastname)
    {
        $employee = new Employee;
        $employee->firstname = $firstname;
        $employee->lastname = $lastname;
        $employee->company_id = Auth::user()->id;
        $employee->save();
        return response()->json(201);
    }

    public function read($id)
    {
      $employees = Employee::where([
        ['company_id',Auth::user()->id],
        ['id',$id],
      ])->get();
      foreach($employees as $employee) {
         $result[] = array(
           "id" => $employee->id,
           "company_id" => $employee->company_id,
           "firstname" => $employee->firstname,
           "lastname" => $employee->lastname,
           "links" => [
              "rel" => "self",
              "href" =>"http://localhost/api/v1/employee/".$employee->id,
             ]
         );
      }
      json_encode($result);
      return response()->json($result);
    }

    public function update($id, $firstname, $lastname)
    {
      $employee = Employee::find($id);
      $employee->firstname = $firstname;
      $employee->lastname = $lastname;
      $employee->save();
      return response()->json(200);
    }

    public function delete($id)
    {
      $employee = Employee::find($id);
      $employee->delete();
      return response()->json(200);
    }
}
