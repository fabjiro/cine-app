<template>
  <v-app>
    <v-container fill-height fluid>
      <v-row justify="center" align="center">
        <v-col cols="7" sm="5" md="4" lg="3">
          <v-card elevation="5" :disabled="loadRequest" class="rounded-lg">
            <v-card-text>
              <h1 class="mb-6 text-center">Login</h1>
              <v-text-field v-model="form.user" label="Usuario" outlined>
              </v-text-field>
              <v-text-field
                v-model="form.password"
                type="password"
                label="Password"
                outlined
              >
              </v-text-field>
              <v-btn
                block
                class="mr-4"
                color="primary"
                :loading="loadRequest"
                @click="login()"
                >Login</v-btn
              >
            </v-card-text>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
  </v-app>
</template>


<script>
import axios from "../services/axios";
export default {
  data: () => {
    return {
      loadRequest: false,
      form: {
        user: null,
        password: null,
      },
    };
  },
  methods: {
    login() {
      this.loadRequest = true;
      this.requestform = true;
      axios.post("/api/useradmin/login", this.form).then((res) => {
        this.loadRequest = false;
        this.requestform = false;
        if (res.data["status"] == 200) {
          console.log("accedio perfectamente");
        }
      });
    },
  },
};
</script>