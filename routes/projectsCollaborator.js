const express = require("express");
const router = express.Router();
const mysql = require("mysql");
const { isLoggedIn } = require("../config/auth");
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "software_projecttesting",
  multipleStatements: true,
});
con.connect(function (err) {
  if (err) throw err;
  console.log("MySQL Database Connected for projectsCollaborator Pages");
});

router.get("/projectsView", isLoggedIn, (req, resp) => {
  var retrieveQuery = "select * from projectstable";
  var regno = req.user.regno;
  con.query(retrieveQuery, function (err, result) {
    if (err) throw err;
    resp.render("projectsView", {
      result: result,
      regno: regno,
    });
  });
});
//Getting current timestamp
var month = new Array();
month[0] = "January";
month[1] = "February";
month[2] = "March";
month[3] = "April";
month[4] = "May";
month[5] = "June";
month[6] = "July";
month[7] = "August";
month[8] = "September";
month[9] = "October";
month[10] = "November";
month[11] = "December";
var today = new Date();
var currentMonth = month[today.getMonth()];
const todaysDate = (number) => {
  let selector;

  if (number <= 0) {
    selector = 4;
  } else if ((number > 3 && number < 21) || number % 10 > 3) {
    selector = 0;
  } else {
    selector = number % 10;
  }

  return number + ["th", "st", "nd", "rd", ""][selector];
};
var date =
  todaysDate(today.getDate()) + " " + currentMonth + " " + today.getFullYear();
var time = today.getHours() + ":" + today.getMinutes();
var dateTime = date + " at " + time;

router.get("/newProject", isLoggedIn, (req, resp) => {
  resp.render("newProject", { user: req.user });
});

router.post("/newProject", isLoggedIn, (req, resp) => {
  console.log("**");
  var leaderRegNo = req.user.regno;
  var projectLeader = req.user.username;
  var projectTitle = req.body.projectTitle;
  var projectDescription = req.body.projectDescription;
  var vacancyRole = req.body.vacancyRole;
  var projectMember = req.body.projectMember;
  // console.log(req.body);
  projectMember.push(leaderRegNo);
  console.log(projectMember);
  var requiredSkillSet = req.body.requiredSkillSet;
  var deadline = req.body.deadline;
  var timestamp = dateTime;
  var query_sql =
    "INSERT INTO projectstable (projectLeader,projectTitle,projectDescription,vacancyRole,requiredSkillSet,deadline,timestamp) values (?,?,?,?,?,?,?)";
  var countQuery =
    "SELECT * FROM projectstable ORDER BY projectId DESC LIMIT 1";
  var COUNT;
  con.query(countQuery, function (erro, answer) {
    if (erro) {
      throw erro;
    } else {
      COUNT = answer[0]["projectId"];
      console.log("latest project id: " + COUNT);
    }
  });
  con.query(
    query_sql,
    [
      projectLeader,
      projectTitle,
      projectDescription,
      vacancyRole,
      requiredSkillSet,
      deadline,
      timestamp,
    ],
    function (mistake, result) {
      if (mistake) {
        throw mistake;
      } else {
        for (var k = 0; k < projectMember.length; k++) {
          //memberStatus =0 is for teamMembers
          //memberStatus =1 is for teamLeaders
          var memberStatus = 0;
          if (req.user.regno == projectMember[k]) {
            memberStatus = 1;
          }
          var insertQuery =
            "INSERT INTO teammembers(regno,projectId,memberStatus)values(?,?,?)";
          con.query(
            insertQuery,
            [projectMember[k], COUNT + 1, memberStatus],
            function (wrong, answer) {
              if (wrong) {
                throw wrong;
              }
            }
          );
        }
        resp.redirect("/projectsCollaborator/projectsView");
      }
    }
  );
});
module.exports = router;
