
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/allCourses', function(req,res){
    var course_id = req.param('id');
	sql.execute({
		query: "SELECT Code, Name, Credits, Description, Id FROM [Schedule].[Courses]"+(course_id?" WHERE Id = @courseId":""),
		params: {
			courseId: {
				type: sql.int,
				val: course_id,
			}
		}
	}).then(function (results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.json(err);
	});
});
app.get('/api/course', function(req,res){
    var course_id = Number(req.param('id')); if(course_id+""=="NaN"){course_id=undefined;}
	var course_code = req.param('code');
	if(course_id!=undefined && typeof(course_id)!='number'){
		res.status(400);
		res.send("Invalid Course ID");
		return;
	}
	if(course_id==undefined && course_code==undefined){
		res.status(400);
		res.send("Must supply a code or id");
		return;
	}
	var params = {};
	if(course_id!=undefined){
		params.courseId = {type:sql.int, val:course_id};
	}
	if(course_code!=undefined){
		params.courseCode = {type:sql.NVARCHAR, val:course_code};
	}
	sql.execute({
		query: "SELECT Code, Name, Credits, Description, Id FROM [Schedule].[Courses] WHERE"+(course_id!=undefined?" Id = @courseId"+(course_code!=undefined?" AND":""):"")+(course_code!=undefined?" Code = @courseCode":""),
		params: params
	}).then(function (results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.json(err);
	});
});
app.get('/api/coursePreReqs', function(req,res){
    var course_code = req.param('code');
	if(course_code==undefined){
		res.status(400);
		res.send("Invalid Course Code");
		return;
	}
	console.log(course_code);
	sql.execute({
		query: "SELECT RequiredCourse FROM [Schedule].[PreReqs] WHERE Course = @courseCode",
		params: {
			courseCode: {
				type: sql.NVARCHAR,
				val: course_code,
			}
		}
	}).then(function (results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.json(err);
	});
});



app.get('/api/allDegrees', function(req,res){
	sql.execute({
		query: "SELECT Name, Id FROM [Degree].[Degree]",
		params: {}
	}).then(function (results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.json(err);
	});
});
app.get('/api/degree', function(req,res){
	var degree_id = req.param('id');
	sql.execute({
		query: "SELECT Name, Id FROM [Degree].[Degree]"+(degree_id?" WHERE Id = @degreeid":""),
		params: {
			degreeid: {
				type: sql.NVARCHAR,
				val: degree_id,
			}
		}
	}).then(function(results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.json(err);
	});
});
app.get('/api/degreeReqs', function(req,res){
	var degree_id = req.param('id');
	sql.execute({
		query: "SELECT CourseCode as Code FROM [Degree].[DegreeTrack] JOIN [Degree].[DegreeTrackCourses] ON Id=DegreeTrackId"+(degree_id?" WHERE DegreeId=@degreeid":""),
		params: {
			degreeid: {
				type: sql.NVARCHAR,
				val: degree_id,
			}
		}
	}).then(function(results){
		res.json({results});
	}, function(err){
		console.log("Something bad happened: ",err);
		res.status(503);
		res.send(JSON.stringify(err));
	});
});

