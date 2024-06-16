const express = require('express');
const router = express.Router();
const schoolController = require('../controllers/schoolController.js');
router.route('/').get(schoolController.getAll);
router.route('/:schoolId').get(schoolController.getAllClassesForSchool);
router.route('/:schoolId/classes').get(schoolController.getClass);
module.exports = router;