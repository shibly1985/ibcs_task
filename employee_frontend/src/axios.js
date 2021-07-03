import axios from 'axios';
let token = '';
let login = JSON.parse(localStorage.getItem('login'));
if (login) {
  token = login.token;
}
axios.defaults.baseURL = 'http://localhost/api_laravel_jwt/public/'
axios.defaults.headers.common = {'Authorization': `Bearer ${token}`}
export default axios;
