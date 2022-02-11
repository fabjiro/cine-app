const { Router } = require("express");
const { join } = require("path");
const { deleteFile } = require("../fileHosting");
const {
  generateUniqueName,
  compreImage,
  uploadSharedLink,
} = require("../functions");

const ProximamenteShema = require("../models/proximamente");

const router = Router();
const pathFile = join(__dirname, "../temfiles/");

// get peliculas
router.get("/", async (req, res) => {
  let peliculas = await ProximamenteShema.find();
  let salida = [];
  peliculas.forEach((element) => {
    salida.push({
      id: element["_id"],
      title: element["title"],
      description: element["description"],
      portada: element["portada"],
    });
  });
  res.json(salida);
});

// post peliculas
router.post("/", async (req, res) => {
  try {
    const file = req.files.portada;
    // generate unique name file Cloud
    let randomName = await generateUniqueName();
    //compres image
    await compreImage(file);

    //upload and generate link image
    let response = await uploadSharedLink(pathFile + file.name, randomName);

    //insert db
    const consulta = new ProximamenteShema({
      title: req.body.title,
      description: req.body.description,
      portada: response["link"],
      path: response["path"],
    });

    await consulta.save();

    return res.json({
      status: 200,
      smg: "added!!",
    });
  } catch (error) {
    console.log(error);
    return res.json({
      status: 500,
      smg: "problem inserting",
    });
  }
});

//remove peliculas
router.delete("/:id", async (req, res) => {
  try {
    let { id } = req.params;
    let result = await ProximamenteShema.findById(id);
    await deleteFile(result["path"]);
    await ProximamenteShema.deleteOne({ _id: id });
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

// update peliculas
router.put("/", async (req, res) => {
  try {
    let { title, description, id } = req.body;

    let portada = req.files != null ? req.files.portada : null;

    let elementResult = await ProximamenteShema.findById(id);
    if (elementResult) {
      res.json({
        status: 500,
        smg: "verifique id",
      });
      return;
    }

    if (portada != null) {
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

      await ProximamenteShema.findByIdAndUpdate(id, {
        title: title,
        description: description,
        path: response["path"],
        portada: response["path"],
      });
    } else {
      await ProximamenteShema.findByIdAndUpdate(id, { title, description });
    }

    res.json({
      status: 200,
      smg: "update!!",
    });
  } catch (error) {
    res.json({
      status: 500,
      smg: "error!!",
    });
  }
});

module.exports = router;
