const express = require('express');
var passport = require('passport');
const router = express.Router();
const { isLoggedIn, forwardAuthenticated } = require('../config/auth');

router.get('/login', forwardAuthenticated, function(req, res) {
	// render the page and pass in any flash data if it exists
	res.render('login.ejs', { message: req.flash('loginMessage') });
});
// process the login form
router.post(
	'/login',
	passport.authenticate('local-login', {
		successRedirect: '/profile', // redirect to the secure profile section
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
		successRedirect: '/profile', // redirect to the secure profile section
		failureRedirect: '/signup', // redirect back to the signup page if there is an error
		failureFlash: true // allow flash messages
	})
);

router.get('/profile', isLoggedIn, function(req, res) {
	// console.log(req.user.batch);
	res.render('profile.ejs', {
		user: req.user // get the user out of session and pass to template
	});
});

router.get('/logout', function(req, res) {
	req.logout();
	res.redirect('/');
});

module.exports = router;
