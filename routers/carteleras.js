const { Router } = require("express");
const axios = require("../axios");
// const { deleteFile } = require("../fileHosting");

const CarteleraShema = require("../models/cartelera");
const StatesShema = require("../models/states");

const router = Router();

router.get("/state", async (req, res) => {
  let state = await StatesShema.findById("620f3b59204c42ad273060fc");
  let cartelera = await CarteleraShema.findById(state["currentCartelera"]);
  let dataApi = await axios.get(
    "https://worldtimeapi.org/api/timezone/America/Managua"
  );
  let d = new Date(dataApi.data["datetime"]);

  res.json({
    currentCartelera: state["currentCartelera"],
    firstDayMonth: new Date(d.getFullYear(), d.getMonth(), 1).getDay(),
    mes: cartelera["mes"],
    day: d.getDate(),
    fechas: cartelera["fechas"],
  });
});

router.get("/all", async (req, res) => {
  let carteleras = await CarteleraShema.find();
  res.json(carteleras);
  res.end();
});

router.get("/:id", async (req, res) => {
  let { id } = req.params;
  res.json(await CarteleraShema.findById(id));
});

router.post("/", async (req, res) => {
  try {
    let { fechas, mes } = req.body;
    if (!fechas && !mes)
      return res.json({
        status: 400,
        smg: "verifique sus parametros",
      });

    let isUnique = await CarteleraShema.findOne({
      mes: mes,
    });

    if (isUnique) {
      return res.json({
        status: 500,
        smg: "ya hay tanda para este mes",
      });
    }

    for (let i = 0; i < fechas.length; i++) {
      let da = new Date(fechas[i]);
      fechas[i] = da.getDate();
    }

    let item = new CarteleraShema({
      mes: mes,
      fechas: fechas,
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
