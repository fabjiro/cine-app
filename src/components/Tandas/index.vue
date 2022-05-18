<template>
  <div class="content tandas box" v-if="!state.request">
    <div v-for="(item, index) in items" :key="index" class="card box">
      <img :src="item.portada" />
      <div class="content">
        <span class="title">{{ item.title }}</span>
      </div>
    </div>
    <div class="btn-add" @click="modal.add = true">
      <i class="fa-solid fa-add"></i>
    </div>
  </div>

  <div class="content request box" v-if="state.request">
    <LoadAnimation v-if="state.status == 'none'"></LoadAnimation>
    <ErrorConection v-if="state.status == 'coneccion'"></ErrorConection>
  </div>

  <ModalAdd
    @added="added"
    @close="modal.add = false"
    v-if="modal.add"
  ></ModalAdd>
</template>
<script>
import axios from "../../services/axios";
import LoadAnimation from "../LoadAnimation";
import ErrorConection from "../ErrorConection";
import ModalAdd from "../Tandas/add";

export default {
  data: () => {
    return {
      items: [],
      modal: {
        add: false,
      },
      state: {
        request: true,
        status: "none",
      },
    };
  },
  methods: {
    added() {
      this.modal.add = false;
      this.getTandas();
    },
    async getTandas() {
      try {
        this.state.request = true;
        let res = await axios.get("/api/tandas");
        this.items = res.data;
        this.state.request = false;
      } catch (error) {
        if (error.code == "ERR_NETWORK") {
          this.state.status = "coneccion";
        }
      }
    },
  },
  created() {
    this.getTandas();
  },
  components: {
    LoadAnimation,
    ErrorConection,
    ModalAdd,
  },
};
</script>
<style lang="less" scoped>
@import "../../styles/Tandas";
</style>