<template>
  <v-container>
    <v-toolbar flat>
      <v-text-field
        label="Buscar"
        filled
        rounded
        dense
        solo
        flat
        background-color="grey lighten-3"
        v-model="value"
      ></v-text-field>
    </v-toolbar>
  </v-container>
</template>

<script>
export default {
  props: ["value"],
};
</script>