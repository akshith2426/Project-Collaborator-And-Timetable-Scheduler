const express = require('express');
var app = express();
var passport = require('passport');
const router = express.Router();
var mysql = require('mysql');
const { isLoggedIn, forwardAuthenticated } = require('../config/auth');
var path = require('path');
var fileUpload = require('express-fileupload');
app.use(express.static(__dirname + '/public'));
var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_project',
	multipleStatements: true
});
con.connect(function(error) {
	if (error) throw error;
	console.log('MySQL Database Connected for Edit Profile Page');
});
router.get('/login', forwardAuthenticated, function(req, res) {
	// render the page and pass in any flash data if it exists
	res.render('login.ejs', { message: req.flash('loginMessage') });
});
// process the login form
router.post(
	'/login',
	passport.authenticate('local-login', {
		successRedirect: '/dashboard', // redirect to the secure profile section
		failureRedirect: '/login', // redirect back to the signup page if there is an error
		failureFlash: true // allow flash messages
	}),
	function(req, res) {
		// console.log('hello');
		if (req.body.remember) {
			req.session.cookie.maxAge = 1000 * 60 * 3;
		} else {
			req.session.cookie.expires = false;
		}
		res.redirect('/');
	}
);

router.get('/signup', forwardAuthenticated, function(req, res) {
	// render the page and pass in any flash data if it exists
	res.render('signup.ejs', { message: req.flash('signupMessage') });
});
router.post(
	'/signup',
	passport.authenticate('local-signup', {
		successRedirect: '/dashboard', // redirect to the secure profile section
		failureRedirect: '/signup', // redirect back to the signup page if there is an error
		failureFlash: true // allow flash messages
	})
);

router.get('/dashboard', isLoggedIn, function(req, res) {
	// console.log(req.user.batch);
	res.render('dashboard.ejs', {
		user: req.user // get the user out of session and pass to template
	});
});
router.get('/editProfile', isLoggedIn, function(req, res) {
	res.render('editProfile.ejs', {
		user: req.user
	});
});
router.post('/editProfile/:id', isLoggedIn, function(req, resp) {
	var id1 = req.params.id;
	var fullname = req.body.fullname;
	var username = req.body.username;
	var password = req.body.password;
	var regno = req.body.regno;
	var skillset = req.body.skillset;
	var subdomain1 = req.body.subdomain1;
	var subdomain2 = req.body.subdomain2;
	var subdomain3 = req.body.subdomain3;
	let imageUpload = req.files.imageUpload;
	let uploadPath = __dirname + '/uploads/' + imageUpload.name;

	if (!req.files || Object.keys(req.files).length === 0) {
		return resp.status(400).send('No Files were Uploaded');
	}
	console.log(imageUpload);
	imageUpload.mv(uploadPath, function(err) {
		if (err) {
			return resp.status(500).send(err);
		}
		var query_sql =
			'UPDATE users_table SET fullname=?,username=?,password=?,regno=?,skillset=?,subdomain1=?,subdomain2=?,subdomain3=?,image=? WHERE id=? ';
		con.query(
			query_sql,
			[
				fullname,
				username,
				password,
				regno,
				skillset,
				subdomain1,
				subdomain2,
				subdomain3,
				imageUpload.name,
				id1
			],
			function(mistake, result) {
				if (mistake) {
					throw err;
				} else {
					resp.redirect('/dashboard');
				}
			}
		);
	});
});
router.get('/logout', function(req, res) {
	req.logout();
	res.redirect('/');
});

module.exports = router;
