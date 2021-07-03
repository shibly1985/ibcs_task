<template>
  <div id="login">
    <section class="ftco-section">
    <div class="container">			
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <div class="icon d-flex align-items-center justify-content-center">
                        <span class="fa fa-user-o"></span>
                    </div>
                    <h3 class="text-center mb-4">Login Panel</h3>
                    <form @submit.prevent="login">
                        <div class="form-group">
                            <input
                              type="email"
                              name="email"
                              v-model="email"
                              class="form-control"
                              id="floatingInput"
                              placeholder="name@example.com"
                            />
                        </div>
                        <div class="form-group d-flex">
                             <input
                                type="password"
                                name="password"
                                v-model="password"
                                class="form-control"
                                id="floatingPassword"
                                placeholder="Password"
                              />
                        </div>
                        <div class="form-group d-md-flex">
                            <div class="w-50">
                                <label class="checkbox-wrap checkbox-primary">Remember Me
                                    <input type="checkbox" checked>
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <div class="w-50 text-md-right">
                                <a href="#">Forgot Password</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary rounded submit p-3 px-5">Login</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>
  </div>  
</template>

<script>
export default {
  name: 'Login',
  data() {
    return {
      email: null,
      password: null,
      feedback: null,
    };
  },
  methods: {
    login() {
      if (this.email && this.password) {
        this.$http
          .post('api/login', {
            email: this.email,
            password: this.password,
          })
          .then((response) => {
            this.feedback = null;
            let login = JSON.stringify(response.data);
            localStorage.setItem('login', login);
            this.$router.push({ name: 'Home' });
          })
          .catch((error) => {
            this.feedback = error.message;
          });
      } else {
        this.feedback = 'Please fill in both fields';
      }
    },
  },
};
</script>

<style>
.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}

html,
body {
  height: 100%;
}

body {
  /* display: flex; */
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #17a2b8;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type='email'] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type='password'] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
