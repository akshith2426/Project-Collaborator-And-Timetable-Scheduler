const express = require("express");
const router = express.Router();
const mysql = require("mysql");
const { isLoggedIn } = require("../config/auth");
var con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "software_project",
  multipleStatements: true,
});
con.connect(function (err) {
  if (err) throw err;
  console.log("MySQL Database Connected for freeTimeScheduler Pages");
});

//Batch Routes

router.get("/MTEL", isLoggedIn, (req, resp) => {
  resp.render("eveningLab");
});

router.get("/MLET", isLoggedIn, (req, resp) => {
  resp.render("morningLab");
});

//Free Slots

router.get("/freeSlots/MorningLab", isLoggedIn, (req, res) => {
  var id = req.user.id;
  var insertQuery = "select * from timetablescheduler where id = ?";
  var query = mysql.format(insertQuery, [id]);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.render("freeSlotsMorningLab", {
      result: result,
    });
  });
});

router.get("/freeSlots/EveningLab", isLoggedIn, (req, res) => {
  var id = req.user.id;
  var insertQuery = "select * from timetablescheduler where id = ?";
  var query = mysql.format(insertQuery, [id]);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.render("freeSlotsEveningLab", {
      result: result,
    });
  });
});

router.post("/freeSlots/MorningLab", (req, res) => {
  var id = req.user.id;
  var free = req.body.freeSlots;
  var freeSlots = JSON.parse(free);
  var insertQuery = "insert into timetablescheduler (freeSlot,id) values ?";
  var query = mysql.format(insertQuery, [freeSlots.map((elm) => [elm, id])]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    res.redirect("/freeTimeScheduler/freeSlots/MorningLab");
  });
});

router.post("/freeSlots/EveningLab", (req, res) => {
  var id = req.user.id;
  var free = req.body.freeSlots;
  var freeSlots = JSON.parse(free);
  var insertQuery = "insert into timetablescheduler (freeSlot,id) values ?";
  var query = mysql.format(insertQuery, [freeSlots.map((elm) => [elm, id])]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    res.redirect("/freeTimeScheduler/freeSlots/EveningLab");
  });
});

// Adding Tasks

router.get("/today/MorningLab", isLoggedIn, (req, res) => {
  var id = req.user.id;
  var insertQuery = "select * from timetablescheduler where id = ?";
  var query = mysql.format(insertQuery, [id]);
  con.query(query, function (err, result) {
    if (err) throw err;
    res.render("todayMorningLab", {
      result: result,
    });
  });
});

router.get("/today/EveningLab", isLoggedIn, (req, res) => {
  var id = req.user.id;
  var insertQuery = "select * from timetablescheduler where id = ?";
  var query = mysql.format(insertQuery, [id]);
  con.query(query, function (err, result) {
    if (err) throw err;
    res.render("todayEveningLab", {
      result: result,
    });
  });
});

//Editing Tasks

router.get("/edit/:id", isLoggedIn, (req, res) => {
  var id = req.params.id;
  res.render("edit", {
    id: id,
  });
});

router.get("/edit/EveningLab/:id", isLoggedIn, (req, res) => {
  var id = req.params.id;
  res.render("editEveningLab", {
    id: id,
  });
});

router.get("/edit/all/:id", isLoggedIn, (req, res) => {
  var id = req.params.id;
  res.render("editAll", {
    id: id,
  });
});

router.get("/edit/all/EveningLab/:id", isLoggedIn, (req, res) => {
  var id = req.params.id;
  res.render("editAllEveningLab", {
    id: id,
  });
});

router.post("/edit", isLoggedIn, (req, res) => {
  var freeSlotid = req.body.freeSlotid;
  var task = req.body.task;
  var id = req.user.id;
  console.log(freeSlotid, task);
  var inserQuery =
    "update timetablescheduler set task = ? where freeSlotid = ?";
  var query = mysql.format(inserQuery, [task, freeSlotid]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.redirect("/freeTimeScheduler/today/MorningLab");
  });
});

router.post("/edit/EveningLab", isLoggedIn, (req, res) => {
  var freeSlotid = req.body.freeSlotid;
  var task = req.body.task;
  var id = req.user.id;
  console.log(freeSlotid, task);
  var inserQuery =
    "update timetablescheduler set task = ? where freeSlotid = ?";
  var query = mysql.format(inserQuery, [task, freeSlotid]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.redirect("/freeTimeScheduler/today/EveningLab");
  });
});

router.post("/edit/all", isLoggedIn, (req, res) => {
  var freeSlotid = req.body.freeSlotid;
  var task = req.body.task;
  var id = req.user.id;
  console.log(freeSlotid, task);
  var inserQuery =
    "update timetablescheduler set task = ? where freeSlotid = ?";
  var query = mysql.format(inserQuery, [task, freeSlotid]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.redirect("/freeTimeScheduler/freeSlots/MorningLab");
  });
});

router.post("/edit/all/EveningLab", isLoggedIn, (req, res) => {
  var freeSlotid = req.body.freeSlotid;
  var task = req.body.task;
  var id = req.user.id;
  console.log(freeSlotid, task);
  var inserQuery =
    "update timetablescheduler set task = ? where freeSlotid = ?";
  var query = mysql.format(inserQuery, [task, freeSlotid]);
  console.log(query);
  con.query(query, function (err, result) {
    if (err) throw err;
    console.log(result);
    res.redirect("/freeTimeScheduler/freeSlots/EveningLab");
  });
});

module.exports = router;
