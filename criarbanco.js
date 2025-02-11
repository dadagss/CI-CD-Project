const mysql = require("mysql2/promise");

(async () => {
  let connection;
  try {
    connection = await mysql.createConnection({
      host: "localhost",
      user: "root",
      password: "Dodeges32*",
    });

    await connection.query("CREATE DATABASE IF NOT EXISTS nome_do_banco");
    await connection.query("CREATE USER IF NOT EXISTS 'dadags'@'%' IDENTIFIED BY 'Dodeges32*'");
    await connection.query("GRANT ALL PRIVILEGES ON nome_do_banco.* TO 'dadags'@'%'");

    console.log("Banco de dados e usuário criados com sucesso!");
  } catch (err) {
    console.error("Erro ao configurar o banco:", err);
  } finally {
    if (connection) {
      await connection.end();
    }
  }
})();    