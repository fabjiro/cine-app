const sharp = require("sharp");
const fs = require("fs");
const { listFolder, uploadFile, createSharedFile } = require("./fileHosting");
const { join } = require("path");

const pathFile = join(__dirname, "./temfiles/");

const generateUniqueName = async () => {
  let listName = await listFolder("/Cine/Portadas");
  let randomName = (Math.random() + 1).toString(36).substring(7);
  randomName = randomName + ".png";

  while (listName.includes(randomName)) {
    randomName = (Math.random() + 1).toString(36).substring(7);
    randomName = randomName + ".png";
  }
  return randomName;
};

const compreImage = async (file) => {
  await sharp(file.data)
    .resize({
      width: 864,
      height: 1080,
      fit: "fill",
    })
    .toFormat("png")
    .png({
      quality: 75,
    })
    .toFile(pathFile + file.name);
  return true;
};

const uploadSharedLink = async (path, name) => {
  let responseUpload = await uploadFile(path, name);
  let responseShared = await createSharedFile(responseUpload["path"]);
  await fs.unlink(path, (err) => {});
  return {
    link: responseShared,
    path: responseUpload["path"],
  };
};
module.exports = { generateUniqueName, compreImage, uploadSharedLink };
