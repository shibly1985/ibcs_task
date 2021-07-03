<template>
  <div id="navbar" >
    <nav
      id="sidebarMenu"
      class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse"
      style="background:black !important; color:white !important; "
    >
      <div class="position-sticky pt-3">
        <ul class="nav flex-column">
          <li class="nav-item" >
            <router-link
              :to="{ name: 'Home' }"
              class="nav-link active"
              aria-current="page"
              ><span data-feather="home" ></span> Dashboard</router-link
            >
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'EmployeeList' }" class="nav-link"
              ><span data-feather="user"></span> Employee List</router-link
            >
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'GradeList' }" class="nav-link"
              ><span data-feather="user"></span> Grade List</router-link
            >
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'BankAccCreate' }" class="nav-link"
              ><span data-feather="user"></span> Create Bank Account</router-link
            >
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'BankAccCredit' }" class="nav-link"
              ><span data-feather="user"></span> Credit Bank Account</router-link
            >
          </li>
           <li class="nav-item">
            <router-link :to="{ name: 'DisburseSalary' }" class="nav-link"
              ><span data-feather="user"></span> Disburse Salary</router-link
            >
          </li>
          <li class="nav-item">
            <router-link :to="{ name: 'SalarySheet' }" class="nav-link"
              ><span data-feather="user"></span> Salary Sheet Report</router-link
            >
          </li>

          <li class="nav-item">
            <a class="nav-link px-3" style="cursor: pointer" @click="logout"
            >Sign out</a>
          </li>
        </ul>
      </div>
    </nav>
  </div>
</template>

<script>
export default {
  name: 'Navbar',
  data() {
    return {
      user: null,
    };
  },
  methods: {
    logout() {
      localStorage.removeItem('login');
      this.user = null;
      this.$router.push({ name: 'Login' });
    },
  },
  created() {
    /* let login = JSON.parse(localStorage.getItem('login'));
    if (login.user) {
      this.user = login.user;
    } else {
      this.user = null;
    } */
  },
};
</script>

<style>
a {
  color:white !important;
}
</style>
