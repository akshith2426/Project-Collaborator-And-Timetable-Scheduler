var LocalStrategy = require('passport-local').Strategy;
var mysql = require('mysql');
var bcrypt = require('bcryptjs');

var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_projecttesting',
	multipleStatements: true
});
con.connect(function(error) {
	if (error) throw error;
	console.log('MySQL Database Connected for authentication Pages');
});

module.exports = function(passport) {
	// passport session setup
	// required for persistent login sessions
	// passport needs ability to serialize and unserialize users out of session
	// used to serialize the user for the session
	passport.serializeUser(function(user, done) {
		done(null, user.regno);
	});

	// used to deserialize the user
	passport.deserializeUser(function(regno, done) {
		con.query('SELECT * FROM users_table WHERE regno = ? ', [ regno ], function(err, rows) {
			done(err, rows[0]);
		});
	});

	// LOCAL SIGNUP
	// we are using named strategies since we have one for login and one for signup
	// by default, if there was no name, it would just be called 'local'
	passport.use(
		'local-signup',
		new LocalStrategy(
			{
				// by default, local strategy uses username and password, we will override with email
				usernameField: 'username',
				passwordField: 'password',
				passReqToCallback: true // allows us to pass back the entire request to the callback
			},
			function(req, username, password, done) {
				// find a user whose email is the same as the forms email
				// we are checking to see if the user trying to login already exists
				con.query('SELECT * FROM users_table WHERE username = ?', [ username ], function(fault, rows) {
					if (fault) return done(fault);
					if (rows.length) {
						return done(null, false, req.flash('signupMessage', 'That username is already taken.'));
					} else {
						// if there is no user with that username
						// create the user
						var newUserMysql = {
							username: username,
							password: password,
							fullname: req.body.fullname,
							regno: req.body.regno,
							batch: req.body.batch
						};
						// console.log(req.body);

						var insertQuery =
							'INSERT INTO users_table ( username,password ,fullname,regno,batch ) values (?,?,?,?,?)';
						con.query(
							insertQuery,
							[
								newUserMysql.username,
								newUserMysql.password,
								newUserMysql.fullname,
								newUserMysql.regno,
								newUserMysql.batch
							],
							function(mistake, row) {
								newUserMysql.id = row.insertId;
								return done(null, newUserMysql);
							}
						);
					}
				});
			}
		)
	);
	// LOCAL LOGIN ===================
	// we are using named strategies since we have one for login and one for signup
	// by default, if there was no name, it would just be called 'local'
	passport.use(
		'local-login',
		new LocalStrategy(
			{
				// by default, local strategy uses username and password, we will override with email
				usernameField: 'username',
				passwordField: 'password',
				passReqToCallback: true // allows us to pass back the entire request to the callback
			},
			function(req, username, password, done) {
				// callback with email and password from our form
				con.query('SELECT * FROM users_table WHERE username = ?', [ username ], function(err, rows) {
					if (err) return done(err);
					if (!rows.length) {
						return done(null, false, req.flash('loginMessage', 'No user found.')); // req.flash is the way to set flashdata using connect-flash
					}
					// if the user is found but the password is wrong
					if (password !== rows[0].password)
						return done(null, false, req.flash('loginMessage', 'Oops! Wrong password.')); // create the loginMessage and save it to session as flashdata
					// all is well, return successful user
					return done(null, rows[0]);
				});
			}
		)
	);
};
