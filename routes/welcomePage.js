const express = require('express');
const router = express.Router();
const mysql = require('mysql');

// var con = mysql.createConnection({
// 	host: 'localhost',
// 	user: 'root',
// 	password: '',
// 	database: 'software_project',
// 	multipleStatements: true
// });
// con.connect(function(err) {
// 	if (err) throw err;
// 	console.log('MySQL Database Connected');
// });

router.get('/welcome', (req, resp) => {
	resp.render('welcomePage');
});

module.exports = router;
