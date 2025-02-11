require("dotenv").config();
const express = require("express");
const mysql = require("mysql2/promise"); // Usando mysql2 para MySQL

const app = express();
const port = process.env.PORT || 3000;

// Configuração do banco de dados MySQL
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT || 3306, // Porta padrão do MySQL
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0,
});

app.get("/", async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT NOW() AS current_time");
    res.send(`Hello World! Database time: ${rows[0].current_time}`);
  } catch (err) {
    console.error(err);
    res.status(500).send("Error connecting to the database.");
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});