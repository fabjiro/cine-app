const axios = require("axios").default;

const axionInstance = axios.create({
  headers: {
    "Content-Type": "application/json; charset=utf-8",
    "Access-Control-Allow-Origin": "*",
  },
});

module.exports = axionInstance;
