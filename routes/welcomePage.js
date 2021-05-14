const express = require("express");
const router = express.Router();
const mysql = require("mysql");

router.get("/", (req, resp) => {
  resp.render("welcomePage");
});

module.exports = router;
 