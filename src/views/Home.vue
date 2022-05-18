<template>
  <div class="container">
    <SideBar @onTap="onTab"></SideBar>
    <SearchBar></SearchBar>
    <Tandas v-if="state.tab == 1"></Tandas>
  </div>
</template>

<script>
import SideBar from "../components/SideBar.vue";
import SearchBar from "../components/SearchBar.vue";
import Tandas from "../components/Tandas/index.vue";

export default {
  name: "home",
  data: () => {
    return {
      state: {
        tab: 1,
      },
    };
  },
  methods: {
    onTab(index) {
      this.state.tab = index;
    },
  },
  components: {
    SideBar,
    SearchBar,
    Tandas,
  },
};
</script>

<style lang="less">
@import "../styles/Home";
</style>