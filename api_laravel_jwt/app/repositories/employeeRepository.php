<?php

namespace App\repositories;

use App\interfaces\EmployeeInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class employeeRepository implements EmployeeInterface {

    public function get_employees() {

        $query = DB::table('employees');
        $query->join('bank_account_infos', 'bank_account_infos.id', '=', 'employees.bank_info_id');
        $query->join('grades', 'grades.id', '=', 'employees.grade_id');
        $query->select('employees.id', 'employees.employee_id', 'employees.name', 'employees.address', 'employees.mobile','grades.*');

        $data = $query->get();
        $data_arr = [];
        foreach ($data as $k => $val) {
            $data_arr[$k]['emp_id'] = $val->id;
            $data_arr[$k]['id'] = $val->employee_id;
            $data_arr[$k]['name'] = $val->name;
            $data_arr[$k]['address'] = $val->address;
            $data_arr[$k]['mobile'] = $val->mobile;
            $data_arr[$k]['grade_name'] = $val->grade_name;
             $data_arr[$k]['rank'] = $val->rank;
        }
        return $data_arr;
    }

    public function get_employee_by_id($id) {

        $query = DB::table('employees');
        $query->join('bank_account_infos', 'bank_account_infos.id', '=', 'employees.bank_info_id');
        $query->join('grades', 'grades.id', '=', 'employees.grade_id');
        $query->select('employees.id as emp_id', 'employees.*', 'bank_account_infos.id as bank_acc_info_id', 'bank_account_infos.*', 'grades.*');
        $query->where('employees.id', $id);
        $data = $query->get();
        $data_arr = [];
        foreach ($data as $k => $val) {
            $data_arr['emp_id'] = $val->emp_id;
            $data_arr['id'] = $val->employee_id;
            $data_arr['name'] = $val->name;
            $data_arr['address'] = $val->address;
            $data_arr['mobile'] = $val->mobile;

            $data_arr['bank_name'] = $val->bank_name;
            $data_arr['branch_name'] = $val->branch_name;
            $data_arr['account_name'] = $val->account_name;
            $data_arr['account_type'] = $val->account_type;
            $data_arr['account_number'] = $val->account_number;
            $data_arr['grade_id'] = $val->grade_id;
            $data_arr['basic_salary'] = $val->basic_salary;
            $data_arr['gross_salary'] = $val->gross_salary;
            $data_arr['rank'] = $val->rank;
        }
        return $data_arr;
    }

    public function create_employee(Request $request) {

        $employee_id = rand(1000, 9999);
        $name = $request->name;
        $grade_id = $request->grade_id;
        $address = $request->address;
        $mobile = $request->mobile;
        $bank_info_id = 0; // sob data insert houyer pore then update hobe

        $employee_data = array(
            'employee_id' => $employee_id,
            'name' => $name,
            'address' => $address,
            'mobile' => $mobile,
            'bank_info_id' => $bank_info_id,
            'grade_id' => $grade_id,
        );
        // dd($employee_data);
        $query_insert = DB::table('employees')->insert($employee_data);
        $emp_id = DB::getPdo()->lastInsertId();

        //$bank_acc_info_id =  $last_acc_id;
        $opening_balance_ledger = 0;
        $debit = 0;
        $credit = 0;
        $current_balance_ledger = 0;

        $ledger_data = array(
            'employee_id' => $emp_id,
            'opening_balance' => $opening_balance_ledger,
            'debit' => $debit,
            'credit' => $credit,
            'current_balance' => $current_balance_ledger
        );

        $query_insert = DB::table('ledgers')->insert($ledger_data);

        $ledger_id = DB::getPdo()->lastInsertId();

        $bank_name = $request->bank_name;
        $branch_name = $request->branch_name;
        $account_name = $request->account_name;
        $account_type = $request->account_type;
        $account_number = $request->account_number;


        $bank_account_data = array(
            'ledger_id' => $ledger_id,
            'bank_name' => $bank_name,
            'branch_name' => $branch_name,
            'account_name' => $account_name,
            'account_type' => $account_type,
            'account_number' => $account_number,
        );

        $query_insert = DB::table('bank_account_infos')->insert($bank_account_data);

        $last_acc_id = DB::getPdo()->lastInsertId();
        $update_employee_bank_acc = DB::table('employees')
                ->where('id', $emp_id)
                ->update([
            'bank_info_id' => $last_acc_id,
        ]);
    }

    public function update_employee(Request $request) {

        $employee_id = $request->employee_id;
        //echo $employee_id; die();
        $name = $request->name;
        $address = $request->address;
        $mobile = $request->mobile;

        $employee_data = array(
            'name' => $name,
            'address' => $address,
            'mobile' => $mobile,
        );

        $query_employee_update = DB::table('employees')->where('id', $employee_id)->update($employee_data);

        $bank_tbl_id = DB::table('employees')->where('id', $employee_id)->first();
        $bank_info_id = $bank_tbl_id->bank_info_id;

        $bank_name = $request->bank_name;
        $branch_name = $request->branch_name;
        $account_name = $request->account_name;
        $account_type = $request->account_type;
        $account_number = $request->account_number;
        $bank_account_data = array(
            'bank_name' => $bank_name,
            'branch_name' => $branch_name,
            'account_name' => $account_name,
            'account_type' => $account_type,
            'account_number' => $account_number,
        );
        $query_bank_update = DB::table('bank_account_infos')->where('id', $bank_info_id)->update($bank_account_data);
    }

    public function delete_employee($id) {
        $bank_tbl_id = DB::table('employees')->where('id', $id)->first();
        $bank_info_id = $bank_tbl_id->bank_info_id;
        //dd($bank_info_id);
        $delete_employee = DB::table('employees')->where('id', $id)->delete();

        $delete_bank_info = DB::table('bank_account_infos')->where('id', $bank_info_id)->delete();

        $delete_ledger = DB::table('ledgers')->where('employee_id', $id)->delete();
    }

}
