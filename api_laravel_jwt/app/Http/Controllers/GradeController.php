<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\repositories\GradeRepository;

class GradeController extends Controller {

    public $GradeRepository;

    public function __construct(GradeRepository $GradeRepository) {
        $this->GradeRepository = $GradeRepository;
    }

    public function get_grade_list() {
        $grade_data = $this->GradeRepository->get_grades();

        return response()->json([
                    'success' => true,
                    'message' => 'Grade List.',
                    'data' => $grade_data
        ]);
    }
    public function get_grade_by_id($id){
         $single_grade = $this->GradeRepository->get_grade_list_id($id);
         return response()->json([
                    'success' => true,
                    'message' => 'Grade List.',
                    'data' => $single_grade
        ]);
    }
    public function create_grade(Request $request) {

        $formData = $request->all();
        $validator = \Validator::make($formData, [
                    'grade_name' => 'required',
                    'rank' => 'required',
                    'salary' => 'required',
                        ], [
                    'grade_name.required' => 'Please Give Grade',
                    'rank.required' => 'Please Give Rank',
                    'salary.required' => 'Please Give Salary',
        ]);

        if ($validator->fails()) {
            return response()->json([
                        'success' => false,
                        'message' => $validator->getMessageBag()->first(),
                        'error' => $validator->getMessageBag(),
            ]);
        }

        $insert_employee = $this->GradeRepository->create_grade($request);

        return response()->json([
                    'success' => true,
                    'message' => 'Grade has been inserted succesfully.',
                    'data' => ''
        ]);
    }

    public function edit_grade(Request $request) {

        $formData = $request->all();
        $validator = \Validator::make($formData, [
                    'id' => 'required',
                    'grade_name' => 'required',
                    'rank' => 'required',
                    'salary' => 'required',
                        ], [
                    'grade_name.required' => 'Please Give Grade',
                    'rank.required' => 'Please Give Rank',
                    'salary.required' => 'Please Give Salary',
        ]);

        if ($validator->fails()) {
            return response()->json([
                        'success' => false,
                        'message' => $validator->getMessageBag()->first(),
                        'error' => $validator->getMessageBag(),
            ]);
        }

        $insert_employee = $this->GradeRepository->update_grade($request);
        return response()->json([
                    'success' => true,
                    'message' => 'Grade has been edited succesfully.',
                    'data' => ''
        ]);
    }

    public function grade_delete($id) {
        $delete_grade = $this->GradeRepository->delete_grade($id);
        return response()->json([
                    'success' => true,
                    'message' => 'Grade has been deleted succesfully.',
                    'data' => ''
        ]);
    }

}
