const express = require('express');
const router = express.Router();
const activityController = require('../controllers/activityController');
router.route('/').get(activityController.getAll);
router.route('/').post(activityController.createActivity);
module.exports = router;