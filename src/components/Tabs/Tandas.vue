<template>
  <div>
    <AddTandas
      :dialog="state.dialog.add"
      @cancel="toggleAdd"
      @done="doneAdd"
    ></AddTandas>

    <DeleteDialog
      :dialog="state.dialog.delete"
      :cancel="toggleDelete"
      :isload="state.isload.delete"
      @deleted="deleteTandas"
    ></DeleteDialog>

    <v-card
      elevation="0"
      class="d-flex align-center justify-center"
      height="70%"
      v-if="state.request"
    >
      <v-progress-circular
        :size="70"
        color="primary"
        indeterminate
        v-if="state.request"
      ></v-progress-circular>
    </v-card>

    <v-row class="ml-6 mr-6" v-if="state.request == false">
      <CardView
        v-for="(item, i) in items"
        :key="i"
        :color="colors[numerRandom()]"
        :item="item"
        @deleted="pressDelete"
      ></CardView>
    </v-row>
    <v-btn
      @click="toggleAdd"
      id="btn-add"
      class="mx-2"
      fab
      color="rgba(34,87,126,1)"
    >
      <v-icon color="white"> mdi-plus </v-icon>
    </v-btn>
  </div>
</template>

<script>
import axios from "../../services/axios";
import CardView from "../../components/CardView.vue";
import AddTandas from "../../components/Dialog/Tandas/AddTandas";
import DeleteDialog from "../Dialog/Tandas/DialogDelete";

export default {
  data: () => {
    return {
      state: {
        dialog: {
          delete: false,
          add: false,
        },
        isload: {
          add: false,
          delete: false,
        },
        request: false,
        id: "",
      },
      colors: [
        "purple lighten-4",
        "teal lighten-4",
        "blue-grey lighten-4",
        "indigo lighten-4",
        "pink lighten-4",
      ],
      items: [],
    };
  },
  methods: {
    pressDelete(e) {
      this.state.id = e;
      this.toggleDelete();
    },
    async deleteTandas() {
      this.state.isload.delete = true;
      let res = await axios.delete("/api/tandas/" + this.state.id);
      this.state.isload.delete = false;
      if (res.data["status"] == 200) {
        this.loadTandas();
        this.toggleDelete();
      }
    },
    doneAdd() {
      this.toggleAdd();
      this.loadTandas();
    },
    toggleAdd() {
      this.state.dialog.add = !this.state.dialog.add;
    },
    toggleDelete() {
      this.state.dialog.delete = !this.state.dialog.delete;
    },
    numerRandom() {
      return Math.floor(Math.random() * this.colors.length);
    },
    loadTandas() {
      this.state.request = true;
      axios.get("/api/tandas/").then((res) => {
        this.items = res.data;
        this.state.request = false;
      });
    },
  },
  created() {
    this.loadTandas();
  },
  components: {
    CardView,
    AddTandas,
    DeleteDialog,
  },
};
</script>

<style lang="scss" scoped>
#btn-add {
  position: fixed;
  bottom: 10px;
  right: 10px;
}
</style>