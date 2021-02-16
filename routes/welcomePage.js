const express = require('express');
const router = express.Router();

router.get('/welcome', (req, resp) => {
	resp.render('welcomePage');
});

module.exports = router;
