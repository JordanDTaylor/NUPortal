var sql = require("seriate");
var config = {
    "server": "174.27.128.80", //external = 174.27.128.80, internal = 192.168.0.61
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

app.use(function (req, res, next) {

    // Website you wish to allow to connect
    res.setHeader('Access-Control-Allow-Origin', 'http://localhost:3000');

    // Request methods you wish to allow
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');

    // Request headers you wish to allow
    res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');

    // Set to true if you need the website to include cookies in the requests sent
    // to the API (e.g. in case you use sessions)
    res.setHeader('Access-Control-Allow-Credentials', true);

    // Pass to next layer of middleware
    next();
});
//API modules
var contacts = require('./modules/contacts/contacts-api');
app.use(contacts);

//Angular route, rest of routes will be handled in angular.
app.get('*', function(req,res){
    res.sendfile('./public/index.html');
});

//====================================//
app.listen(8080);
console.log("App listening on port 8080");