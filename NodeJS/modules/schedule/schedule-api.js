
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/studentScheduleHistory', server.passportErrNotLoggedIn, function(req,res){
    var student_id = req.param('id');
     if(user_id != req.user.id){
        res.status(403);
        res.send('Not Authorized');
    }
    else{
        sql.execute({
            query: "SELECT * FROM Schedule.AttemptedCourses ac LEFT JOIN Schedule.ScheduledEvents se ON ac.ScheduledEventId = se.Id LEFT JOIN Schedule.Courses c ON se.Course_Id = c.Id WHERE ac.StudentId = @studentId",
            params: {
                studentId: {
                    type: sql.int,
                    val: student_id,
                }
            }
        }).then(function (results){
            res.json({results});
        }, function(err){
            console.log("Something bad happened: ",err);
        });
    }
});

app.get('/api/currentlyEnrolledStudentSchedule', server.passportErrNotLoggedIn, function(req,res){
    var student_id = req.param('id');
     if(user_id != req.user.id){
        res.status(403);
        res.send('Not Authorized');
    }
    else{
        sql.execute({
            query: "SELECT * FROM Schedule.RegisteredCourses rc LEFT JOIN Schedule.ScheduledEvents se ON rc.ScheduledCourse = se.Id WHERE rc.StudentId = @studentId",
            params: {
                studentId: {
                    type: sql.int,
                    val:student_id,
                }
            }
        }).then(function (results){
            res.json({results});
        }, function(err){
            console.log("Something bad happened: ",err);
        });
    }
});

app.get('/api/currentlyPlannedStudentSchedule', server.passportErrNotLoggedIn, function(req,res){
    var student_id = req.param('id');
     if(user_id != req.user.id){
        res.status(403);
        res.send('Not Authorized');
    }
    else{
        sql.execute({
            query: "SELECT * FROM Schedule.PlannedCourses pc WHERE pc.StudentId = @studentId",
            params: {
                studentId: {
                    type: sql.int,
                    val: student_id,
                }
            }
        }).then(function (results){
            res.json({results});
        }, function(err){
            console.log("Something bad happened: ",err);
        });
    }
});