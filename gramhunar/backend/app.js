const express = require('express');
// const db = require('./db');
const dotenv = require('dotenv');
const pool = require('./db');
const activityRouter = require('./router/activityRouter');
const activityController = require('./controllers/activityController')
// const adminRouter = require('./router/adminRouter');
// const classRouter = require('./router/classRouter');
const schoolController = require('./controllers/schoolController')
const loginRouter = require('./router/loginRouter');
const loginController = require('./controllers/login')
// const  parentRouter = require('./router/parentRouter');
const schoolRouter = require('./router/schoolRouter');
// const appError = require('project/appError.js');

const cors = require('cors');
const cookieParser = require('cookie-parser');
const bodyParser = require('body-parser');
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));
// app.use(cors({
//     origin:'http://localhost:3000',
//     credentials:true
// }))

app.use(express.json());
app.use(cookieParser());
app.use('/login',loginRouter);
app.use('/school', schoolRouter);
app.get('/activity', async (req, res) => {
  console.log("working");
    try {
      const sqlQuery = 'SELECT * FROM activities';
      const rows = await pool.query(sqlQuery, []);

      res.status(200).json({
        status: 'success',
        data: rows,
      });

    } catch (error) {
      console.error('Error in getting activity:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
  });
// app.use('/activity', activityRouter);
module.exports = app;