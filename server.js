const http = require('http');
var express = require('express');
var session = require('express-session');
var cookieParser = require('cookie-parser');
var path = require('path');
var fileUpload = require('express-fileupload');
const socketio = require('socket.io');
const formatMessage = require('./utils/messages');
const { userJoin, getCurrentUser } = require('./utils/users');
var bodyParser = require('body-parser');
var passport = require('passport');
var flash = require('connect-flash');

const app = express();
const server = http.createServer(app);
const io = socketio(server);
var mysql = require('mysql');
const { weekdays } = require('moment');
const { connect } = require('http2');
var fs = require('fs');

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, '')));
app.use(express.static(__dirname + '/routes/uploads'));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(fileUpload());
require('./config/passport')(passport);
const { isLoggedIn, forwardAuthenticated } = require('./config/auth');

// required for passport
app.use(
	session({
		secret: 'softwareengineering project running',
		resave: true,
		saveUninitialized: true
	})
);

// session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

//Routes
app.use('/', require('./routes/welcomePage'));
app.use('/freeTimeScheduler', require('./routes/freeTimeScheduler'));
app.use('/projectsCollaborator', require('./routes/projectsCollaborator'));
app.use('/', require('./routes/authentication'));

var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_project_testing2'
});

con.connect(function(error) {
	if (error) throw error;
});

//Socket js Routes
app.get('/room', function(req, res) {
	res.render('index.ejs');
});

var userFirstName = '';
var chatRoomId;

app.get('/chat/:projectId/:projectrequirementId/:regno', isLoggedIn, function(req, res) {
	var projectId = req.params.projectId;
	var requirementId = req.params.projectrequirementId;
	var regno = req.params.regno;
	var Query = `select * from chatrooms where requirementId = ${requirementId} and regno = "${regno}"`;
	con.query(Query, function(err, result) {
		if (err) throw err;
		else if (result[0] != null) {
			chatRoomId = result[0].chatRoomId;
			res.redirect('/chat/' + chatRoomId);
		} else {
			console.log(result[0]);
			con.query(`insert into chatrooms(requirementId,regno) values(${requirementId},"${regno}") `, function(
				err,
				result
			) {
				if (err) throw err;
				chatRoomId = result.insertId;
				con.query(`insert into chatroommembers(chatRoomId,regno) values(${chatRoomId},"${regno}")`, function(
					err,
					result
				) {
					if (err) throw err;
					var Query1 = `select regno from teammembers where projectId = ${projectId}`;
					con.query(Query1, function(err, result) {
						result.forEach((res) => {
							con.query(
								`insert into chatroommembers(chatRoomId,regno) values(${chatRoomId},"${res.regno}")`
							);
						});
						res.redirect('/chat/' + chatRoomId);
					});
				});
			});
		}
	});
});
app.get('/chat/:chatRoom', isLoggedIn, function(req, res) {
	chatRoomId = req.params.chatRoom;
	userFirstName = req.user.username;
	// console.log(userFirstName);
	con.query(
		`SELECT * from chatroommembers JOIN users_table ON users_table.regno = chatroommembers.regno WHERE chatroommembers.chatRoomId = ${chatRoomId}`,
		function(err, userInfo) {
			if (err) throw err;
			res.render('chat', {
				userFirstName: userFirstName,
				chatRoomId: chatRoomId,
				userInfo: userInfo
			});
		}
	);
});

app.get('/delete/chat/:chatRoom', isLoggedIn, function(req, res) {
	var chatRoom = req.params.chatRoom;
	con.query(`delete from chatrooms where chatRoomId = ${chatRoom}`, function(err, result) {
		if (err) throw err;
		res.redirect('/dashboard');
	});
});
app.get('/accept/:chatRoom', isLoggedIn, function(req, res) {
	var chatRoom = req.params.chatRoom;
	var projectIdQuery =
		'SELECT chatrooms.regno,projectrequirement.projectId FROM chatrooms JOIN projectrequirement ON chatrooms.requirementId=projectrequirement.requirementId WHERE chatRoomId=?';
	con.query(projectIdQuery, [ chatRoom ], function(err, projectId) {
		if (err) {
			console.log(err);
		}
		var regno = projectId[0].regno;
		var projectID = projectId[0].projectId;
		var memberStatus = 0;
		var teamMemberQuery = 'INSERT INTO teammembers(regno,projectId,memberStatus)values(?,?,?)';
		con.query(teamMemberQuery, [ regno, projectID, memberStatus ], function(err, result) {
			if (err) {
				console.log(err);
			}
			con.query(`delete from chatrooms where chatRoomId = ${chatRoom}`, function(err, result) {
				if (err) throw err;
				res.redirect('/dashboard');
			});
		});
	});
});

//Socket.io Code
const botName = 'Project Collaborator';

io.on('connection', (socket) => {
	let userFirstName = null;
	socket.on('details', function(data) {
		userFirstName = data.userFirstName;
	});
	// socket.on("joinRoom", ({ username, room }) => {
	//   const user = userJoin(socket.id, username, room);s
	//   socket.join(user.room);
	// });

	socket.emit('message', formatMessage(botName, 'Welcome to Project Collaborator!!'));

	//Broadcast when a user connects
	socket.broadcast.emit('message', formatMessage(botName, `${userFirstName} has joined the chat`));

	//Runs when client disconnects
	socket.on('disconnect', () => {
		io.emit('message', formatMessage(botName, `${userFirstName} has left the chat`));
	});

	//Listen for chatMessage
	socket.on('chatMessage', (msg) => {
		io.emit('message', formatMessage(userFirstName, msg));
		var mes = formatMessage(userFirstName, msg);
		console.log(mes.text, mes.username, mes.time);

		// Added into database
		con.query(
			`INSERT INTO messages (chatRoomId,user,message,time) values ("${chatRoomId}","${mes.username}","${mes.text}","${mes.time}")`,
			function(err, result) {
				if (err) throw err;
			}
		);
	});
});

// NEWLY ADDED

app.get('/get_messages', function(req, result) {
	con.query(
		`SELECT * FROM messages where chatRoomId = ${chatRoomId} `,
		// console.log()
		function(err, messages) {
			result.end(JSON.stringify(messages));
			console.log(messages);
		}
	);
});

// NEWLY ADDED

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
	console.log('App listening on port 3000!');
});
