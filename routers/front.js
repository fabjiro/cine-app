const { Router } = require("express");

const router = Router();

router.get("/login", (req, res) => {
  res.render("login.html");
});

router.get("/carteleras", (req, res) => {
  res.render("carteleras.html");
});
module.exports = router;
