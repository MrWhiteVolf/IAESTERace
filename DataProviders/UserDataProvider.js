const express = require('express');
const router = express.Router();
const db = require('./db.js');
const bcrypt = require('bcrypt');

router.post('/register', (req, res) =>
    {
        bcrypt.hash(req.query.password, 10, (err,hash) =>{

            db.beginTransaction( (err) => {

                db.query('CALL CreateUser(\'' + req.query.Name + '\',\'' + req.query.Surname + '\',\'' + req.query.Email + '\',\'' + req.query.Phone + '\',\'' + req.query.AboutMe + '\',' + req.query.TeamId + ',\'' + hash + '\')', (error, result) => {
                    if(error)
                    {
                        db.rollback();
                        res.send(500);
                        console.log('CALL CreateUser(\'' + req.query.Name + '\',\'' + req.query.Surname + '\',\'' + req.query.Email + '\',\'' + req.query.Phone + '\',\'' + req.query.AboutMe + '\',' + req.query.TeamId + ',\'' + hash + '\')');
                    }
                    else
                    {
                        db.commit();
                        res.send(200);
                    }
                });
            });
        });
    }
);

router.post('/login'), (req, res) => {
    db.query('CALL Login(\'' + req.query.email + '\')', (err, result) => {
     if(err)
     {
         res.status(500);
         res.end();
     }
     else {
         bcrypt.compare(req.data.password, hash, (err,res) => {
            if(res) {
                sess.email = req.query.email;
                console.log('sth');
                console.log(result);
                res.status(200).sendFile('/home/mrwhitevolf/Dokumenty/IAESTE Race/Layout/index.html');
            }
            else {
                window.alert("Niepoprawne hasło!");
                res.status(200).sendFile();
            }
         });
     }
    });
};

module.exports = router;

