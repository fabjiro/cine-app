<template>
  <div class="modal">
    <div class="content box" :class="request ? 'loading' : ''">
      <div class="header">
        <h2>Agregar Proximamente</h2>
        <i @click="$emit('onClose')" class="fa-solid fa-close close"></i>
      </div>
      <div class="cont">
        <div class="field">
          <label>Title</label>
          <input class="box input" type="text" placeholder="Ingrese title" />
        </div>
        <div class="field">
          <label>Portada</label>
          <input type="file" class="box input" />
        </div>
        <div class="field">
          <label>Description</label>
          <textarea
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
      <div class="load-animation box">
        <div class="circle"></div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  emits: ["onClose"],
  data() {
    return {
      request: false,
    };
  },
  methods: {
    onAgregar() {
      this.request = true;
      setTimeout(() => {
        this.request = false;
      }, 6000);
    },
  },
};
</script>

<style lang="less" scoped>
@import "../../styles/Proximamente/add";
</style>    