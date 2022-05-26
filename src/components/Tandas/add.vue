<template>
  <div class="modal">
    <div class="content box">
      <div class="header">
        <h1>Agregar Tandas</h1>
        <i @click="$emit('close')" class="fa-solid fa-close close"></i>
      </div>
      <div class="cont">
        <!-- <div class="field">
          <div class="input">
            <label>Estreno</label>
            <input v-model="formData.estreno" type="checkbox" />
          </div>
          <div class="ui toggle checkbox">
            <input v-model="formData.doblada" type="checkbox" />
            <label>Doblada</label>
          </div>
        </div> -->
        <div class="field">
          <label>Title</label>
          <input
            class="box input"
            v-model="formData.title"
            type="text"
            placeholder="Enter Name"
          />
        </div>
        <div class="field">
          <label>Link</label>
          <input
            class="box input"
            v-model="formData.link"
            type="text"
            placeholder="Enter link youtube"
          />
        </div>
        <div class="field">
          <label>Portada</label>
          <input
            type="file"
            placeholder="Search file..."
            accept="image/*"
            class="box input"
            @change="filechange"
          />
        </div>
        <div class="field">
          <label>Descripcion</label>
          <textarea
            class="box input"
            v-model="formData.description"
            rows="6"
            placeholder="Enter descripcion"
          ></textarea>
        </div>
      </div>
      <div class="actions">
        <button
          class="btn btn-add"
          @click="saved"
          :class="state.request ? 'disabled' : ''"
        >
          Guardar
        </button>
        <button
          class="btn"
          @click="$emit('close')"
          :class="state.request ? 'disabled' : ''"
        >
          Cancelar
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "../../services/axios";
export default {
  emits: ["close", "added"],
  data: () => {
    return {
      state: {
        request: false,
      },
      formData: {
        doblada: true,
        estreno: true,
        title: null,
        link: null,
        description: null,
        file: null,
      },
    };
  },
  methods: {
    filechange(e) {
      this.formData.file = e.target.files[0];
    },
    async saved() {
      this.state.request = true;
      let data = new FormData();

      data.append("title", this.formData.title);
      data.append("description", this.formData.description);
      data.append("trailer", this.formData.link);
      data.append("portada", this.formData.file);
      data.append("estreno", this.formData.estreno);
      data.append("doblada", this.formData.doblada);

      let res = await axios.post("/api/tandas", data);
      this.state.request = false;

      if (res.data["status"] == 200) {
        this.$emit("added");
      }
    },
  },
};
</script>

<style lang="less" scoped>
@import "../../styles/Tandas/add";
</style>