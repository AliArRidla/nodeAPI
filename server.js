const express = require('express')
const bodyParser = require('body-parser');
const app = express()
const port = 3000


app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

var routes = require('./routes');
routes(app);

// app.get('/', (req, res) => res.send('Hello World!')) 
app.listen(port, () => console.log(`Example app listening on port port!`))