<?php
namespace App\interfaces;

use Illuminate\Http\Request;

interface BankInfoInterface{

   
    public function create(Request $request);
    public function credit_bank_acc(Request $request);
    public function bank_info_data();
    public function get_company_current_balance_stat();

    // for disburse salary

    public function get_company_current_balance();
    public function get_total_employee_data();
    public function add_employee_salary($ledger_id,$each_emp_salary,$company_present_bal,$rest_company_bal);

}