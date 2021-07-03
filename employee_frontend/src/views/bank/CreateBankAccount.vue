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
            <h1 class="h2">Create Bank Account</h1>
          </div>
          <div class="row">
            <div class="col-md-12">
            <div class="alert alert-success" v-if="show_succ_msg">
                {{succ_msg}}
              </div>
              <form
                @submit.prevent="createBankAccount"
                class="row g-3 needs-validation"
                novalidate
              >
                <div class="col-md-4">
                  <label for="grade_id" class="form-label"><strong>Company ID</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="company_id"
                    v-model="bank_acc.company_id"
                  />
                </div>
                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Received Ammount</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="rcv_ammount"
                    v-model="bank_acc.rcv_ammount"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Bank Name</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="bank_name"
                    v-model="bank_acc.bank_name"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Branch Name</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="branch_name"
                    v-model="bank_acc.branch_name"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Account Name</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="account_name"
                    v-model="bank_acc.account_name"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Account Type</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="account_type"
                    v-model="bank_acc.account_type"
                  />
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Account Number</strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="account_number"
                    v-model="bank_acc.account_number"
                  />
                </div>

                <div class="col-12">
                  <button class="btn btn-success" type="submit">
                    Store Data
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
  name: 'CreateBankAccount',
  data() {
    return {
      loader:false,
      show_succ_msg:false,
      bank_acc: {
        company_id: '',
        rcv_ammount: '',
        bank_name: '',
        branch_name: '',
        account_name: '',
        account_type: '',
        account_number: '',
      },
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    createBankAccount() {
      this.loader=true;
      this.$http
        .post('api/create_company_account', this.bank_acc)
        .then((response) => {
          console.log(response);
           this.succ_msg='Bank account has been created succesfully.';
           this.show_succ_msg=true;
          this.loader=false;
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
