const express = require('express');
const router = express.Router();
const mysql = require('mysql');

router.get('/', (req, resp) => {
	var userData = req.user;
	//console.log(userData);
	resp.render('welcomePage', { userData: userData });
});

module.exports = router;
