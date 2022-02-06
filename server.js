const app = require("./app");
const startConnection = require("./db");

async function start() {
  // Start db
  await startConnection();
  // start server
  app.listen(app.get("port"), "0.0.0.0", () =>
    console.log(`server on port ${app.get("port")}`)
  );
}

start();
