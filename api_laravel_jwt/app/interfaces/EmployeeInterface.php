<?php
namespace App\interfaces;

use Illuminate\Http\Request;

interface EmployeeInterface{

    public function get_employees();
    public function get_employee_by_id($id);
    public function create_employee(Request $request);
    public function update_employee(Request $request);
    public function delete_employee($id);

}