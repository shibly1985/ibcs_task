import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/auth/Login.vue')
  },
  {
    path: '/forgot-password',
    name: 'ForgotPassword',
    component: () => import('../views/auth/ForgotPassword.vue')
  },
  {
    path: '/profile',
    name: 'Profile',
    component: () => import('../views/Profile.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/user',
    name: 'User',
    component: () => import('../views/user/Index.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/user/edit/:id',
    name: 'UserEdit',
    component: () => import('../views/user/Edit.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/employees',
    name: 'EmployeeList',
    component: () => import('../views/employee/EmployeeList.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/employees/create',
    name: 'EmployeeAdd',
    component: () => import('../views/employee/EmployeeAdd.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/employees/edit/:id',
    name: 'EmployeeEdit',
    component: () => import('../views/employee/EmployeeEdit.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/grades',
    name: 'GradeList',
    component: () => import('../views/grade/GradeList.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/grades/create',
    name: 'GradeAdd',
    component: () => import('../views/grade/GradeAdd.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/grades/edit/:id',
    name: 'GradeEdit',
    component: () => import('../views/grade/GradeEdit.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/disburse_salary',
    name: 'DisburseSalary',
    component: () => import('../views/salary/DisburseSalary.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/salary_sheet',
    name: 'SalarySheet',
    component: () => import('../views/reports/SalarySheet.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/create_bank_account',
    name: 'BankAccCreate',
    component: () => import('../views/bank/CreateBankAccount.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/credit_bank_account',
    name: 'BankAccCredit',
    component: () => import('../views/bank/CreditBankAccount.vue'),
    meta: {
      requiresAuth: true
    }
  },
  {
    path: '/employees/salary-sheet/:id',
    name: 'EmployeeSalarySheet',
    component: () => import('../views/employee/EmployeeSalarySheet.vue'),
    meta: {
      requiresAuth: true
    }
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

router.beforeEach((to, from, next) => {
  // check to see if route requires auth
  if (to.matched.some(rec => rec.meta.requiresAuth)) {
    // check auth state of user
    let login = localStorage.getItem("login");
    if (login) {
      // user signed in, proceed to route
      next()
    } else {
      // no user signed in, redirect to login
      next({ name: 'Login' })
    }
  } else {
    next()
  }
})

export default router
