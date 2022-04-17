<template>
  <v-navigation-drawer app color="rgba(34,87,126,1)" dark>
    <v-list-item class="px-2 py-5">
      <v-list-item-title class="text-capitalize" align="center">
        <h1>Cine-App</h1>
      </v-list-item-title>
    </v-list-item>
    <v-list shaped>
      <v-list-item-group
        @change="$emit('newTab', $event)"
        v-model="selectedItem"
        color="grey lighten-5"
      >
        <v-list-item class="mt-2 mb-2" v-for="(item, i) in items" :key="i">
          <v-list-item-content>
            <v-list-item-title v-text="item.text"></v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-item-group>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
export default {
  name: "drawerleft",

  data: () => ({
    selectedItem: 0,
    items: [
      { text: "Carteleras", route: "/overview" },
      { text: "Tandas", route: "/menu" },
      {
        text: "Proximamente",
        route: "/transaction",
      },
      { text: "Promociones", route: "/calnedar" },
    ],
  }),
};
</script>