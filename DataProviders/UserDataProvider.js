const express = require('express');
const router = express.Router();
const db = require('./db.js');

router.get('/register', (req, res) =>
    {
        db.query('CALL ')
    }
);

module.exports = router;