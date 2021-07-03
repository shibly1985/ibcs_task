<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:api')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::post("login", "AuthController@login");
Route::post("register", "AuthController@register");


Route::get('/get_employee','EmployeeController@get_employees');
Route::get('/get_employee_by_id/{id}','EmployeeController@get_employee_by_id');
Route::post('/create_employee','EmployeeController@store_employee');
Route::post('/update_employee/','EmployeeController@edit_employee');
Route::get('/delete_employee/{id}','EmployeeController@employee_delete');

Route::get('/get_grades','GradeController@get_grade_list');
Route::get('/get_grades_by_id/{id}','GradeController@get_grade_by_id');
Route::post('/create_grade','GradeController@create_grade');
Route::post('/update_grade/','GradeController@edit_grade');
Route::get('/delete_grade/{id}','GradeController@grade_delete');

Route::get('/salary_disburse','BankInfoController@salary_disbursement');
Route::post('/create_company_account','BankInfoController@create_company_acc');
Route::post('/credit_bank_account','BankInfoController@credit_company_account');
Route::get('/get_bank_info','BankInfoController@get_bank_information');
Route::get('/current_bank_account_status','BankInfoController@get_balance_status');

Route::get('/salary_sheet_report','ReportController@emp_sallery_sheet');



Route::group(["middleware" => "auth.jwt"], function () {
    Route::get("logout", "AuthController@logout");
    Route::resource("tasks", "TaskController");
});