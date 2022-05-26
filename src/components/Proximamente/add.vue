<template>
  <div class="modal">
    <div class="content box">
      <div class="header">
        <h2>Agregar Proximamente</h2>
        <i @click="$emit('onClose')" class="fa-solid fa-close close"></i>
      </div>
      <div class="cont">
        <div class="field">
          <label>Title</label>
          <input
            v-model="form.title"
            class="box input"
            type="text"
            placeholder="Ingrese title"
          />
        </div>
        <div class="field">
          <label>Portada</label>
          <input type="file" class="box input" @change="onChangeImage" />
        </div>
        <div class="field">
          <label>Description</label>
          <textarea
            v-model="form.description"
            class="box input"
            placeholder="Ingrese descripcion"
            rows="7"
          ></textarea>
        </div>
      </div>
      <div class="actions">
        <input class="btn" type="button" value="Cancelar" />
        <input
          class="btn btn-add"
          type="button"
          value="Agregar"
          @click="onAgregar"
        />
      </div>
      <Toast :title="toast.title" v-if="toast.show"></Toast>
      <LoadAnimation v-if="request"></LoadAnimation>
    </div>
  </div>
</template>

<script>
import LoadAnimation from "../LoadAnimation";
import axios from "../../services/axios";
import Toast from "../Toast.vue";

export default {
  emits: ["onClose"],
  data() {
    return {
      request: false,
      toast: {
        title: null,
        show: false,
      },
      form: {
        title: null,
        description: null,
        image: null,
      },
    };
  },
  methods: {
    async onAgregar() {
      if (!(this.form.title && this.form.description && this.form.image)) {
        this.toast.title = "Verifique los campos";
        this.toast.show = true;
        setTimeout(() => (this.toast.show = false), 5000);
        return;
      }

      this.request = true;
      let formD = new FormData();
      formD.append("title", this.form.title);
      formD.append("description", this.form.description);
      formD.append("portada", this.form.image);

      // setTimeout(() => {
      //   this.request = false;
      // }, 12000);

      let res = await axios.post("/api/proximamente", formD);
      console.log(res.data);
      this.request = false;

      if (res.data["status"] == 200) {
        this.$emit("onClose");
      }
    },
    onChangeImage(e) {
      this.form.image = e.target.files[0];
    },
  },
  components: {
    LoadAnimation,
    Toast,
  },
};
</script>

<style lang="less" scoped>
@import "../../styles/Proximamente/add";
</style>    