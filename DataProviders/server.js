var path = require('path');
const express = require('express');
const session = require('express-session');
const app = express();
const TeamController = require('./TeamDataProvider');
const LocalizationController = require('./LocalizationDataProvider');
const UserController = require('./UserDataProvider');

var sess;
app.use(session({secret: "Shh, its a secret!"}));
app.use('/team', TeamController);
app.use('/localization', LocalizationController);
app.use('/user', UserController);
app.use(express.static(path.join(__dirname, '/../../public')));
app.set('Layout', __dirname + '/../Layout');

app.get('*', function (req, res) {
   sess = req.session;
   if(sess.email)
   {
      res.type('html').sendFile("/home/mrwhitevolf/Dokumenty/IAESTE Race/Layout/index.html");
      console.log(sess.email);
   }
   else{
      res.type('html').sendFile("/home/mrwhitevolf/Dokumenty/IAESTE Race/Layout/login.html");
      console.log('false');
   }
   //res.sendFile('/home/mrwhitevolf/Dokumenty/IAESTE Race/Layout/login.html');
});


app.listen(3000);
