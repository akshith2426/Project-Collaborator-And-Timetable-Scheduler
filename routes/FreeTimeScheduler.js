const express = require('express');
const router = express.Router();
const mysql = require('mysql');

var con = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: '',
	database: 'software_project',
	multipleStatements: true
});
con.connect(function(err) {
	if (err) throw err;
	console.log('MySQL Database Connected');
});

router.get('/MTEB', (req, resp) => {
	resp.render('morTheoEvngLab');
});
router.get('/MLET', (req, resp) => {
	resp.render('morLabEvngTheo');
});

module.exports = router;
