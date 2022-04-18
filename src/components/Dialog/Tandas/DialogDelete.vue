<template>
  <v-dialog v-model="dialog" width="500">
    <v-card :loading="isload" :disabled="isload">
      <v-card-title class="text-h5 grey lighten-4">
        Eliminar este elemento
      </v-card-title>
      <v-divider></v-divider>

      <v-card-actions class="grey lighten-5">
        <v-spacer></v-spacer>
        <v-btn color="error" text @click="cancel()"> Cancelar </v-btn>
        <v-btn color="primary" @click="$emit('deleted')" text> Aceptar </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: ["dialog", "cancel", "isload"],
};
</script>

<style lang="scss" scoped>
</style>