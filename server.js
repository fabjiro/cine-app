const app = require("./app");
const startConnection = require("./db");
const socketIO = require("./socket");

async function start() {
  // Start db
  await startConnection();
  // start server
  const server = app.listen(app.get("port"), "0.0.0.0", () =>
    console.log(`server on port ${app.get("port")}`)
  );

  socketIO.config(server);

  socketIO.io.on("connection", (socket) => {
    console.log("nueva coneccion -> " + socket.id);
  });
}

start();
