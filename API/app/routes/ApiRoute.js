const express = require('express');
const ApiControl = require('../controller/APIcontroller')
const router = express.Router();


// Get all, id, slug
router.get('/user/allId', ApiControl.getAll_ID);
router.get('/user/:id', ApiControl.getUserID)
router.get('/user', ApiControl.getUser);

// POST user
router.post('/user', ApiControl.addUser);

// Put a User
router.put('/user/:id', ApiControl.updateUser);

// DELETE a user
router.delete('/user/:id', ApiControl.deleteUser);
// router.delete('/user/deleteALL', ApiControl.deleteAllUser)

module.exports = router;