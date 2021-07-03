<template>
  <div class="user container">
    <table class="striped responsive-table">
      <thead>
        <tr>
          <th>SL</th>
          <th>Name</th>
          <th>Email</th>
          <th>Actions</th>
        </tr>
      </thead>

      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.email }}</td>
          <td>
            <router-link
              :to="{ name: 'UserEdit', params: { id: user.id } }"
              class="btn btn-primary"
              ><i class="material-icons">edit</i></router-link
            >
            <button class="btn btn-danger" v-on:click="deleteItem(user.id)">
              <i class="material-icons">delete</i>
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'User',
  data() {
    return {
      users: [],
    };
  },
  methods: {
    fetchItems() {
      let login = JSON.parse(localStorage.getItem('login'));
      let uri =
        'http://localhost/github.com/mosarrafhosain/lumen8x-rest-api-jwt-acl/api/users';
      axios
        .get(uri, {
          headers: {
            Authorization: `Bearer ${login.token}`,
          },
        })
        .then((response) => {
          this.users = response.data.data;
        });
    },
    deleteItem(id) {
      let uri = 'http://localhost:4000/items/delete/' + id;
      this.items.splice(id, 1);
      this.axios.get(uri);
    },
  },
  created: function() {
    this.fetchItems();
  },
};
</script>

<style></style>
