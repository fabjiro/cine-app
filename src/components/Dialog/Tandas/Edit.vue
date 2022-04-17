<template>
  <v-dialog v-model="dialog" max-width="800px" persistent>
    <v-card :loading="isload" :disabled="isload">
      <v-card-title>
        Editar tanda
        <span class="primary--text h5"> ({{ item.title }})</span>
      </v-card-title>
      <v-divider></v-divider>
      <v-sheet height="5px"></v-sheet>
      <v-card-text>
        <v-container fluid>
          <v-form ref="form" v-model="form" lazy-validation>
            <v-row class="dark--text pl-2">
              <v-col cols="3">
                <v-switch
                  v-model="edititem.estreno"
                  inset
                  label="Estreno"
                ></v-switch>
              </v-col>
              <v-col cols="3">
                <v-switch
                  v-model="edititem.doblada"
                  inset
                  label="Doblada"
                ></v-switch>
              </v-col>
            </v-row>
            <v-sheet height="5px"></v-sheet>

            <v-text-field
              required
              outlined
              label="Title"
              v-model="edititem.title"
            ></v-text-field>

            <v-text-field
              required
              outlined
              label="Trailer"
              v-model="edititem.ytlink"
            ></v-text-field>

            <v-textarea
              required
              outlined
              label="Descripcion"
              v-model="edititem.description"
            ></v-textarea>
          </v-form>
        </v-container>
      </v-card-text>
      <v-card-actions>
        <v-spacer></v-spacer>
        <v-btn color="error" @click="$emit('cancel')"> Cancelar </v-btn>
        <v-btn color="primary"> Guardar </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ["dialog", "isload", "item"],
  data: () => {
    return {
      edititem: "",
      form: true,
      edititem: "",
    };
  },
  created() {
    this.edititem = Object.assign({}, this.item);
    console.log(this.item);
  },
};
</script>