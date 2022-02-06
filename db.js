const { connect } = require("mongoose");

const startConnection = async () => {
  try {
    await connect(process.env.DBMONGO);
    console.log("db started");
  } catch (error) {
    console.error("db init errror");
  }
};

module.exports = startConnection;
