const path = require('path');
const express = require('express');
const app = express();
const TeamController = require('./TeamController');
const LocalizationController = require('./LocalizationController');

app.use('/team', TeamController);
app.use('/localization', LocalizationController);




app.listen(3000);
