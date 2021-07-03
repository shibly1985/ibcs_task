<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App',
  data() {
    return {
      user: null,
    };
  },
  components: {
    //
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

<style></style>
