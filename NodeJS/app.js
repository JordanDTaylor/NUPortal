var sql = require("seriate");
var config = {
    "server": "174.27.128.80", //external = 174.27.128.80, internal = 192.168.0.61
    "user": "sa",
    "password": "Password1",
    "database": "Test"
};
/*
var config = {
    "server": "10.10.14.13",
    "user": "TRedmon",
    "password": "class",
    "database": "TRedmondb",
};
*/
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
    res.setHeader('Access-Control-Allow-Origin', '*');

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


var tokenkey = 'tokenkey';
var cookieParser = require('cookie-parser');
app.use(cookieParser(tokenkey));
var cookieSession = require('cookie-session');
var sessionMaxAge = 1000 * 60 * 60 * 24;
app.use(cookieSession({keys:[tokenkey], maxAge:sessionMaxAge}));//maxAge is in miliseconds

var uuid = require("node-uuid");
var bcrypt = require("bcrypt-nodejs");
var passport = require("passport");
var passportLocalStrategy = require("passport-local").Strategy;

function passportLocalSetPassword(userid, pword){
	var passhash = bcrypt.hashSync(pword, bcrypt.genSaltSync(10), null)	
	sql.execute({
		query: "UPDATE Passport.LocalLogins SET password=@hash WHERE PersonId=@id",
		params: {
			id:{
				type: sql.INT,
				val: userid
			},
			hash:{
				type: sql.NVARCHAR,
				val: passhash
			}
		}
	}).then(function(sqlres){
		return;
	}, function(err){
		console.log(JSON.stringify(err));
		return err;
	});
}
passport.use('login', new passportLocalStrategy({passReqToCallback:true}, function(req,unam,pword,done){
	sql.execute({
		query: "SELECT username, password, PersonId as id FROM Passport.LocalLogins WHERE username=@usernam",
		params: {
			usernam:{
				type: sql.NVARCHAR,
				val: unam
			}
		}
	}).then(function(sqlres){
		if(sqlres.length>0 && bcrypt.compareSync(pword, sqlres[0].password)){
			return done(null, {id:sqlres[0].id, username:sqlres[0].username});
		}
		else{
			return done(null,false,{message:'Incorrect username/password'});
		}
	}, function(err){
		return done(err);
	});
}));
passport.use('signup', new passportLocalStrategy({passReqToCallback:true}, function(req,unam,pword,done){
	return done(null, false, {message: 'Signup is not currently implemented'});
}));
passport.serializeUser(function(user,done){
	var token = uuid.v4();
	sql.execute({
		query: "INSERT INTO Passport.LocalTokens VALUES(@token, @username, @expires)",
		params: {
			token:{
				type: sql.VARCHAR,
				val: token
			},
			username:{
				type: sql.NVARCHAR,
				val: user.username
			},
			expires:{
				type: sql.DATETIME,
				val: new Date(new Date().getTime()+sessionMaxAge)
			}
		}
	}).then(function(sqlres){
		return done(null, token);
	}, function(err){
		console.log(JSON.stringify(err));
		return done(err);
	});
});
passport.deserializeUser(function(token,done){
	sql.execute({
		query: "SELECT tok.username, PersonId as id, expiry FROM Passport.LocalTokens as tok JOIN Passport.LocalLogins as log ON tok.username=log.username WHERE token=@token",
		params: {
			token:{
				type: sql.VARCHAR,
				val: token
			}
		}
	}).then(function(sqlres){
		if(sqlres.length>0){
			if(new Date(sqlres[0].expiry).getTime() > new Date().getTime()){
				return done(null, {id:sqlres[0].id, username:sqlres[0].username});
			}
			else{
				return done(null,false,{message:'Token Expired'});
			}
		}
		else{
			return done(null,false,{message:'Invalid User'});
		}
	}, function(err){
		return done(err);
	});
});
app.use(passport.initialize());
app.use(passport.session());
var passportReqLoggedIn = function(req,res,next){
	if(req.isAuthenticated()){return next();}
	res.redirect('/login');
}
exports.passportReqLoggedIn = passportReqLoggedIn;
var passportErrNotLoggedIn = function(req,res,next){
	if(req.isAuthenticated()){return next();}
	res.status(401);
	res.send('Not Logged In');
}
exports.passportErrNotLoggedIn = passportErrNotLoggedIn;

app.get('/login', function(req,res){
    res.sendFile('public/login.html', {root:'./'});
});
app.post('/login', passport.authenticate('login', {session:true, failureRedirect:'/login', successRedirect:'/loginsuccess'}));
app.get('/logout', function(req,res){
	req.logout();
	res.redirect('/login');
});
app.get('/loginsuccess', passportReqLoggedIn, function(req,res){res.sendFile('public/loginsuccess.html',{root:'./'})});

//API modules
app.use(require('./modules/contacts/contacts-api'));
app.use(require('./modules/catalog/catalog-api'));
app.use(require('./modules/financial/transactions-api'));
app.use(require('./modules/schedule/schedule-api'));

app.get('*', passportErrNotLoggedIn, function(req,res){
    //req.user contains the authenticated user
	//TODO: send the actual data
    res.sendFile('public/loginsuccess.html', {root:'./'});
});

//Use this for local
app.listen(8080);

// Use this on the server
//app.listen(process.env.PORT);
