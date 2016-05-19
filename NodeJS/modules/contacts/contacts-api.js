
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/contactInfo', function (req, res) {
    var user_id = req.param('id');
    sql.execute({
        query: "SELECT FirstName, lastName FROM Contact.People WHERE Id = @userId",
        params: {
            userId: {
                type: sql.int,
                val: user_id,
            }
        }
    }).then(function (results) {
        res.json({ results });
    }, function (err) {
        console.log("Something bad happened: ", err);
    });
});

app.get('/api/allContactInfo', function (req, res) {
    sql.execute({
        query: "SELECT Firstname, LastName FROM Contact.People"
    }).then(function (results) {
        res.json({ results });
    }, function (err) {
        console.log("Something bad happened: ", err);
    });
});

app.get('/api/allStudents', function (req, res) {
    sql.execute({
        query: sql.fromFile("./sql/students")
    }).then(function (results) {
        res.json({ results });
    }, function (err) {
        console.log("Something bad happened: ", err);
    });
});

app.get('/api/allStaff', function (req, res) {
    sql.execute({
        query: sql.fromFile("./sql/staff")
    }).then(function (results) {
        res.json({ results });
    }, function (err) {
        console.log("Something bad happened: ", err);
    });
});
