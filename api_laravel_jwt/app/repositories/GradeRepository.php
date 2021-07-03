<?php

namespace App\repositories;

use App\interfaces\GradeInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GradeRepository implements GradeInterface {

    public function get_grades() {
        $query = DB::table('grades');
        $query->select('*');
        $query->where('is_active', 1);
        $data = $query->get();
        $data_arr = [];
        foreach ($data as $k => $val) {
            $data_arr[$k]['grade_id']=$val->id;
            $data_arr[$k]['grade_name'] = $val->grade_name;
            $data_arr[$k]['rank'] = $val->rank;
            $data_arr[$k]['basic_salary'] = $val->basic_salary;
            $data_arr[$k]['gross_salary'] = $val->gross_salary;
        }
        return $data_arr;
    }
    
    public function get_grade_list_id($id) {

        $query = DB::table('grades');
        $query->select('*');
        $query->where('id', $id);
        $data = $query->get();
        $data_arr = [];
        foreach ($data as $k => $val) {
            $data_arr['grade_id']=$val->id;
            $data_arr['grade_name'] = $val->grade_name;
            $data_arr['rank'] = $val->rank;
            $data_arr['basic_salary'] = $val->basic_salary;
            $data_arr['gross_salary'] = $val->gross_salary;
        }
        return $data_arr;
    }

    public function create_grade(Request $request) {

        $grade_name = $request->grade_name;
        $rank = $request->rank;
        $salary = $request->salary;
        $house_rent = (20 * $salary ) / 100;
        $medical_allowance = (15 * $salary ) / 100;
        $gross_salary = $salary + $house_rent + $medical_allowance;
        $grade_data = array(
            'grade_name' => $grade_name,
            'rank' => $rank,
            'basic_salary' => $salary,
            'gross_salary' => $gross_salary
        );
        $query_insert = DB::table('grades')->insert($grade_data);
        return true;
    }

    public function update_grade(Request $request) {

        $grade_id = $request->id;
        $grade_name = $request->grade_name;
        $rank = $request->rank;
        $salary = $request->salary;
        $house_rent = (20 * $salary ) / 100;
        $medical_allowance = (15 * $salary ) / 100;
        $gross_salary = $salary + $house_rent + $medical_allowance;

        $grade_data = array(
            'grade_name' => $grade_name,
            'rank' => $rank,
            'basic_salary' => $salary,
            'gross_salary' => $gross_salary
        );
        $update = DB::table('grades')->where('id', $grade_id)->update($grade_data);
        return true;
    }

    public function delete_grade($id) {
        $delete_grade = DB::table('grades')->where('id', $id)->delete();
         return true;
    }

}
