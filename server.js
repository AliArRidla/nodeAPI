const express = require('express');
const bodyParser = require('body-parser');

var morgan = require('morgan');
const app = express();
var cors = require('cors');

const port = 3001

//parse application/json
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
app.use(morgan('dev'));
app.use(cors());

//panggil routes
var routes = require('./routes');
routes(app);

//daftarkan menu routes dari index
app.use('/auth', require('./middleware'));

app.listen(port, () => console.log(`Example app listening on port port!`))