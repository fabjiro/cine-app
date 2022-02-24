const { Schema, model } = require("mongoose");

const CartelerasSchema = new Schema(
  {
    mes: {
      type: String,
      required: true,
    },
    fechas: {
      type: Array,
      required: true,
    },
  },
  {
    versionKey: false,
  }
);

module.exports = model("Carteleras", CartelerasSchema);
