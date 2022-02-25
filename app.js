const express = require("express");
const morgan = require("morgan");
const fileUpload = require("express-fileupload");
const cors = require("cors");
const path = require("path");
const minify = require("express-minify");
// const cookieParser = require("cookie-parser");
const history = require("connect-history-api-fallback");

require("dotenv").config();

const app = express();

app.use(minify());
app.use(cors());
app.use(morgan("dev"));
app.use(express.urlencoded({ extended: false }));
app.use(express.json());

// enable files upload
app.use(
  fileUpload({
    createParentPath: true,
  })
);
// enable history vue
app.use(
  history({
    rewrites: [
      {
        from: /^\/api\/.*$/,
        to: function (context) {
          return context.parsedUrl.path;
        },
      },
    ],
  })
);
app.use(express.static(path.join(__dirname, "/public")));

// settings
app.set("port", process.env.PORT || 3000);

//router
app.use("/api/proximamente", require("./routers/proximamente"));
app.use("/api/tandas", require("./routers/tandas"));
app.use("/api/useradmin", require("./routers/useradmin"));
app.use("/api/carteleras", require("./routers/carteleras"));
// app.use(require("./routers/front"));

module.exports = app;
