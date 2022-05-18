<template>
  <router-view />
</template>

<script>
import socket from "./services/socket";
export default {
  created() {
    socket.config("https://cinefabjiro.herokuapp.com");
  },
};
</script>

<style>
:root {
  --primary_color: #f3f3f3;
  --secondary_color: white;
  --text_color: black;
  font-family: "Varela Round";
}

::-webkit-scrollbar {
  display: none;
}

* {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}

body {
  background: var(--primary_color);
}

.box {
  background: var(--secondary_color);
  color: var(--text_color);
  border-radius: 8px;
  box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
}

.modal {
  position: absolute;
  top: 0;
  left: 0;
  width: 100vw;
  height: 100vh;
  background: rgba(0, 0, 0, 0.5);
}
</style>
