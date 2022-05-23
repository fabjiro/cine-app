<template>
  <div class="content tandas box galery" v-if="!state.request">
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
    <div class="float-btn-add" @click="modal.add = true">
      <i class="fa-solid fa-add"></i>
    </div>
  </div>

  <div class="content request box" v-if="state.request">
    <LoadAnimation v-if="state.status == 'none'"></LoadAnimation>
    <ErrorConection v-if="state.status == 'coneccion'"></ErrorConection>
  </div>

  <ModalAdd
    @added="modal.add = false"
    @close="modal.add = false"
    v-if="modal.add"
  ></ModalAdd>

  <ModalEdit
    :item="state.currentItem"
    v-if="modal.edit"
    @close="modal.edit = false"
    @deleted="modal.edit = false"
  ></ModalEdit>
</template>
<script>
import axios from "../../services/axios";
import socket from "../../services/socket";

import LoadAnimation from "../LoadAnimation";
import ErrorConection from "../ErrorConection";
import ModalAdd from "../Tandas/add";
import ModalEdit from "../Tandas/edit";

export default {
  data: () => {
    return {
      items: [],
      modal: {
        add: false,
        edit: false,
      },
      state: {
        request: true,
        status: "none",
        currentItem: null,
      },
    };
  },
  methods: {
    edit(e) {
      this.modal.edit = true;
      this.state.currentItem = e;
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
    let audio = new Audio("done.mp3"); // path to file
    socket._io.on("refresh:tandas", (data) => {
      this.items = data;
      audio.play().then(() => {});
    });
  },
  components: {
    LoadAnimation,
    ErrorConection,
    ModalAdd,
    ModalEdit,
  },
};
</script>
<style lang="less" scoped>
@import "../../styles/Tandas";
</style>