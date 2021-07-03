<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\repositories\BankInfoRepository;

class BankInfoController extends Controller
{
    public $BankInfoRepository;

    public function __construct(BankInfoRepository $BankInfoRepository)
    {
        $this->BankInfoRepository = $BankInfoRepository;
    }

    public function create_company_acc(Request $request){

       /*
        $formData = $request->all();
         $validator = \Validator::make($formData, [
            'name' => 'required',
            'grade' => 'required',
            
        ], [
            'name.required' => 'Please Give  Name',
            'grade.required' => 'Please Give  Grade',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->getMessageBag()->first(),
                'error' => $validator->getMessageBag(),
            ]);
        }
       */
        $insert_employee = $this->BankInfoRepository->create($request);

        return response()->json([
            'success' => true,
            'message' => 'Task List',
            'data' => ''
        ]);
        
    }
    
    public function credit_company_account(Request $request){
         /*
        $formData = $request->all();
         $validator = \Validator::make($formData, [
            'name' => 'required',
            'grade' => 'required',
            
        ], [
            'name.required' => 'Please Give  Name',
            'grade.required' => 'Please Give  Grade',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->getMessageBag()->first(),
                'error' => $validator->getMessageBag(),
            ]);
        }
       */
        $credited_ammount = $this->BankInfoRepository->credit_bank_acc($request);
        return response()->json([
            'success' => true,
            'message' => $credited_ammount,
            'data' => ''
        ]);
        
    }
    
    public function get_bank_information(){
       $data = $this->BankInfoRepository->bank_info_data();
        return response()->json([
            'success' => true,
            'message' => 'Message Information',
            'data' => $data
        ]); 
    }
    
    public function get_balance_status(){
        $data = $this->BankInfoRepository->get_company_current_balance_stat();
        return response()->json([
            'success' => true,
            'message' => 'Message Information',
            'data' => $data
        ]);
    }

    public function salary_disbursement(){

        $company_current_balance = $this->BankInfoRepository->get_company_current_balance();       
        
        $company_availabale_balance=$company_current_balance['current_balance'];
        $total_employee_details = $this->BankInfoRepository->get_total_employee_data();
        $total_emp_salary_ammount=$total_employee_details['total_emp_salary'];
        $employee_details=$total_employee_details['all_emp_data'];

        if($company_availabale_balance>=$total_emp_salary_ammount){
            $company_present_bal=$company_availabale_balance;

            foreach($employee_details as $val){
               
                $ledger_id=$val['ledger_id'];
                $each_emp_salary=$val['gross_salary'];

                $rest_company_bal= ($company_present_bal-$each_emp_salary);
                $update_ledger_tbl=$this->BankInfoRepository->add_employee_salary($ledger_id,$each_emp_salary,$company_present_bal,$rest_company_bal);
                $company_present_bal=$rest_company_bal;
            }
            $msg=1;

        }else{
             $msg=0;
        }
        
        return response()->json([
            'success' => true,
            'message' => $msg,
            'data' => ''
        ]);
        
    }
}
