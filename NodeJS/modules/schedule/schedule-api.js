
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/studentScheduleHistory', server.passportReqLoggedIn, function(req,res){
    var student_id = req.user.id;
        sql.execute({
            query: "SELECT c.Code, c.Name, c.Credits, ac.Passed, ac.GradePercent FROM Schedule.AttemptedCourses ac LEFT JOIN Schedule.ScheduledEvents se ON ac.ScheduledEventId = se.Id LEFT JOIN Schedule.Courses c ON se.Course_Id = c.Id WHERE ac.StudentId = @studentId",
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

app.get('/api/currentlyEnrolledStudentSchedule', server.passportReqLoggedIn, function(req,res){
   var student_id = req.user.id;
        sql.execute({
            query: "SELECT  c.Code, c.Name, c.Credits, se.StartTime, se.EndTime, se.Monday, se.Tuesday, se.Wednesday, se.Thursday, se.Friday, se.Room FROM (Schedule.RegisteredCourses rc LEFT JOIN Schedule.ScheduledEvents se ON rc.ScheduledCourse = se.Id) Left Join Schedule.Courses c on se.Course_Id = c.Id WHERE rc.StudentId = @studentId",
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
   var student_id = req.user.id;
        sql.execute({
            query: "SELECT pc.CourseCode, pc.[Quarter] FROM Schedule.PlannedCourses pc WHERE pc.StudentId = @studentId",
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