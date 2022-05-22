<template>
  <div class="toast active">
    <span>{{ title }}</span>
    <i @click="onClose" class="fa-solid fa-close close"></i>
  </div>
</template>

<script>
export default {
  props: ["title"],
};
</script>

<style lang="less" scoped>
.toast {
  user-select: none;
  background: rgba(0, 0, 0, 0.7);
  width: fit-content;
  padding: 0.5rem 0.5rem;
  display: flex;
  align-items: center;
  justify-content: center;

  border-radius: 4px;
  position: absolute;
  bottom: 1rem;
  left: 0;
  right: 0;
  margin: auto;
  color: white;
  span {
    font-weight: bold;
    font-size: 1.1rem;
    margin-right: 0.7rem;
  }

  .close {
    cursor: pointer;
    font-size: 1.1rem;
    text-align: center;
  }
}

.active {
  animation: up-active 0.6s 1 ease-in-out;
}

.deactive {
  animation: down-deactive 0.6s 1 ease-in-out;
}

@keyframes up-active {
  to {
  }
  from {
    opacity: 0;
    transform: translateY(50px);
  }
}
@keyframes down-deactive {
  to {
    transform: translateY(50px);
    opacity: 0;
  }
  from {
  }
}
</style>