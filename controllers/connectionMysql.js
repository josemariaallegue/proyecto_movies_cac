const mysql2 = require("mysql2/promise");

const pool = mysql2.createPool({
  host: "localhost",
  port: 3306,
  database: "mymovies",
  user: "root",
  password: "1234",
});

module.exports = pool;
