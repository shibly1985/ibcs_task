<?php
namespace App\interfaces;

use Illuminate\Http\Request;

interface GradeInterface{
    public function get_grades();
    public function get_grade_list_id($id);
    public function create_grade(Request $request);
    public function update_grade(Request $request);
    public function delete_grade($id);

}