const { Schema, model } = require("mongoose");

const CartelerasSchema = new Schema(
  {
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
