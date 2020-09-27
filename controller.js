'use strict';

var response = require('./res');
var connection = require('./connection');

exports.index = function(req,res){
    response.ok("Aplikasi nya jalan",res);
};

//nampilin data nya dari database

exports.tampilSemuaData = function(req,res){
    connection.query('SELECT * FROM mahasiswa',function (error, rows, fileds) {
        if(error){
            connection.log(error);
        }else {
            response.ok(rows,res)
        }
    });
};

exports.tampilById = function(req,res){
    let id = req.params.id;
    connection.query('SELECT * FROM mahasiswa WHERE id_mahasiswa = ?', [id],
        function(error, rows, fields){
            if(error){
                console.log(error);
            }else{
                response.ok(rows,res);
            }
        }
    );
};

exports.tambahMahasiswa = function(req,res){
    var nim = req.body.nim;
    var nama = req.body.nama;
    var jurusan = req.body.jurusan;

    connection.query('INSERT INTO mahasiswa (nim,nama,jurusan) VALUES(?,?,?)',
    [nim,nama,jurusan],
    function(error,rows,fields){
        if(error){
            console.log(error);
        }else{
            response.ok("berhasil nambah pak",res);
        }
    })
}
