<template>
  <v-dialog v-model="dialog" max-width="800px" persistent>
    <v-card :loading="isload" :disabled="isload">
      <v-card-title> Editar tandas</v-card-title>
      <v-divider></v-divider>
      <v-sheet height="5px"></v-sheet>
      <v-card-text>
        <v-container fluid></v-container>
        <v-form ref="form" v-model="form" lazy-validation>
          <v-text-field required outlined label="Trailer"></v-text-field>
        </v-form>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  data: () => {
    return {
      form: true,
    };
  },
  props: ["dialog", "isload"],
};
</script>