<template>
  <v-dialog v-model="dialog" max-width="800px" persistent>
    <v-card :loading="state.request" :disabled="state.request">
      <v-card-title> Anadir tandas</v-card-title>
      <v-divider></v-divider>
      <v-sheet height="5px"></v-sheet>
      <v-card-text>
        <v-stepper v-model="e1">
          <v-stepper-header>
            <v-stepper-step :complete="e1 > 1" step="1">
              Datos de la tanda
            </v-stepper-step>
            <v-divider></v-divider>
            <v-stepper-step :complete="e1 > 2" step="2">
              Media de la tanda
            </v-stepper-step>
          </v-stepper-header>

          <v-stepper-items>
            <v-stepper-content step="1">
              <v-card class="pa-2">
                <v-form ref="form" v-model="validate.form1" lazy-validation>
                  <v-row class="dark--text pl-2">
                    <v-col cols="3">
                      <v-switch
                        v-model="form.estreno"
                        inset
                        label="Estreno"
                      ></v-switch>
                    </v-col>
                    <v-col cols="3">
                      <v-switch
                        v-model="form.doblada"
                        inset
                        label="Doblada"
                      ></v-switch>
                    </v-col>
                  </v-row>
                  <v-divider></v-divider>
                  <v-sheet height="10px"></v-sheet>
                  <v-text-field
                    :rules="reglas"
                    required
                    outlined
                    label="Titulo"
                    v-model="form.title"
                  ></v-text-field>
                  <v-textarea
                    :rules="reglas"
                    required
                    outlined
                    label="Descripcion"
                    v-model="form.descripcion"
                  ></v-textarea>
                </v-form>
              </v-card>
              <v-row class="pa-6">
                <v-btn class="mr-2" color="primary" @click="btn">
                  Siguiente
                </v-btn>
                <v-btn @click="cancel" text> Cancel </v-btn>
              </v-row>
            </v-stepper-content>

            <v-stepper-content step="2">
              <v-card>
                <v-form ref="form2" v-model="validate.form2" lazy-validation>
                  <v-text-field
                    :rules="reglas"
                    required
                    outlined
                    label="Trailer"
                    v-model="form.trailer"
                  ></v-text-field>
                  <v-file-input
                    @change="getimage"
                    label="Portada"
                    outlined
                    dense
                    accept="image/png"
                    :rules="reglas"
                  ></v-file-input>
                </v-form>
              </v-card>
              <v-sheet height="10px"></v-sheet>
              <v-row class="pa-4">
                <v-btn class="mr-2" color="primary" @click="guardar">
                  Guardar
                </v-btn>
                <v-btn text @click="cancel"> Cancel </v-btn>
                <v-spacer></v-spacer>
                <v-btn color="primary" text @click="btn"> Atras </v-btn>
              </v-row>
            </v-stepper-content>
          </v-stepper-items>
        </v-stepper>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
import axios from "../../../services/axios";

export default {
  data: () => {
    return {
      e1: 1,
      state: {
        request: false,
      },
      validate: {
        form1: true,
        form2: true,
      },
      form: {
        title: "",
        descripcion: "",
        estreno: false,
        doblada: true,
        trailer: "",
        portada: "",
      },

      reglas: [(v) => !!v || "Este dato es requerido"],
    };
  },
  props: ["dialog"],
  methods: {
    async guardar() {
      if (this.$refs.form2.validate()) {
        let form = new FormData();

        form.append("title", this.form.title);
        form.append("description", this.form.descripcion);
        form.append("estreno", this.form.estreno);
        form.append("trailer", this.form.trailer);
        form.append("doblada", this.form.doblada);
        form.append("portada", this.form.portada);

        this.state.request = true;
        let res = await axios.post("/api/tandas", form);
        this.state.request = false;

        if (res.data["status"] == 200) {
          this.$emit("done");
        }
      }
    },
    cancel() {
      this.$emit("cancel");
    },
    getimage(e) {
      this.form.portada = e;
    },
    btn() {
      if (this.$refs.form.validate()) {
        if (this.e1 == 1) {
          this.e1 = 2;
        } else {
          this.e1 = 1;
        }
      }
    },
  },
};
</script>

<style lang="scss" scoped>
</style>