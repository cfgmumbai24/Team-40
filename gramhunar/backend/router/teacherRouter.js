const express = require('express');
const router = express.Router();
const teacherController = require('../controllers/teacherController.js');
router.route('/:id/classes').get(teacherController.getAll);
module.exports = router;
