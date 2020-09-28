var mysql = require('mysql');

//ke database

const koneksi = mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'root',
    socketPath: '/Applications/MAMP/tmp/mysql/mysql.sock',
    database:'nodeAPI'
});

koneksi.connect((err)=>{
    if(err) throw err;
    console.log('mysql terkoneksi');
});

module.exports = koneksi;

