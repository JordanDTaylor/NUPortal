
var express = require("express");
var app = module.exports = express();
var server = require('../../app');
var sql = require("seriate");

app.get('/api/catalogcourses', function(req,res){
    var course_id = req.param('id');
	sql.execute({
		query: "SELECT Code, Name, Credits, Description FROM [Schedule].[Courses]"+(course_id?" WHERE Id = @courseId":""),
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
	});
});

