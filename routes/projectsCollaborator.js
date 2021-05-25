const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const { isLoggedIn } = require('../config/auth');
var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_project_testing2',
	multipleStatements: true
});
con.connect(function(err) {
	if (err) throw err;
	console.log('MySQL Database Connected for projectsCollaborator Pages');
});

router.get('/projectsView', isLoggedIn, (req, resp) => {
	var retrieveQuery =
		'select * from projectrequirement join projectstable on projectrequirement.projectId=projectstable.projectId';
	var regno = req.user.regno;
	con.query(retrieveQuery, function(err, result) {
		if (err) throw err;
		console.log(result);
		resp.render('projectsView', {
			result: result,
			regno: regno
		});
	});
});
//Getting current timestamp
var month = new Array();
month[0] = 'January';
month[1] = 'February';
month[2] = 'March';
month[3] = 'April';
month[4] = 'May';
month[5] = 'June';
month[6] = 'July';
month[7] = 'August';
month[8] = 'September';
month[9] = 'October';
month[10] = 'November';
month[11] = 'December';
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

	return number + [ 'th', 'st', 'nd', 'rd', '' ][selector];
};
var date = todaysDate(today.getDate()) + ' ' + currentMonth + ' ' + today.getFullYear();
var time = today.getHours() + ':' + today.getMinutes();
var dateTime = date + ' at ' + time;
console.log(dateTime);
router.get('/newProject', isLoggedIn, (req, resp) => {
	resp.render('newProject', { user: req.user });
});

router.post('/newProject', isLoggedIn, (req, resp) => {
	var leaderRegNo = req.user.regno;
	var projectLeader = req.user.username;
	var projectTitle = req.body.projectTitle;
	var projectDescription = req.body.projectDescription;
	var projectMember = req.body.projectMember;
	projectMember.push(leaderRegNo);
	var query_sql = 'INSERT INTO projectstable (projectLeader,projectTitle,projectDescription) values (?,?,?)';
	var countQuery = 'SELECT * FROM projectstable ORDER BY projectId DESC LIMIT 1';
	var COUNT;
	con.query(countQuery, function(erro, answer) {
		if (erro) {
			throw erro;
		} else {
			COUNT = answer[0]['projectId'];
			console.log('latest project id: ' + COUNT);
		}
	});
	con.query(query_sql, [ projectLeader, projectTitle, projectDescription ], function(mistake, result) {
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
				var insertQuery = 'INSERT INTO teammembers(regno,projectId,memberStatus)values(?,?,?)';
				con.query(insertQuery, [ projectMember[k], COUNT + 1, memberStatus ], function(wrong, answer) {
					if (wrong) {
						throw wrong;
					}
				});
			}
			resp.redirect('/dashboard');
		}
	});
});

router.get('/newRequirement/:id', isLoggedIn, (req, resp) => {
	var projectId = req.params.id;
	var projSQL = 'SELECT * from projectstable where projectId=?';
	con.query(projSQL, [ projectId ], function(err, result) {
		if (err) {
			console.log(err);
		}
		//console.log(result[0].projectDescription);
		resp.render('newRequirement', { projectId: projectId, projectInfo: result });
	});
});
router.post('/newRequirement/:id', (req, resp) => {
	var projectId = req.params.id;
	var vacancyRole = req.body.vacancyRole;
	var requiredSkillSet = req.body.requiredSkillSet;
	var deadline = req.body.deadline;
	var timestamp = dateTime;
	var proj_SQL = 'SELECT projectDescription from projectstable where projectId=?';
	con.query(proj_SQL, [ projectId ], function(err, respone) {
		if (err) {
			console.log(err);
		}
		console.log(respone[0].projectDescription);
		var requirementQuery =
			'INSERT INTO projectrequirement(vacancyRole,requiredSkillSet, deadline, timestamp,projectId) VALUES(?,?,?,?,?)';
		con.query(requirementQuery, [ vacancyRole, requiredSkillSet, deadline, timestamp, projectId ], function(
			mistake,
			answer
		) {
			if (mistake) {
				console.log(mistake);
			}
			resp.redirect('/projectsCollaborator/projectsView');
		});
	});
});

router.get('/myProjects', isLoggedIn, (req, resp) => {
	var regno = req.user.regno;
	var username = req.user.username;
	var querySQL =
		'SELECT * FROM projectstable JOIN teammembers ON projectstable.projectId=teammembers.projectId WHERE teammembers.regno=?';
	con.query(querySQL, [ regno ], function(error, response) {
		if (error) {
			console.log(error);
		}
		//console.log(response);
		var requirementQuery =
			'SELECT * FROM projectrequirement JOIN projectstable ON projectrequirement.projectId=projectstable.projectId WHERE projectstable.projectLeader=? ';
		con.query(requirementQuery, [ username ], function(error, result) {
			if (error) {
				console.log(error);
			}
			console.log(result);
			resp.render('myProjects', { user: req.user, projectData: response, requirementData: result });
		});
	});
});

router.get('/deleteRequirement/:reqId', (req, resp) => {
	var requirementID = req.params.reqId;
	con.query(`DELETE from projectrequirement where requirementId=${requirementID}`, function(err, result) {
		if (err) throw err;
		resp.redirect('/projectsCollaborator/myProjects');
	});
});
module.exports = router;
