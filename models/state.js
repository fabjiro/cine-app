const { Schema, model } = require("mongoose");

const StateSchema = new Schema(
  {
    currentCartelera: {
      type: String,
      required: true,
    },
  },
  {
    versionKey: false,
  }
);

module.exports = model("State", StateSchema);
