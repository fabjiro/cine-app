<template>
  <div class="cont">
    <span>Error de coneccion</span>
    <i class="fa-solid fa-wifi"></i>
  </div>
</template>
<style lang="less" scoped>
.cont {
  user-select: none;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 4px;

  background: rgba(0, 0, 0, 0.8);

  span {
    color: white;
    font-size: 2rem;
    margin-right: 2rem;
  }
  i {
    color: white;
    font-size: 2rem;
  }
}
</style>