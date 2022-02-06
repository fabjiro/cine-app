const { Schema, model } = require("mongoose");

const useradminSchema = new Schema(
  {
    user: {
      type: String,
      required: true,
      trim: true,
    },
    password: {
      type: String,
      required: true,
      trim: true,
    },
  },
  {
    versionKey: false,
  }
);

module.exports = model("UserAdmin", useradminSchema);
