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


var tokenkey = 'tokenkey';
var cookieParser = require('cookie-parser');
app.use(cookieParser(tokenkey));
var cookieSession = require('cookie-session');
app.use(cookieSession({keys:[tokenkey], maxAge:1000 * 60 * 60 * 24}));//maxAge is in miliseconds

var passport = require("passport");
var passportLocalStrategy = require("passport-local").Strategy;
passport.use('login', new passportLocalStrategy({passReqToCallback:true}, function(req,unam,pword,done){
	/*
	db.User.findOne({username:unam}, function(err,user){
		if(err){return done(err);}
		if(!user){return done(null, false, {message: 'Incorrect username/password'});}
		if(!bcrypt.compareSync(pword, user.password)){return done(null,false,{message: 'Incorrect username/password'});}
		return done(null,user);
	});
	*/
	if(unam=='tredmon'){
		if(pword=='redmon'){
			return done(null,{id:'1', username:unam, password:pword});
		}
	}
	return done(null,false,{message: 'Incorrect username/password'});
}));
passport.use('signup', new passportLocalStrategy({passReqToCallback:true}, function(req,unam,pword,done){
	/*
	db.User.findOne({username:unam}, function(err,user){
		if(err){return done(err);}
		if(user){return done(null, false, {message: 'Username not available'});}
		var newuser = {username:unam, password:bcrypt.hashSync(pword, bcrypt.genSaltSync(10), null), id:generateID()};
		db.User.save(newuser);
		req.login(newuser);
		return done(null, newuser);
	});
	*/
	return done(null, false, {message: 'Signup is not currently implemented'});
}));
passport.serializeUser(function(user,done){
    done(null, user.id);
});
passport.deserializeUser(function(userid,done){
    /*
	db.User.findById(userid, function(err,user){
		done(err, user);
	});
	*/
    done(null,{id:userid, username:'tredmon'});
});
app.use(passport.initialize());
app.use(passport.session());
var passportReqLoggedIn = function(req,res,next){
	if(req.isAuthenticated()){return next();}
	res.redirect('/login');
}
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
var contacts = require('./modules/contacts/contacts-api');
app.use(contacts);


app.get('*', passportErrNotLoggedIn, function(req,res){
    //req.user contains the authenticated user
	//TODO: send the actual data
    res.sendFile('public/loginsuccess.html', {root:'./'});
});


//====================================//
app.listen(8080);
console.log("App listening on port 8080");
