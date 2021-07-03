<template>
  <div id="grade-list">
    <Header />

    <div class="container-fluid">
      <div class="row">
        <Navbar />

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
          >
            <h1 class="h2">Grade List</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <router-link
                :to="{ name: 'GradeAdd' }"
                class="btn btn-success btn-sm"
                ><span data-feather="plus"></span> Add New Grade</router-link
              >
            </div>
          </div>
          <div class="table-responsive">
            <table class="table table-border table-sm">
              <thead>
                <tr>
                  
                  <th scope="col">Grade Name</th>
                  <th scope="col">Rank</th>
                  <th scope="col">Basic Salary</th>
                  <th scope="col">Gross Salary</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="grade in grades" :key="grade.id">
                 
                  <td>{{ grade.grade_name }}</td>
                   <td>{{ grade.rank }}</td>
                  <td>{{ grade.basic_salary }}</td>
                   <td>{{ grade.gross_salary }}</td>
                  <td>
                    <div class="btn-group" role="group">
                      <router-link
                        :to="{
                          name: 'GradeEdit',
                          params: { id: grade.grade_id },
                        }"
                        class="btn btn-success btn-sm"
                        ><i class="fa fa-edit"></i>Edit</router-link
                      >
                      <button
                        class="btn btn-danger btn-sm"
                        @click="deleteGrade(grade.grade_id)"
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
  name: 'GradeList',
  data() {
    return {
      grades: [],
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
    deleteGrade(id) {
      this.$http.get(`api/delete_grade/${id}`).then((response) => {
        console.log(response);
        let i = this.grades.map((data) => data.id).indexOf(id);
        this.grades.splice(i, 1);
      });
    },
  },
  created() {
    this.getGrades();
  },
};
</script>

<style></style>
