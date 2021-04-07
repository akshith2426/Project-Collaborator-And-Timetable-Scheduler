const express = require('express');
const router = express.Router();
const mysql = require('mysql');
const { isLoggedIn } = require('../config/auth');
var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_project',
	multipleStatements: true
});
con.connect(function(err) {
	if (err) throw err;
	console.log('MySQL Database Connected for freeTimeScheduler Pages');
});

//Batch Routes

router.get('/MTEL', isLoggedIn, (req, resp) => {
	resp.render('morTheoEvngLab');
});

router.get('/MLET', isLoggedIn, (req, resp) => {
	resp.render('morLabEvngTheo');
});

//Free Slots

router.get('/freeSlots', isLoggedIn, (req, res) => {
	var id = req.user.id;
	var inserQuery = 'select * from timetablescheduler where id = ?';
	var query = mysql.format(inserQuery, [ id ]);
	con.query(query, function(err, result) {
		if (err) throw err;
		res.render('freeSlots', {
			result: result,
			user: req.user
		});
	});
});

router.post('/freeSlots', (req, res) => {
	var id = req.user.id;
	var free = req.body.freeSlots;
	var freeSlots = JSON.parse(free);
	var inserQuery = 'insert into timetablescheduler (freeSlot,id) values ?';
	var query = mysql.format(inserQuery, [ freeSlots.map((elm) => [ elm, id ]) ]);
	console.log(query);
	con.query(query, function(err, result) {
		if (err) throw err;
		res.send('Free Slots inserted in Database');
	});
});

// Adding Tasks

router.get('/today', isLoggedIn, (req, res) => {
	var id = req.user.id;
	var insertQuery = 'select * from timetablescheduler where id = ?';
	var query = mysql.format(insertQuery, [ id ]);
	con.query(query, function(err, result) {
		if (err) throw err;
		res.render('today', {
			result: result
		});
	});
});

//Editing Tasks

router.get('/edit/:id', isLoggedIn, (req, res) => {
	var id = req.params.id;
	res.render('edit', {
		id: id
	});
});

router.get('/edit/all/:id', isLoggedIn, (req, res) => {
	var id = req.params.id;
	res.render('editAll', {
		id: id
	});
});

router.post('/edit', isLoggedIn, (req, res) => {
	var freeSlotid = req.body.freeSlotid;
	var task = req.body.task;
	var id = req.user.id;
	console.log(freeSlotid, task);
	var inserQuery = 'update timetablescheduler set task = ? where freeSlotid = ?';
	var query = mysql.format(inserQuery, [ task, freeSlotid ]);
	console.log(query);
	con.query(query, function(err, result) {
		if (err) throw err;
		console.log(result);
		res.redirect('/freeTimeScheduler/today');
	});
});

router.post('/edit/all', isLoggedIn, (req, res) => {
	var freeSlotid = req.body.freeSlotid;
	var task = req.body.task;
	var id = req.user.id;
	console.log(freeSlotid, task);
	var inserQuery = 'update timetablescheduler set task = ? where freeSlotid = ?';
	var query = mysql.format(inserQuery, [ task, freeSlotid ]);
	console.log(query);
	con.query(query, function(err, result) {
		if (err) throw err;
		console.log(result);
		res.redirect('/freeTimeScheduler/freeSlots');
	});
});

module.exports = router;

{
	/* <form action="/freeTimeScheduler/edit/<%=res.freeSlotId%>" method="POST">
  <input type="text" name="task" />
  <input type="text" name="freeSlotid" value="<%=res.freeSlotId%>" />
  <input type="submit" />
</form>; */
}
