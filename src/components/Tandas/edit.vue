<template>
  <div class="modal">
    <div class="content box">
      <div class="header">
        <h1>Editar Tandas</h1>
        <i @click="$emit('close')" class="fa-solid fa-close close"></i>
      </div>
      <div class="cont">
        <div class="ui form" :class="state.request ? 'loading' : ''">
          <div class="ui segment">
            <div class="field">
              <div class="ui toggle checkbox">
                <input v-model="formData.estreno" type="checkbox" />
                <label>Estreno</label>
              </div>
              <div class="ui toggle checkbox">
                <input v-model="formData.doblada" type="checkbox" />
                <label>Doblada</label>
              </div>
            </div>
          </div>
          <div class="field">
            <label>Title</label>
            <input
              v-model="formData.title"
              type="text"
              placeholder="Enter Name"
            />
          </div>
          <div class="field">
            <label>Link</label>
            <input
              v-model="formData.link"
              type="text"
              placeholder="Enter link youtube"
            />
          </div>
          <div class="field">
            <div class="ui left icon input">
              <input
                type="file"
                placeholder="Search file..."
                accept="image/*"
                @change="filechange"
              />
              <i class="fa-solid fa-file icon"></i>
            </div>
          </div>
          <div class="field">
            <label>Descripcion</label>
            <textarea
              v-model="formData.description"
              rows="6"
              placeholder="Enter descripcion"
            ></textarea>
          </div>
        </div>
      </div>
      <div class="actions">
        <button
          class="ui button tiny yellow"
          @click="saved"
          :class="state.request ? 'disabled' : ''"
        >
          Editar
        </button>

        <button
          class="ui button tiny red"
          @click="del"
          :class="state.request ? 'disabled' : ''"
        >
          Eliminar
        </button>
        <button
          class="ui button tiny"
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
  emits: ["close", "added", "deleted"],
  props: ["item"],
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
    async del() {
      if (confirm("Deseas eliminar")) {
        this.state.request = true;
        let res = await axios.delete("/api/tandas/" + this.item.id);
        if (res.data["status"] == 200) {
          this.$emit("deleted");
        }
        this.state.request = false;
      }
    },
  },
  created() {
    this.formData.doblada = this.item.doblada;
    this.formData.estreno = this.item.estreno;
    this.formData.title = this.item.title;
    this.formData.description = this.item.description;
    this.formData.link = this.item.ytlink;
  },
};
</script>

<style lang="less" scoped>
@import "../../styles/Tandas/edit";
</style>