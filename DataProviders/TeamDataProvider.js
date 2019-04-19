const express = require('express');
const router = express.Router();
const db = require('./db.js');

//dopisać update
router.post('/AddTeam', (req, res) => {
	db.query('CALL TEAMCREATE(\'' + req.query.Name + '\',\'' + req.query.Description + '\')');
	res.send(200);
});

router.get('/GetTeam', (req, res) => {
	db.query('CALL TEAMGET()', (err, result) => {
		if (err) throw err;
		res.status(200).send(result[0]);
	});
});

router.get('/GetTeamUsers', (req,res) => {
	db.query('CALL GetTeamUsers(\'' + req.query.TeamId + '\')', (err, result) => {
		if (err) res.status(500);
		res.status(200);
	});
});

router.get('/GetTeamsList', (req, res) => {
	db.query('CALL GetTeamsList()', (err, result) => {
		if(err) res.status(500);
		console.log(result[0]);
		res.status(200).send(result[0]);
	})
});

module.exports = router;
