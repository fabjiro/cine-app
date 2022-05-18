<template>
  <div class="sidebar">
    <h1>Cine app</h1>
    <div
      class="item-side"
      :class="index == 1 ? 'active' : ''"
      @click="onTap(1)"
    >
      <i class="fa-solid fa-clapperboard"></i>
      <span>Tandas</span>
    </div>
    <div
      class="item-side"
      :class="index == 2 ? 'active' : ''"
      @click="onTap(2)"
    >
      <i class="fa-solid fa-forward"></i>
      <span>Proximamente</span>
    </div>
    <div
      class="item-side"
      :class="index == 3 ? 'active' : ''"
      @click="onTap(3)"
    >
      <i class="fa-solid fa-heart"></i>
      <span>Promociones</span>
    </div>
  </div>
</template>

<script>
export default {
  emits: ["onTap"],
  data: () => {
    return {
      index: 1,
    };
  },
  methods: {
    onTap(index) {
      if (this.index != index) {
        this.index = index;
        this.$emit("onTap", index);
      }
    },
  },
};
</script>

<style lang="less" scoped>
@import "../styles/SideBar";
</style>