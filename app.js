var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var app = express();
var bodyParser = require('body-parser');
var path = require('path');
var fileUpload = require('express-fileupload');
var passport = require('passport');
var flash = require('connect-flash');

//EJS and APP Config
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));
app.use(express.static(__dirname + '/routes/uploads'));
app.use(fileUpload());
require('./config/passport')(passport);

// required for passport
app.use(
	session({
		secret: 'softwareengineering project running',
		resave: true,
		saveUninitialized: true
	})
); // session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

//Routes
app.use('/', require('./routes/welcomePage'));
app.use('/freeTimeScheduler', require('./routes/freeTimeScheduler'));
app.use('/projectsCollaborator', require('./routes/projectsCollaborator'));
app.use('/', require('./routes/authentication'));

let port = process.env.PORT;
if (port == null || port == '') {
	port = 8000;
}
app.listen(port, console.log(`Server started on port ${port}`));
