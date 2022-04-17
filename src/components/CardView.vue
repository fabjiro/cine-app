<template>
  <v-col cols="12" sm="4" md="4">
    <v-hover v-slot="{ hover }" open-delay="200">
      <v-card :color="color" :elevation="hover ? 10 : 2">
        <v-app-bar flat color="rgba(0,0,0,0)">
          <v-chip class="ma-2" color="black" text-color="white" dense>
            <h4>{{ item.title }}</h4>
          </v-chip>
          <v-spacer></v-spacer>
          <v-chip
            class="ma-2"
            color="red"
            text-color="white"
            dense
            v-if="item.estreno"
          >
            <h5>Estreno</h5>
          </v-chip>
        </v-app-bar>

        <v-container
          class="d-flex flex-column justify-space-between align-center"
        >
          <v-img
            :src="item.portada"
            max-height="180"
            max-width="180"
            id="rounded_img"
          ></v-img>
        </v-container>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="red lighten-2"
            rounded
            @click="$emit('deleted', item.id)"
          >
            <v-icon color="white">mdi-delete </v-icon>
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-hover>
  </v-col>
</template>

<script>
export default {
  props: ["color", "item"],
};
</script>

<style scoped>
#rounded_img {
  border-radius: 6px;
}
</style>