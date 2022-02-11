const { Router } = require("express");
// const { deleteFile } = require("../fileHosting");

const CarteleraShema = require("../models/cartelera");

const router = Router();

router.get("/", async (req, res) => {
  let carteleras = await CarteleraShema.find();
  res.json(carteleras);
  res.end();
});

router.post("/", async (req, res) => {
  try {
    let { fechas } = req.body;

    if (!fechas)
      return res.json({
        status: 400,
        smg: "verifique sus parametros",
      });

    let item = new CarteleraShema({
      fechas,
    });

    await item.save();
    return res.json({
      status: 200,
      smg: "added!!",
    });
  } catch (error) {
    console.log(error);
    return res.json({
      status: 500,
      smg: "tenemos problemas",
    });
  }
});

router.delete("/:id", async (req, res) => {
  try {
    let { id } = req.params;
    await CarteleraShema.findByIdAndDelete(id);
    return res.json({
      status: 200,
      smg: "deleted!!",
    });
  } catch (error) {
    return res.json({
      status: 500,
      smg: "hemos tenido problemas",
    });
  }
});
module.exports = router;
