<template>
  <div id="header">
    <header
      class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow"
    >
      <router-link
        :to="{ name: 'Home' }"
        class="navbar-brand col-md-3 col-lg-2 me-0 px-3"
        >Employee Salary</router-link
      >
      <button
        class="navbar-toggler position-absolute d-md-none collapsed"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#sidebarMenu"
        aria-controls="sidebarMenu"
        aria-expanded="false"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon"></span>
      </button>
      
      
    </header>
  </div>
</template>

<script>
export default {
  name: 'Header',
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
    let login = JSON.parse(localStorage.getItem('login'));
    if (login.user) {
      this.user = login.user;
    } else {
      this.user = null;
    }
  },
};
</script>

<style></style>
