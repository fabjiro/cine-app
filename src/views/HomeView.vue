<template>
  <v-app id="inspire">
    <DrawerLeft @newTab="state.currentTab = $event"></DrawerLeft>
    <v-main>
      <SearchBar :value="searchValue"></SearchBar>
      <v-sheet height="5px"></v-sheet>
      <Tandas v-if="state.currentTab == 1"></Tandas>
    </v-main>
  </v-app>
</template>

<script>
import DrawerLeft from "../components/DrawerLeft.vue";
import SearchBar from "../components/SearchBar";
import Tandas from "../components/Tabs/Tandas";

export default {
  data: () => {
    return {
      searchValue: "",
      state: {
        currentTab: 0,
      },
    };
  },
  methods: {},
  components: {
    DrawerLeft,
    SearchBar,
    Tandas,
  },
};
</script>

