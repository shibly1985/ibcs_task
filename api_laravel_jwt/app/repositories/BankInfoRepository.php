<?php

namespace App\repositories;

use App\interfaces\BankInfoInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BankInfoRepository implements BankInfoInterface {

    public function bank_info_data() {
             
        $query = DB::table('bank_account_infos');
        $query->join('ledgers', 'ledgers.id', '=', 'bank_account_infos.ledger_id');       
        $query->select( 'bank_account_infos.id as bank_acc_info_id', 'bank_account_infos.*');
        $query->where('ledgers.company_id','<>', '');
        $data = $query->get();
        $data_arr=[];
        foreach($data as $k=>$val){
          $data_arr[$k]['bank_name']=  $val->bank_name;
          $data_arr[$k]['branch_name']=  $val->branch_name;
          $data_arr[$k]['account_name']=  $val->account_name;
          $data_arr[$k]['account_type']=  $val->account_type;
          $data_arr[$k]['account_number']=  $val->account_number;
        }
        
        return $data_arr; 
    }
    
    public function get_company_current_balance_stat(){
        
        $account_balance = DB::table('ledgers')->where('company_id', 777777)->first();
        $bank_current_balance = $account_balance->current_balance;
        
        $query = DB::table('employees');
        $query->join('grades', 'grades.id', '=', 'employees.grade_id');       
        $query->select( DB::raw('SUM(grades.gross_salary) as total_employee_salary'));       
        $data = $query->first();
        $employee_salary=$data->total_employee_salary;
        
        $data_array=[];
        $data_array['company_current_balance']=$bank_current_balance;
        $data_array['total_employee_salary']=$employee_salary;
        
        return $data_array;
    }

    public function create(Request $request) {

        $company_id = $request->company_id;
        // $rcv_ammount=$request->rcv_ammount; 
        $rcv_ammount = 0;
        $bank_name = $request->bank_name;
        $branch_name = $request->branch_name;
        $account_name = $request->account_name;
        $account_type = $request->account_type;
        $account_number = $request->account_number;

        $debit = 0;
        $credit = $rcv_ammount;

        $ledger_data = array(
            'company_id' => $company_id,
            'opening_balance' => $rcv_ammount,
            'debit' => $debit,
            'credit' => $credit,
            'current_balance' => $rcv_ammount
        );
        $query_insert = DB::table('ledgers')->insert($ledger_data);
        $ledger_id = DB::getPdo()->lastInsertId();

        $bank_account_data = array(
            'ledger_id' => $ledger_id,
            'bank_name' => $bank_name,
            'branch_name' => $branch_name,
            'account_name' => $account_name,
            'account_type' => $account_type,
            'account_number' => $account_number,
        );
        //dd($bank_account_data);
        $query_insert = DB::table('bank_account_infos')->insert($bank_account_data);


        $transaction_data = array(
            'ledger_id' => $ledger_id,
            'debit' => 0,
            'credit' => $rcv_ammount,
            'status' => 'credit'
        );
        $query_insert = DB::table('transactions')->insert($transaction_data);
    }

    public function credit_bank_acc(Request $request) {

        $rcv_ammount = $request->rcv_ammount;
        $bank_name = $request->bank_name;
        $account_number = $request->account_number;

        $account_verified = DB::table('bank_account_infos')->where('account_number', $account_number)->first();
        $bank_info_id = $account_verified->account_number;

        if ($account_number === $bank_info_id) {

            $get_bank_data = DB::table('ledgers')
                    ->select('id', 'credit', 'current_balance', 'debit', 'opening_balance')
                    ->where('id', '=', 1)
                    ->first();

            $current_balance = $get_bank_data->current_balance;
            $debit = $get_bank_data->debit;
            $credit = $get_bank_data->credit;
            $ledger_id = $get_bank_data->id;
            $after_rcv_current_balance = $rcv_ammount + $current_balance;

            $ledgers_arr = array(
                'debit' => $debit,
                'credit' => $credit,
                'current_balance' => $after_rcv_current_balance,
            );
            $query_ledger_update = DB::table('ledgers')->where('id', $ledger_id)->update($ledgers_arr);

            $transaction_data = array(
                'ledger_id' => $ledger_id,
                'debit' => 0,
                'credit' => $rcv_ammount,
                'status' => 'credit'
            );
            $query_insert = DB::table('transactions')->insert($transaction_data);
            $msg = "Received ammount has been added succesfully";
        } else {
            $msg = "The bank info that you have provied is not valid data.";
        }
        return $msg;
    }

    public function get_company_current_balance() {
        $query = DB::table('ledgers');
        $query->select('current_balance');
        $query->where('company_id', '777777');
        $data = $query->get();
        $data_arr = [];
        foreach ($data as $val) {
            $data_arr['current_balance'] = $val->current_balance;
        }
        return $data_arr;
    }

    public function get_total_employee_data() {
        $query = DB::table('employees');
        $query->join('grades', 'grades.id', '=', 'employees.grade_id');
        $query->join('ledgers', 'ledgers.employee_id', '=', 'employees.id');
        //$query->join('bank_account_infos', 'bank_account_infos.ledger_id', '=', 'ledgers.id');
        $query->select(
                'employees.id', 'employees.employee_id', 'employees.name', 'employees.mobile', 'grades.basic_salary', 'grades.gross_salary', 'ledgers.id as ledger_id'
        );
        // $query->where('uni_interview_selection_details.status', 'active');
        $data = $query->get();
        $all_emp_data = [];
        $total_salary = [];
        foreach ($data as $k => $val) {
            $all_emp_data[$k]['id'] = $val->id;
            $all_emp_data[$k]['employee_id'] = $val->employee_id;
            $all_emp_data[$k]['name'] = $val->name;
            $all_emp_data[$k]['mobile'] = $val->mobile;
            $all_emp_data[$k]['basic_salary'] = $val->basic_salary;
            $all_emp_data[$k]['gross_salary'] = $val->gross_salary;
            $all_emp_data[$k]['ledger_id'] = $val->ledger_id;
            $total_salary[] = $val->gross_salary;
        }

        $data_array['all_emp_data'] = $all_emp_data;
        $data_array['total_emp_salary'] = array_sum($total_salary);
        return $data_array;
    }

    public function add_employee_salary($ledger_id, $each_emp_salary, $company_present_bal, $rest_company_bal) {
        // Employee Operation
        $update_employee_account = DB::table('ledgers')
                ->where('id', $ledger_id)
                ->update([
            'opening_balance' => $each_emp_salary,
            'credit' => $each_emp_salary,
            'current_balance' => $each_emp_salary,
        ]);
        $emp_transaction_arr = array(
            'ledger_id' => $ledger_id,
            'credit' => $each_emp_salary,
            'status' => 'credit',
        );
        $query_insert = DB::table('transactions')->insert($emp_transaction_arr);

        // Company Operation
        $com_present_balance = $company_present_bal;
        $company_debit = $each_emp_salary;
        $company_credit = $rest_company_bal;

        $update_company_account = DB::table('ledgers')
                ->where('company_id', 777777)
                ->update([
            'debit' => $company_debit,
            'current_balance' => $rest_company_bal,
        ]);

        $company_transaction_arr = array(
            'ledger_id' => 1,
            'debit' => $company_debit,
            'status' => 'debit',
        );
        $query_insert = DB::table('transactions')->insert($company_transaction_arr);
    }

}
