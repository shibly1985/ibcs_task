<template>
  <div class="user-edit container">
    <form @submit.prevent="updateUser" class="card-panel">
      <h2 class="center deep-purple-text">User Edit</h2>
      <div class="field">
        <label for="name">Name:</label>
        <input type="text" name="name" v-model="user.name" />
      </div>
      <div class="field">
        <label for="email">Email:</label>
        <input type="email" name="email" v-model="user.email" />
      </div>
      <p class="red-text center" v-if="feedback">{{ feedback }}</p>
      <div class="field center">
        <button class="btn deep-purple">Edit</button>
      </div>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'UserEdit',
  data() {
    return {
      user: {},
      feedback: null,
    };
  },
  methods: {
    getUser() {
      let login = JSON.parse(localStorage.getItem('login'));
      let uri =
        'http://localhost/github.com/mosarrafhosain/lumen8x-rest-api-jwt-acl/api/users/' +
        this.$route.params.id +
        '/edit';
      axios
        .get(uri, {
          headers: {
            Authorization: `Bearer ${login.token}`,
          },
        })
        .then((response) => {
          this.user = response.data.data.user;
        });
    },

    updateUser() {
      let login = JSON.parse(localStorage.getItem('login'));
      let uri =
        'http://localhost/github.com/mosarrafhosain/lumen8x-rest-api-jwt-acl/api/users/' +
        this.$route.params.id;
      axios
        .put(uri, this.user, {
          headers: {
            Authorization: `Bearer ${login.token}`,
          },
        })
        .then((response) => {
          if (response.data.error) {
            console.log(response.data.message);
          } else {
            this.$router.push({ name: 'User' });
          }
        });
    },
  },
  created: function() {
    this.getUser();
  },
};
</script>

<style>
.user-edit {
  max-width: 400px;
  margin-top: 60px;
}
.user-edit h2 {
  font-size: 2.4em;
}
.user-edit .field {
  margin-bottom: 16px;
}
</style>
