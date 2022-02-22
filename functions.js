const sharp = require("sharp");
const fs = require("fs");
const { listFolder, uploadFile, createSharedFile } = require("./fileHosting");
const { join } = require("path");
const ytdl = require("ytdl-core");

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

const compreImage = async (file, randomName) => {
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
    .toFile(pathFile + randomName);
  return true;
};

const uploadSharedLink = async (pathLocal, pathCloud) => {
  let responseUpload = await uploadFile(pathLocal, pathCloud);
  let responseShared = await createSharedFile(responseUpload["path"]);
  await fs.unlink(pathLocal, (err) => {});
  return {
    link: responseShared,
    path: responseUpload["path"],
  };
};

const dowloandYT = async (url) => {
  return new Promise((resolve) => {
    let writeableStream = fs.createWriteStream(
      join(__dirname, "./temfiles/video.mp4")
    );

    writeableStream.on("finish", resolve);
    ytdl(url, {
      format: "mp4",
      quality: "highest",
    }).pipe(writeableStream);
  });
};
module.exports = {
  generateUniqueName,
  compreImage,
  uploadSharedLink,
  dowloandYT,
};
