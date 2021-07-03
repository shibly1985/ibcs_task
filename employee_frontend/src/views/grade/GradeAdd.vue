<template>
  <div id="grade-add">
    <Header />

    <div class="container-fluid">
      <div class="row">
        <Navbar />

        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
          <div
            class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom"
          >
            <h1 class="h2">Create Grade</h1>
          </div>
          <div class="row">
          
            <div class="col-md-12">
              <form
                @submit.prevent="addGrade"
                class="row g-3 needs-validation"
                novalidate
              >
                <div class="col-md-4">
                  <label for="grade_id" class="form-label">Grade Name</label>
                  <input
                    type="text"
                    class="form-control"
                    id="grade_name"
                    v-model="grade.grade_name"
                  />
                </div>
                <div class="col-md-4">
                  <label for="address" class="form-label">Rank</label>
                  <input
                    type="text"
                    class="form-control"
                    id="rank"
                    v-model="grade.rank"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label">Salary</label>
                  <input
                    type="text"
                    class="form-control"
                    id="salary"
                    v-model="grade.salary"
                  />
                </div>

                <div class="col-12">
                  <button class="btn btn-success" type="submit">
                    Submit
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
  name: 'GradeAdd',
  data() {
    return {
      loader: false,
      grade: {
        grade_name: '',
        rank: '',
        salary: '',
      },
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    addGrade() {
      this.loader=true;
      this.$http
        .post('api/create_grade', this.grade)
        .then((response) => {
          console.log(response);
          this.loader=false;
          this.$router.push({ name: 'GradeList' });
        })
        .catch((err) => console.log(err))
        .finally(() => (this.loading = false));
    },
  },
  created() {
    //
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
