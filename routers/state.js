const { Router } = require("express");

const StateSchema = require("../models/state");

const router = Router();

// get states
router.get("/", async (req, res) => {
  let state = await StateSchema.find();
  console.log(state);
  res.send("hola mundo");
});

//set state

module.exports = router;
