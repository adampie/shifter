<?php

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
    return view('welcome');
});

Route::get('/home', function () {
    return redirect('/');
});

Auth::routes();

Route::get('/dashboard', 'HomeController@index')->name('home');

Route::group(['middleware' => 'auth'], function () {
  Route::get('/api/v1/employee', 'EmployeeController@Index');
  Route::post('/api/v1/employee/{firstname}/{lastname}', 'EmployeeController@Create');
  Route::get('/api/v1/employee/{id}', 'EmployeeController@Read');
  Route::post('/api/v1/employee/{id}/{firstname}/{lastname}', 'EmployeeController@Update');
  Route::post('/api/v1/employee/{id}', 'EmployeeController@Delete');

  Route::get('/api/v1/shift', 'ShiftController@Index');
  Route::post('/api/v1/shift/{day}/{start}/{end}', 'ShiftController@Create');
  Route::get('/api/v1/shift/{id}', 'ShiftController@Read');
  Route::post('/api/v1/shift/{id}/{day}/{start}/{end}', 'ShiftController@Update');
  Route::post('/api/v1/shift/{id}', 'ShiftController@Delete');

  Route::get('/api/v1/shiftworker', 'ShiftController@Index');
  Route::post('/api/v1/shiftworker/{shift}/{worker}', 'ShiftController@Create');
  Route::get('/api/v1/shiftworker/{id}', 'ShiftController@Read');
  Route::post('/api/v1/shiftworker/{id}/{shift}/{worker}', 'ShiftController@Update');
  Route::post('/api/v1/shiftworker/{id}', 'ShiftController@Delete');
});

// https://github.com/mzabriskie/axios
// http://vue-chartjs.org/#/home?id=introduction
// https://v4-alpha.getbootstrap.com/components/buttons/
// https://vuejs.org/v2/guide/single-file-components.html
