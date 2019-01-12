const express = require('express');
const router = express.Router();
const db = require('../db.js');

//dopisać update
router.post('/add', (req, res) => {
	db.query('CALL TEAMCREATE(\'' + req.query.Name + '\',\'' + req.query.Description + '\')');
	res.send(200);
});

router.get('/get', (req, res) => {
	db.query('CALL TEAMGET()', (err, result) => {
		if (err) throw err;
		res.status(200).send(result[0]);
	});
});

module.exports = router;
