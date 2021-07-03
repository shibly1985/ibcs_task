<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\repositories\ReportRepository;

class ReportController extends Controller
{
    public $ReportInterface;

    public function __construct(ReportRepository $ReportRepository)
    {
        $this->ReportRepository = $ReportRepository;
    }
    
    public function emp_sallery_sheet() {
        $emp_salary_sheet_data = $this->ReportRepository->employee_salary_report();

        return response()->json([
            'success' => true,
            'message' => 'Task List',
            'data' => $emp_salary_sheet_data
        ]);
    }
}
