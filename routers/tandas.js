const { Router } = require("express");
const { join } = require("path");
const { deleteFile } = require("../fileHosting");
const TandasShema = require("../models/tandas");
const pathFile = join(__dirname, "../temfiles/");
const {
  generateUniqueName,
  compreImage,
  uploadSharedLink,
  dowloandYT,
} = require("../functions");

const router = Router();

// get tandas
router.get("/", async (req, res) => {
  let tandas = await TandasShema.find();
  let salida = [];
  tandas.forEach((element) => {
    salida.push({
      id: element["_id"],
      title: element["title"],
      description: element["description"],
      portada: element["portada"],
      estreno: element["estreno"],
      doblada: element["doblada"],
      trailer: element["trailer"],
    });
  });
  res.json(salida);
});

router.post("/ytdl", async (req, res) => {
  let { url } = req.body;
  await dowloandYT(url);

  res.send("hola mundo");
});

// add tandas
router.post("/", async (req, res) => {
  try {
    let { title, description, estreno, trailer, doblada } = req.body;
    let { portada } = req.files;

    if (!(title && description && estreno && trailer && portada && doblada)) {
      return res.json({
        status: 500,
        smg: "complete los campos",
      });
    }

    // generar unico nombre
    let randomName = await generateUniqueName();

    //manipulando imagen
    await compreImage(portada, randomName);

    // upload portada and shared link
    let resPortada = await uploadSharedLink(
      pathFile + randomName,
      `/Cine/Portadas/${randomName}`
    );
    // dowloand video
    await dowloandYT(trailer);

    // upload trailer and shared link
    let resTrailer = await uploadSharedLink(
      pathFile + "video.mp4",
      `/Cine/Trailers/${randomName.replace(".png", ".mp4")}`
    );

    //insert db
    let consulta = new TandasShema({
      title: title,
      description: description,
      estreno: estreno,
      trailer: resTrailer["link"],
      portada: resPortada["link"],
      path: [resPortada["path"], resTrailer["path"]],
      ytlink: trailer,
      doblada: doblada,
    });

    await consulta.save();

    res.json({
      status: 200,
      smg: "added!!",
    });
    return;
  } catch (error) {
    console.log(error);
    res.json({
      status: 500,
      smg: "error!!",
    });
    return;
  }
});

//remove tandas
router.delete("/:id", async (req, res) => {
  try {
    let { id } = req.params;
    let result = await TandasShema.findById(id);
    await deleteFile(result["path"][0]);
    await deleteFile(result["path"][1]);
    await TandasShema.deleteOne({ _id: id });
    return res.json({
      status: 200,
      smg: "deleted",
    });
  } catch (error) {
    return res.json({
      status: 500,
      smg: "problems",
    });
  }
});

// update tandas
router.put("/", async (req, res) => {
  try {
    let { title, description, estreno, trailer, id, doblada } = req.body;
    let portada = req.files != null ? req.files.portada : null;

    if (!(title && description && estreno && trailer && id && doblada))
      return res.json({
        status: 500,
        smg: "complete los campos",
      });

    let elementResult = await TandasShema.findById(id);
    if (elementResult == null) {
      res.json({
        status: 500,
        smg: "verifique id",
      });
      return;
    }

    if (portada != null) {
      //borrando archivo actual
      await deleteFile(elementResult["path"]);

      // generate unique name file Cloud
      let randomName = await generateUniqueName();

      //compres image
      await compreImage(portada);

      //upload and generate link image
      let response = await uploadSharedLink(
        pathFile + portada.name,
        randomName
      );

      await TandasShema.findByIdAndUpdate(id, {
        title: title,
        description: description,
        path: response["path"],
        estreno: estreno,
        portada: response["link"],
        trailer: trailer,
        doblada: doblada,
      });
    } else {
      await TandasShema.findByIdAndUpdate(id, {
        title,
        description,
        estreno,
        trailer,
        doblada,
      });
    }

    res.json({
      status: 200,
      smg: "changed!!",
    });
  } catch (error) {
    console.log(error);
    res.json({
      status: 500,
      smg: "tenemos problemas",
    });
  }
});

module.exports = router;
