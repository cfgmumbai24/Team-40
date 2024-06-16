const express = require('express');
// const db = require('./db');
const dotenv = require('dotenv');
const pool = require('./db');
const activityRouter = require('./router/activityRouter');
const activityController = require('./controllers/activityController');
const teacherRouter = require('./router/teacherRouter')
const classRouter = require('./router/classRouter');
const stduentRouter = require('./router/studentRouter');
const loginRouter = require('./router/loginRouter');
const loginController = require('./controllers/login')
// const  parentRouter = require('./router/parentRouter');
const schoolRouter = require('./router/schoolRouter');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));
app.use(cors({
    origin:'*'
}))

app.use(express.json());
app.use(cookieParser());

app.use('/login',loginRouter);
app.use('/school', schoolRouter);
app.use('/activity', activityRouter);
app.use('/classes', classRouter);
app.use('/students', stduentRouter);
app.use('/teachers', teacherRouter);
module.exports = app;