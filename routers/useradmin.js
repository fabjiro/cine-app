const { Router } = require("express");
const useradmin = require("../models/useradmin");
const passwordHash = require("password-hash");
const uuid = require("uuid");
const router = Router();

router.post("/add", async (req, res) => {
  try {
    let { user, password } = req.body;
    password = passwordHash.generate(password);

    const consulta = new useradmin({
      user,
      password,
    });

    await consulta.save();
    res.json({
      status: 200,
      smg: "insertado correctamente",
    });
  } catch (error) {
    res.json({
      status: 500,
      smg: "tenemos problemas",
    });
  }
});

router.post("/login", async (req, res) => {
  try {
    let { user, password } = req.body;

    if (!(user && password))
      return res.json({
        status: 500,
        smg: "verifique los campos",
      });

    let dataUser = await useradmin.findOne({
      user,
    });

    if (dataUser) {
      if (passwordHash.verify(password, dataUser["password"])) {
        res.json({
          status: 200,
          token: uuid.v1(),
          smg: "ok",
        });
        return;
      }
    }
    res.json({
      status: 404,
      smg: "usuario o contrasena incorrecto",
    });
    return;
  } catch (error) {
    res.json({
      status: 500,
      smg: "tenemos problemas",
    });
  }
});

router.get("/logout", (req, res) => {
  let { cookies } = req;
  if ("token" in cookies) {
    res.clearCookie("token");
    res.send("session cerrada");
  } else res.redirect("/login");
});
module.exports = router;
