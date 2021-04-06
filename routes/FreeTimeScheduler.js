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

module.exports = router;
