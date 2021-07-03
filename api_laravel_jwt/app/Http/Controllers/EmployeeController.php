<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\repositories\employeeRepository;

class EmployeeController extends Controller {

    public $employeeRepository;

    public function __construct(employeeRepository $employeeRepository) {
        $this->employeeRepository = $employeeRepository;
    }

    public function shibly() {
        die('shibly');
    }

    public function get_employees() {
        $employee_data = $this->employeeRepository->get_employees();
        return response()->json([
                    'success' => true,
                    'message' => 'All employee information.',
                    'data' => $employee_data
        ]);
    }

    public function store_employee(Request $request) {


        $formData = $request->all();
        $validator = \Validator::make($formData, [
                    'name' => 'required',
                    'grade_id' => 'required',
                        ], [
                    'name.required' => 'Please Give  Name',
                    'grade_id.required' => 'Please Give  Grade',
        ]);

        if ($validator->fails()) {
            return response()->json([
                        'success' => false,
                        'message' => $validator->getMessageBag()->first(),
                        'error' => $validator->getMessageBag(),
            ]);
        }

        $insert_employee = $this->employeeRepository->create_employee($request);

        return response()->json([
                    'success' => true,
                    'message' => 'Employee has been created succesfully.',
                    'data' => ''
        ]);
    }

    public function get_employee_by_id($id) {
        $single_employee = $this->employeeRepository->get_employee_by_id($id);
        return response()->json([
                    'success' => true,
                    'message' => 'Single employee Information.',
                    'data' => $single_employee
        ]);
    }

    public function edit_employee(Request $request) {
        $id = $request->employee_id;

        $employee = $this->employeeRepository->get_employee_by_id($id);
        if (is_null($employee)) {
            return response()->json([
                        'success' => false,
                        'message' => 'Employee has not found.',
                        'data' => null,
            ]);
        }
        /*
          $formData = $request->all();
          $validator = \Validator::make($formData, [
          'name' => 'required',
          'description' => 'required',
          'user_id' => 'required',
          ], [
          'name.required' => 'Please Give Project Name',
          'description.required' => 'Please Give Project Description',
          ]);

          if ($validator->fails()) {
          return response()->json([
          'success' => false,
          'message' => $validator->getMessageBag()->first(),
          'error' => $validator->getMessageBag(),
          ]);
          }
         */
        $edit_employee = $this->employeeRepository->update_employee($request);

        return response()->json([
                    'success' => true,
                    'message' => 'Employee has been updated succesfully.',
                    'data' => ''
        ]);
    }

    public function employee_delete($id) {
        $delete_employee = $this->employeeRepository->delete_employee($id);
        return response()->json([
                    'success' => true,
                    'message' => 'Employee has been deleted succesfully.',
                    'data' => ''
        ]);
    }

}
