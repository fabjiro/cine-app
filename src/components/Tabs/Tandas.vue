<template>
  <div>
    <AddTandas
      :dialog="state.dialog.add"
      @cancel="toggleAdd"
      @done="doneAdd"
    ></AddTandas>

    <EditDialog
      v-if="state.dialog.edit"
      :dialog="state.dialog.edit"
      :isload="state.isload.edit"
      :item="current.item"
      @cancel="toggleEdit"
      @saved="editTandas"
    ></EditDialog>

    <DeleteDialog
      :dialog="state.dialog.delete"
      :isload="state.isload.delete"
      :cancel="toggleDelete"
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
        @click_card="pressEdit"
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
import EditDialog from "../Dialog/Tandas/Edit";

export default {
  data: () => {
    return {
      current: {
        id: "",
        item: "",
      },
      state: {
        dialog: {
          delete: false,
          add: false,
          edit: false,
        },
        isload: {
          add: false,
          delete: false,
          edit: false,
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
    pressEdit(e) {
      this.current.item = e;
      this.toggleEdit();
    },
    async editTandas(e) {
      let form = new FormData();
      this.state.isload.edit = true;

      form.append("title", e.title);
      form.append("description", e.description);
      form.append("trailer", e.ytlink);
      form.append("id", e.id);
      form.append("doblada", e.doblada);
      form.append("estreno", e.estreno);

      let res = await axios.put("/api/tandas", form);
      this.state.isload.edit = false;

      if (res.data["status"] == 200) {
        this.loadTandas();
        this.toggleEdit();
      }
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
    toggleEdit() {
      this.state.dialog.edit = !this.state.dialog.edit;
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
    EditDialog,
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