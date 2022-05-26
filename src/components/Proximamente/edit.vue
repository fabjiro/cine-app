<template>
  <div class="modal">
    <div class="content box">
      <div class="header">
        <h2>Editar Proximamente</h2>
        <i @click="$emit('onClose')" class="fa-solid fa-close close"></i>
      </div>
      <div class="cont"></div>
      <div class="actions">
        <input
          @click="del"
          type="button"
          value="Eliminar"
          class="btn btn-del"
        />
        <input type="button" value="Editar" class="btn btn-add" />
      </div>

      <LoadAnimation v-if="state.request"></LoadAnimation>
    </div>
  </div>
</template>

<script>
import axios from "../../services/axios";

import LoadAnimation from "../LoadAnimation.vue";

export default {
  emits: ["onClose"],
  props: ["item"],
  data() {
    return {
      state: {
        request: false,
      },
    };
  },
  methods: {
    async del() {
      this.state.request = true;
      if (confirm("Desea eliminar? ")) {
        await axios.delete("/api/proximamente/" + this.item.id);
        this.$emit("onClose");
        this.state.request = false;
      }
    },
  },
  components: {
    LoadAnimation,
  },
};
</script>

<style lang="less" scoped>
@import "../../styles/Proximamente/edit";
</style>