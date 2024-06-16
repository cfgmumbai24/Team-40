const express = require('express');
const router = express.Router();
const classController = require('../controllers/classController.js');
router.route('/:classId').get(classController.getClassAc);
router.route('/:classId/activity').get(classController.getActivity)
router.route('/').post(classController.createActivityById)
module.exports = router;