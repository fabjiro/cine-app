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
    <div class="float-btn-add" @click="modal.add = true">
      <i class="fa-solid fa-add"></i>
    </div>
  </div>

  <div class="content request box" v-if="state.request">
    <LoadAnimation v-if="state.status == 'none'"></LoadAnimation>
    <ErrorConection v-if="state.status == 'coneccion'"></ErrorConection>
  </div>

  <ModalEdit
    v-if="modal.edit"
    @onClose="modal.edit = false"
    :item="state.currentItem"
  ></ModalEdit>
  <ModalAdd v-if="modal.add" @onClose="modal.add = false"></ModalAdd>
</template>

<script>
import axios from "../../services/axios";
import socket from "../../services/socket";

import ModalAdd from "../Proximamente/add.vue";
import ModalEdit from "../Proximamente/edit.vue";
import LoadAnimation from "../LoadAnimation";
import ErrorConection from "../ErrorConection.vue";

export default {
  data() {
    return {
      items: [],
      modal: {
        add: false,
        edit: false,
      },
      state: {
        currentItem: null,
        request: true,
        status: "none",
      },
    };
  },
  methods: {
    edit(e) {
      this.modal.edit = true;
      this.state.currentItem = e;
    },
    async getProx() {
      this.state.request = true;
      let res = await axios.get("/api/proximamente");
      this.items = res.data;
      this.state.request = false;
    },
  },
  created() {
    this.getProx();
    socket._io.on("server:proximamente", (data) => {
      this.items = data;
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
</style>