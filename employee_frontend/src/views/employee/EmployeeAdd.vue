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
            <h1 class="h2">Create New Employee </h1>
          </div>
          <div class="row">
            <div class="col-md-12">
              <form
                @submit.prevent="addEmployee"
                class="row g-3 needs-validation"
                novalidate
              >
                <div class="col-md-6">


                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Employee name</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="name"
                      v-model="employee.name"
                    />
                  </div>

                <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Employee Address</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="address"
                      v-model="employee.address"
                    />
                  </div>

                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Mobile</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="mobile"
                      v-model="employee.mobile"
                    />
                  </div>

                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Bank Name</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="bank_name"
                      v-model="employee.bank_name"
                    />
                  </div>

                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Branch Name</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="branch_name"
                      v-model="employee.branch_name"
                    />
                  </div>



                </div>

                <div class="col-md-6">
                
                <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Account name</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="account_name"
                      v-model="employee.account_name"
                    />
                  </div>

                <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Account Type</strong></label
                    >
                   <select
                    class="form-select"
                    id="account_type"
                    v-model="employee.account_type"
                  >
                    <option selected disabled value="">Choose...</option>
                    <option value="savings">Savings</option>
                    <option value="current">Current</option>
                  </select>
                  </div>

                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Account Number</strong></label
                    >
                    <input
                      type="text"
                      class="form-control"
                      id="account_number"
                      v-model="employee.account_number"
                    />
                  </div>

                  <div class="col-md-12">
                    <label for="employee_id" class="form-label"><strong>Grade</strong></label
                    >
                    <select
                    class="form-select"
                    id="grade_id"
                    v-model="employee.grade_id"
                  >
                    <option selected disabled value="">Choose...</option>
                    <option
                      v-for="grade in grades"
                      :key="grade.grade_id"
                      :value="grade.grade_id"
                      >{{ grade.grade_name }}</option
                    >
                  </select>
                  </div>
                
                
                </div>
                <div class="col-12">
                  <button class="btn btn-success" type="submit">
                    Store New Employee
                  </button>
                </div>
              </form>
            </div>
            
          </div>
           <div class="loader" v-if="loader"></div>
        </main>
      
      </div>
    </div>
  
  </div>
  
</template>

<script>
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';

export default {
  name: 'EmployeeAdd',
  data() {
    return {
      loader:false,
      grades: [],
      employee: {
        name: '',
        address: '',
        mobile: '',
        bank_name: '',
        branch_name: '',
        account_name: '',
        account_type: '',
        account_number: '',
        grade_id: '',
      },
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    getGrades() {
      this.$http.get('api/get_grades').then((response) => {
        this.grades = response.data.data;
      });
    },
    addEmployee() {
      this.loader=true;
      this.$http
        .post('api/create_employee', this.employee)
        .then((response) => {
          console.log(response);
          this.loader=false;
          this.$router.push({ name: 'EmployeeList' });
        })
        .catch((err) => console.log(err))
        .finally(() => (this.loading = false));
    },
  },
  created() {
    this.getGrades();
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
