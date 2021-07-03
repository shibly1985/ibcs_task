<template>
  <div class="navbar">
    <div class="navbar-fixed">
      <nav class="deep-purple darken-1">
        <div class="container">
          <router-link :to="{ name: 'Home' }" class="brand-logo left"
            >Mh App</router-link
          >
          <ul class="right">
            <li><router-link :to="{ name: 'User' }">User</router-link></li>
            <li>
              <router-link :to="{ name: 'Profile' }">{{
                user.name
              }}</router-link>
            </li>
            <li><a @click="logout">Logout</a></li>
          </ul>
        </div>
      </nav>
    </div>
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
