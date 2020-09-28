var connection = require('../connection');
var msyql = require('mysql');
var md5 = require('MD5');
var response = require('../res');
var jwt = require('jsonwebtoken');
var config = require('../config/secret');
var ip = require('ip');

//controller untuk registrasi user
exports.registrasi = function (req, res) {
    var post = {
        username: req.body.username,
        email: req.body.email,
        password: md5(req.body.password),
        role: 3,
        tanggal_daftar: new Date(),
        isVerified: 0
    }

    var query = "SELECT email FROM ?? WHERE ??=?";
    var table = ["user", "email", post.email];

    query = mysql.format(query, table);

    connection.query(query, function (error, rows) {
        if (error) {
            console.log(error);
        } else {
            if (rows.length == 0) {
                var query = "INSERT INTO ?? SET ?";
                var table = ["user"];
                query = mysql.format(query, table);
                connection.query(query, post, function (error, rows) {
                    if (error) {
                        console.log(error);
                    } else {
                        //kirimkan email verifikasi
                        rand = Math.floor((Math.random() * 100) + 54)
                        host = "localhost:3001"
                        link = "http://" + host + "/auth/verify?id=" + rand
                        mailOptions = {
                            to: post.email,
                            subject: "Verifikasi Email",
                            html: "Hallo, <br> Please klik tautan verifikasi berikut <br>" +
                                "<a href=" + link + ">Click here to verifikasi</a>"
                        }

                        smtpTransport.sendMail(mailOptions, function (error, response) {
                            if (error) {
                                res.json({
                                    success: false,
                                    isRegistered: false,
                                    message: "Email verfikasi gagal terkirim"
                                }).end();
                            } else {
                                res.json({
                                    success: true,
                                    isRegistered: false,
                                    message: "Email verfikasi berhasil terkirim"
                                }).end();
                            }
                        })
                    }
                });
            } else {
                res.json({
                    success: false,
                    isRegistered: true,
                    message: "Email anda telah terdaftar!"
                }).end();
            }
        }
    })
}