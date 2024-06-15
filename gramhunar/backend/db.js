const mariadb =  require('mariadb');

const pool = mariadb.createPool({
    host:'127.0.0.1',
    port:3306,
    user:'root',
    password:"root",
    database:'gramhunar',
    connectionLimit: 5
});
console.log("working")

pool.getConnection()
  .then(conn => {
    console.log('Connected to MariaDB database!');
    
  })
  .catch(err => {
    console.error('Error connecting to MariaDB database:', err);
  });
module.exports = pool;