const { Dropbox } = require("dropbox");
const fs = require("fs");

//
const dbx = new Dropbox({ accessToken: process.env.TOKENDBX });

const uploadFile = async (pathLocal, pathCloud) => {
  // uploading file
  let response = await dbx.filesUpload({
    path: pathCloud,
    contents: fs.createReadStream(pathLocal),
  });

  return {
    name: response["result"]["name"],
    path: response["result"]["path_display"],
  };
};

const createSharedFile = async (pathCloud) => {
  const response = await dbx.sharingCreateSharedLink({
    path: pathCloud,
  });
  response["result"]["url"] = response["result"]["url"].replace(
    "https://www.dropbox.com/",
    "https://dl.dropboxusercontent.com/"
  );

  return response["result"]["url"];
};

const listFolder = async (pathCloud) => {
  let listName = [];
  let response = await dbx.filesListFolder({
    include_deleted: false,
    path: pathCloud,
  });

  for (let i = 0; i < response["result"]["entries"].length; i++) {
    listName.push(response["result"]["entries"][i]["name"]);
  }

  return listName;
};

const deleteFile = async (pathCloud) => {
  try {
    await dbx.filesDeleteV2({
      path: pathCloud,
    });
  } catch (error) {
    return false;
  }
  return true;
};

module.exports = {
  uploadFile,
  createSharedFile,
  listFolder,
  deleteFile,
};
