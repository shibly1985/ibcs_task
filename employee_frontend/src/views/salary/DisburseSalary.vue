<template>
  <div id="employees-add">
    <Header />

    <div class="container-fluid">
      <div class="row">
        <Navbar />

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
          >
            <h1 class="h2">Disburse Salary </h1>
          </div>
          <div class="row">
            <div class="col-md-12">

            <div class="col-md-6"><h5>Current Balance: {{bank_info.company_current_balance}}</h5></div>
            <div class="col-md-6"><h5>Total Employee Salary: {{bank_info.total_employee_salary}}</h5></div>
            <hr/>
             <form
                @submit.prevent="DisburseSalary"
                class="row g-3 needs-validation"
                novalidate
                
              >
              <div class="col-12">
                  <h6>Please disburse the all employye salary at a time by clicking the below <mark>Disburse Salary</mark> Button.</h6>
              </div>
              <div class="alert alert-success" v-if="show_succ_msg">
                {{succ_msg}}
              </div>
              <div class="col-12">
                  <button class="btn btn-success" type="submit">
                   Disburse Salary 
                  </button>
                </div>
              </form>
            </div>
          </div>
        </main>
         <div class="loader" v-if="loader"></div>
      </div>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';

export default {
  name: 'DisburseSalary',
  data() {
     return {
      loader: false,
      show_succ_msg:false,
      msg: [], 
      succ_msg:'', 
       bank_info: [],
         
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    getBankInfo() {
      this.$http.get('api/current_bank_account_status').then((response) => {
        console.log(response);
        this.bank_info = response.data.data;
      });
    },
    DisburseSalary() {   
      this.loader=true;   
      this.$http.get('api/salary_disburse').then((response) => {
         const message = response.data.message;
        if(message===1){
          this.succ_msg='Salary has been disbursed succesfully';         
          this.show_succ_msg=true;
        }else{
          this.$router.push({ name: 'BankAccCredit' });
        }
         this.loader=false; 
      });
    },
   
  },
  mounted() {
    this.getBankInfo();
  },
};
</script>

 <style>
    .loader {
           position: absolute;
           left:50%;
           top:50%;
           transform: translate(-50%, -50%);
           border: 10px solid #f3f3f3; /* Light grey */
           border-top: 16px solid #3498db; /* Blue */
           border-radius: 50%;
           width: 75px;
           height: 75px;
           animation: spin 2s linear infinite;
       }
   
       @keyframes spin {
           0% { transform: rotate(0deg); }
           100% { transform: rotate(360deg); }
       }
   </style>
