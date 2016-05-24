var sql = require("seriate");
var config = {
    "server": "174.27.128.80", //external = 174.27.132.81, internal = 192.168.0.61
    "user": "sa",
    "password": "Password1",
    "database": "Test"
};
var express = require('express');
var app = express();
var morgan = require('morgan');
var bodyParser = require('body-parser');
var methodOverride = require('method-override');

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({'extended':'true'}));
app.use(bodyParser.json());
app.use(bodyParser.json({ type: 'application/vnd.api+json' })); 
app.use(methodOverride());
sql.setDefaultConfig(config);
exports.sql = sql;
//API modules
var contacts = require('./modules/contacts/contacts-api');
app.use(contacts);

var financial = require('./modules/financial/transactions-api');
app.use(financial);

//Angular route, rest of routes will be handled in angular.
app.get('*', function(req,res){
    res.sendfile('./public/index.html');
});

//====================================//
app.listen(8080);
console.log("App listening on port 8080");