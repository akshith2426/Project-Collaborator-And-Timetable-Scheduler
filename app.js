var express = require('express');
var app = express();
var bodyParser = require('body-parser');

//EJS and APP Config
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

//Routes
app.use('/', require('./routes/welcomePage'));

let port = process.env.PORT;
if (port == null || port == '') {
	port = 8000;
}
app.listen(port, console.log(`Server started on port ${port}`));
