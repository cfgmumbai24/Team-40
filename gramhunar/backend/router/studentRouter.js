const express = require('express');
const router = express.Router();
const studentController = require('../controllers/studentController.js');
router.route('/').get(studentController.getAll);
router.route('/:id').get(studentController.getClassAc);
router.route('/class/:classId').get(studentController.getAllClassesForSchool);
module.exports = router;
