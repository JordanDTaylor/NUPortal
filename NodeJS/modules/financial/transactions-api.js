var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

// app.get('/api/transactions', function(req,res){
//     var user_id = req.param('id');
//     sql.execute({
//         query: "SELECT StudentId, [Date], Description, Reference, Amount, Balance = SUM(Amount) OVER (ORDER BY [Date], Id)FROM Financial.Transactions WHERE StudentId = @userId",
//         params: {
//             userId: {
//                 type: sql.int,
//                 val: user_id,
//             }
//         }
//     }).then(function (results){
//         res.json({results});
//     }, function(err){
//         console.log("Something bad happened: ",err);
//     });
// });

app.get('/api/transactions', function(httpRequest,httpResponse){

    var student_id = httpRequest.param('id');
    sql.execute({
        query: "Financial.getStudentTransactions @studentId",
        params: {studentId: {type: sql.int, val: student_id } }
    })
    .then(
        function (results){
            httpResponse.json(results);
        }
        ,function(err){
            console.log("Something bad happened: ",err);
        }
    );
});

app.get('/api/awardLetters', function(httpRequest,httpResponse){

    var student_id = httpRequest.param('id');

    sql.execute({
        query: "SELECT *  FROM Financial.AwardLetter Where StudentId = @studentId",
        params: {studentId: {type: sql.int, val: student_id } }
    })
    .then(
        function (results){
            httpResponse.json(results);
        }
        ,function(err){
            console.log("Something bad happened: ",err);
        }
    );
});

app.get('/api/allTransactions', function(req,res){
    sql.execute({
        query: "SELECT StudentId, [Date], Description, Reference, Amount, Balance = SUM(Amount) OVER (ORDER BY [Date], Id)FROM Financial.Transactions"
    }).then(function (results){
        res.json(results);
    }, function(err){
        console.log("Something bad happened: ",err);
    });
});
