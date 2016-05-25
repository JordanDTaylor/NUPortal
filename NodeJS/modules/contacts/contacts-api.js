
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/contactInfo', server.passportErrNotLoggedIn, function(req,res){
    var user_id = req.param('id');
    if(user_id != req.user.id){
        res.status(403);
        res.send('Not Authorized');
    }
    else{
        sql.execute({
            query: "SELECT FirstName, lastName FROM Contact.People WHERE Id = @userId",
            params: {
                userId: {
                    type: sql.int,
                    val: user_id,
                }
            }
        }).then(function (results){
            res.json({results});
        }, function(err){
            console.log("Something bad happened: ",err);
            res.status(503);
            res.json({results});
        });
    }
});

app.get('/api/allContactInfo', function(req,res){
    sql.execute({
        query: "SELECT Firstname, LastName FROM Contact.People"
    }).then(function (results){
        res.json({results});
    }, function(err){
        console.log("Something bad happened: ",err);
        res.status(503);
        res.json({results});
    });
});