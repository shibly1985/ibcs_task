<?php

namespace App\repositories;

use App\interfaces\ReportInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReportRepository implements ReportInterface {

    public function employee_salary_report() {
        
        $query = DB::table('employees');
        $query->join('grades', 'grades.id', '=', 'employees.grade_id');
        $query->select('employees.*', 'grades.*');
        $data = $query->get();
        $data_array=[];
        foreach($data as $k=>$val){
            $data_array[$k]['employee_id']=$val->employee_id;
            $data_array[$k]['name']=$val->name;
            $data_array[$k]['address']=$val->address;
            $data_array[$k]['mobile']=$val->mobile;
            $data_array[$k]['grade_name']=$val->grade_name;
            $data_array[$k]['basic_salary']=$val->basic_salary;
            $data_array[$k]['gross_salary']=$val->gross_salary;
            }
        return $data_array;
        
    }

}
