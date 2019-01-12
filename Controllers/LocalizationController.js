const express = require('express');
const router = express.Router();
const db = require('../db.js');
router.get('/GetCurrentLocalization', (request, response) => {
    db.query("CALL GetCurrentLocalization(" + request.query.UserId + ");"
        , function(err,result, fields) {
            if (err) throw err;
            console.log(result);
        });
});
module.exports = router;