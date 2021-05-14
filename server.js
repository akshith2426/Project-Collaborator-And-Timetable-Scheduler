const http = require("http");
var express = require("express");
var session = require("express-session");
var cookieParser = require("cookie-parser");
var path = require("path");
var fileUpload = require("express-fileupload");
const socketio = require("socket.io");
const formatMessage = require("./utils/messages");
const { userJoin, getCurrentUser } = require("./utils/users");
var bodyParser = require("body-parser");
var passport = require("passport");
var flash = require("connect-flash");

const app = express();
const server = http.createServer(app);
const io = socketio(server);
var mysql = require("mysql");
const { weekdays } = require("moment");
const { connect } = require("http2");
var fs = require("fs");

app.set("views", path.join(__dirname, "views"));
app.set("view engine", "ejs");
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, "public")));
app.use(express.static(path.join(__dirname, "")));
app.use(express.static(__dirname + "/routes/uploads"));
app.use(bodyParser.urlencoded({ extended: true }));
app.use(fileUpload());
require("./config/passport")(passport);
const { isLoggedIn, forwardAuthenticated } = require("./config/auth");

// required for passport
app.use(
  session({
    secret: "softwareengineering project running",
    resave: true,
    saveUninitialized: true,
  })
);

// session secret
app.use(passport.initialize());
app.use(passport.session()); // persistent login sessions
app.use(flash()); // use connect-flash for flash messages stored in session

//Routes
app.use("/", require("./routes/welcomePage"));
app.use("/freeTimeScheduler", require("./routes/freeTimeScheduler"));
app.use("/projectsCollaborator", require("./routes/projectsCollaborator"));
app.use("/", require("./routes/authentication"));

var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "software_projecttesting",
});

con.connect(function (error) {
  if (error) throw error;
});

//LATEST COMMNET
// const { isLoggedIn, forwardAuthenticated } = require("./config/auth");
//LATEST COMMNET

//Pervious Routes

// app.get("/signup", forwardAuthenticated, function (req, res) {
//   res.render("register.ejs", { message: req.flash("signupMessage") });
// });

// app.post(
//   "/signup",
//   passport.authenticate("local-signup", {
//     successRedirect: "/landing",
//     failureRedirect: "/signup",
//     failureFlash: true,
//   })
// );
// app.get("/login", forwardAuthenticated, function (req, res) {
//   res.render("login.ejs", { message: req.flash("loginMessage") });
// });
// app.post(
//   "/login",
//   passport.authenticate("local-login", {
//     successRedirect: "/landing",
//     failureRedirect: "/login",
//     failureFlash: true,
//   }),
//   function (req, res) {
//     // console.log('hello');
//     if (req.body.remember) {
//       req.session.cookie.maxAge = 1000 * 60 * 3;
//     } else {
//       req.session.cookie.expires = false;
//     }
//     res.redirect("/");
//   }
// );

// app.get("/logout", function (req, res) {
//   req.logout();
//   res.redirect("/");
// });
// //github124

// app.get("/landing", isLoggedIn, function (req, res) {
//   res.render("landing", { user: req.user });
// });

//Admin Login

//Socket js Routes
app.get("/room", function (req, res) {
  res.render("index.ejs");
});

var userFirstName = "";
var chatRoomId;

app.get("/chat/:projectId/:regno", isLoggedIn, function (req, res) {
  var projectId = req.params.projectId;
  var regno = req.params.regno;
  var Query = `select * from chatrooms where projectId = ${projectId} and regno = "${regno}"`;
  con.query(Query, function (err, result) {
    if (err) throw err;
    else if (result[0] != null) {
      chatRoomId = result[0].chatRoomId;
      res.redirect("/chat/" + chatRoomId);
    } else {
      console.log(result[0]);
      con.query(
        `insert into chatrooms(projectId,regno) values(${projectId},"${regno}") `,
        function (err, result) {
          if (err) throw err;
          chatRoomId = result.insertId;
          con.query(
            `insert into chatroommembers(chatRoomId,regno) values(${chatRoomId},"${regno}")`,
            function (err, result) {
              if (err) throw err;
              var Query1 = `select regno from teammembers where projectId = ${projectId}`;
              con.query(Query1, function (err, result) {
                result.forEach((res) => {
                  con.query(
                    `insert into chatroommembers(chatRoomId,regno) values(${chatRoomId},"${res.regno}")`
                  );
                });
                res.redirect("/chat/" + chatRoomId);
              });
            }
          );
        }
      );
    }
  });
});

app.get("/chat/:chatRoom", isLoggedIn, function (req, res) {
  chatRoomId = req.params.chatRoom;
  userFirstName = req.user.username;
  // console.log(userFirstName);
  res.render("chat", {
    userFirstName: userFirstName,
    chatRoomId: chatRoomId,
  });
});

//Socket.io Code
const botName = "ChatCord Bot";

io.on("connection", (socket) => {
  let userFirstName = null;
  socket.on("details", function (data) {
    userFirstName = data.userFirstName;
  });
  // socket.on("joinRoom", ({ username, room }) => {
  //   const user = userJoin(socket.id, username, room);s
  //   socket.join(user.room);
  // });

  socket.emit("message", formatMessage(botName, "Welcome to ChartCord!!"));

  //Broadcast when a user connects
  socket.broadcast.emit(
    "message",
    formatMessage(botName, `${userFirstName} has joined the chat`)
  );

  //Runs when client disconnects
  socket.on("disconnect", () => {
    io.emit(
      "message",
      formatMessage(botName, `${userFirstName} has left the chat`)
    );
  });

  //Listen for chatMessage
  socket.on("chatMessage", (msg) => {
    io.emit("message", formatMessage(userFirstName, msg));
    var mes = formatMessage(userFirstName, msg);
    console.log(mes.text, mes.username, mes.time);

    // Added into database
    con.query(
      `INSERT INTO messages (chatRoomId,user,message,time) values ("${chatRoomId}","${mes.username}","${mes.text}","${mes.time}")`,
      function (err, result) {
        if (err) throw err;
      }
    );
  });
});

// NEWLY ADDED
app.get("/get_messages", function (req, result) {
  con.query(
    `SELECT * FROM messages where chatRoomId = ${chatRoomId} `,
    // console.log()
    function (err, messages) {
      result.end(JSON.stringify(messages));
      console.log(messages);
    }
  );
});

// NEWLY ADDED

const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
  console.log("App listening on port 3000!");
});
