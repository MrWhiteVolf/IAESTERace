const path = require('path')
const express = require('express')
var mysql = require('mysql')
var moment = require('moment')
const app = express()

var con = mysql.createConnection({
  host: "localhost",
  user: "test",
  password: "password",
  database: "IAESTE_RACE"
});

con.connect(function(err) {
  if (err) throw err;
  console.log("Connected!");
});
var team = '';
app.get('/GetCurrentLocalization', (request, response) => {
  con.query("select Lat,Lon,Time from LOCALIZATION l inner join TEAM t on t.Id = l.TeamId where l.Time = (select max(Time) from LOCALIZATION where TeamId = " + request.query.TeamId + ");"
, function(err,result, fields) {
    if (err) throw err;
    console.log(fields);
    console.log(result);
  });
});

app.listen(3000)
