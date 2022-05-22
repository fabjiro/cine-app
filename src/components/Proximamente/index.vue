<template>
  <div class="content prox box galery" v-if="!state.request">
    <div
      v-for="(item, index) in items"
      :key="index"
      class="card box"
      @click="edit(item)"
    >
      <img :src="item.portada" />
      <div class="content">
        <span class="title">{{ item.title }}</span>
      </div>
    </div>
    <!-- <div class="btn-add" @click="modal.add = true">
      <i class="fa-solid fa-add"></i>
    </div> -->
  </div>

  <div class="content request box" v-if="state.request">
    <LoadAnimation v-if="state.status == 'none'"></LoadAnimation>
    <ErrorConection v-if="state.status == 'coneccion'"></ErrorConection>
  </div>
</template>

<script>
import axios from "../../services/axios";

import LoadAnimation from "../LoadAnimation";
import ErrorConection from "../ErrorConection.vue";
export default {
  data() {
    return {
      items: [],
      state: {
        request: true,
        status: "none",
      },
    };
  },
  methods: {
    async getProx() {
      this.state.request = true;
      let res = await axios.get("/api/proximamente");
      this.items = res.data;
      this.state.request = false;
    },
  },
  created() {
    this.getProx();
  },
  components: {
    LoadAnimation,
    ErrorConection,
  },
};
</script>

<style lang="less" scoped>
</style>