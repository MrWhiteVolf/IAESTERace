const express = require('express');
const router = express.Router();
const db = require('./db.js');
router.get('/GetCurrentLocalization', (request, response) => {
    db.query("CALL GetCurrentLocalization(" + request.query.UserId + ");"
        , function(err,result) {
            if (err) {
                throw err;
            }
            else {
                res.status(200).send(result[0]);
            }
        });
});

router.get('/GetUsersTrace', (req, res) => {
   db.query('CALL GetUsersTrace(' + req.query.UserID + ')', (err, result) => {
       if(err) {
           res.send(500);
       }
       else {
           res.status(200).send(result);
       }
   });
});
//Zastanowić się nad przekazywaniem timestampa z fronta, bo co jeśli ktoś nie będzie miał neta przez chwilę
router.post('/AddUsersLocalization', (req, res) =>{
    db.query('CALL AddUsersLocalization(' + req.query.UserId + ',' + req.query.Lat + ',' + req.query.Lon + ')', (err) =>
    {
        if(err){
            res.send(500);
        }
        else
        {
            res.send(200);
        }
    });
})

module.exports = router;