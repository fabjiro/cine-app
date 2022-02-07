const { Schema, model } = require("mongoose");

const TandasSchema = new Schema(
  {
    title: {
      type: String,
      required: true,
      trim: true,
    },
    description: {
      type: String,
      required: true,
      trim: true,
    },
    portada: {
      type: String,
      required: true,
    },
    trailer: {
      type: String,
      required: true,
    },
    path: {
      type: String,
      required: true,
    },
    estreno: {
      type: Boolean,
      default: true,
    },
    doblada: {
      type: Boolean,
      required: true,
    },
  },
  {
    versionKey: false,
  }
);

// export { model (TandasShema) };

module.exports = model("Tandas", TandasSchema);
