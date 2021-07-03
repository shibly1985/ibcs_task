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
            <h1 class="h2">Credit Account</h1>
          </div>
          <div class="row">
          <div class="alert alert-success" v-if="show_succ_msg">
                {{succ_msg}}
              </div>
            <div class="col-md-12">
              <form
                @submit.prevent="CreditBankAccount"
                class="row g-3 needs-validation"
                novalidate
              >
                <div class="col-md-4">
                  <label for="grade_id" class="form-label"><strong>Ammount </strong></label>
                  <input
                    type="text"
                    class="form-control"
                    id="rcv_ammount"
                    v-model="bank_acc.rcv_ammount"
                  />
                </div>
                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Bank Name</strong></label>                

                  <select
                    class="form-select"
                    id="bank_name"
                    v-model="bank_acc.bank_name"
                  >
                    <option selected disabled value="">Choose...</option>
                    <option
                      v-for="dt in bank_info"
                      :key="dt.bank_name"
                      :value="dt.bank_name"
                      >{{ dt.bank_name }}</option
                    >
                  </select>

                  
                </div>

                <div class="col-md-4">
                  <label for="address" class="form-label"><strong>Account Number</strong></label>
                  
                  <select
                    class="form-select"
                    id="account_number"
                    v-model="bank_acc.account_number"
                  >
                    <option selected disabled value="">Choose...</option>
                    <option
                      v-for="dts in bank_info"
                      :key="dts.account_number"
                      :value="dts.account_number"
                      >{{ dts.account_number }}</option
                    >
                  </select>
                </div>
                <div class="col-12">
                  <button class="btn btn-success" type="submit">
                    Credit Account
                  </button>
                </div>
              </form>
            </div>
          </div>           
        </main>       
      </div>
      <div class="loader" v-if="loader"></div>
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
       bank_info: [],
      bank_acc: {
        rcv_ammount: '',
        bank_name: '',
        account_number: '',
      },
    };
  },
  components: {
    Header,
    Navbar,
  },
  methods: {
    getBankInfo() {
      this.$http.get('api/get_bank_info').then((response) => {
        console.log(response);
        this.bank_info = response.data.data;
      });
    },
    CreditBankAccount() {
      this.loader=true;
      this.$http
        .post('api/credit_bank_account', this.bank_acc)
        .then((response) => {
          console.log(response);
          this.succ_msg='Credit transfer has succesfully done.';
           this.show_succ_msg=true;
          this.loader=false;
        })
        .catch((err) => console.log(err))
        .finally(() => (this.loading = false));
    },
  },
  created() {
    this.getBankInfo();
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
