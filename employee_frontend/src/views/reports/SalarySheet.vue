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
            <h1 class="h2">Salary Report</h1>
          </div>
          <div class="row">
            <div class="col-md-12">
             <div class="table-responsive">          
                <table class="table table-border">
                    <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Name</th>
                        <th>Address</th>
                        <th>Phone</th>
                        <th>Grade</th>
                        <th>Basic Salary</th>
                        <th>Gross Salary</th>
                    </tr>
                    </thead>
                    <tbody>
                   <tr v-for="data in salary_data" :key="data.id">
                        <td>{{ data.employee_id }}</td>
                        <td>{{ data.name }}</td>
                        <td>{{ data.address }}</td>
                        <td>{{ data.mobile }}</td>
                        <td>{{ data.grade_name }}</td>
                        <td>{{ data.basic_salary }}</td>
                        <td>{{ data.gross_salary }}</td>
                    </tr>
                    </tbody>
                </table>
                </div>
            </div>
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
  name: 'SalarySheet',
  data() {
    return {
      salary_data: [],      
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    getReportData() {
      this.$http.get('api/salary_sheet_report').then((response) => {
        //console.log(response);
        this.salary_data = response.data.data;
      });
    },
   
  },
  created() {
    this.getReportData();
  },
};
</script>

<style></style>
