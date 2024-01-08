const express = require('express');
const app = express();
const port = 3100;
const db = require('./app/config/db/connect')

const route = require('./app/routes/Route');

app.use(express.json());

// route init
route(app);

// connect db
db.connect();



app.listen(port, ()=> console.log(`succes${port}`));
