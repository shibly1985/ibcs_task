<template>
  <div id="employee-list">
    <Header />

    <div class="container-fluid">
      <div class="row">
        <Navbar />

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
          >
            <h1 class="h2">Employee List</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <router-link
                :to="{ name: 'EmployeeAdd' }"
                class="btn btn-success btn-sm"
                ><span data-feather="plus"></span> Add New Employee</router-link
              >
            </div>
          </div>
          <div class="table-responsive">
            <table class="table table-border table-sm">
              <thead>
                <tr>
                 
                  <th scope="col">Employee ID</th>
                  <th scope="col">Employee Name</th>                  
                  <th scope="col">Mobile</th>
                   <th scope="col">Rank</th>
                  <th scope="col">Grade</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="employee in employees" :key="employee.id">
                  
                  <td>{{ employee.id }}</td>
                  <td>{{ employee.name }}</td>                  
                  <td>{{ employee.mobile }}</td>
                  <td>{{ employee.rank }}</td>
                  <td>{{ employee.grade_name }}</td>
                  <td>
                    <div class="btn-group" role="group">
                      <router-link
                        :to="{
                          name: 'EmployeeSalarySheet',
                          params: { id: employee.emp_id },
                        }"
                        class="btn btn-info btn-sm"
                        target="_blank"
                        title="Print Salary Sheet"
                        >Print</router-link
                      >
                      <router-link
                        :to="{
                          name: 'EmployeeEdit',
                          params: { id: employee.emp_id },
                        }"
                        class="btn btn-success btn-sm"
                        >Edit</router-link
                      >
                      <button
                        class="btn btn-danger btn-sm"
                        @click="deleteEmployee(employee.emp_id)"                        
                      >
                        Delete
                      </button>
                      
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header';
import Navbar from '@/components/Navbar';

export default {
  name: 'EmployeeList',
  data() {
    return {
      employees: [],
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    getEmployees() {
      this.$http.get('api/get_employee').then((response) => {
      console.log(response);
        this.employees = response.data.data;
      });
    },
    deleteEmployee(id) {
      this.$http.get(`api/delete_employee/${id}`).then((response) => {
        console.log(response);
        let i = this.employees.map((data) => data.id).indexOf(id);
        this.employees.splice(i, 1);
      });
    },
   
  },
  created() {
    this.getEmployees();
  },
};
</script>

<style></style>
