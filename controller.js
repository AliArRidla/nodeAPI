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
