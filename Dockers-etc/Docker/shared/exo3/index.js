const express = require('express');

const app = express();

var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://root:example@mongo-srv:27017/default_db?authSource=admin";
let dbo;

MongoClient.connect(url , {useUnifiedTopology: true}, function(err, db) {
  if (err) throw err;
  console.log("Database created!");
  dbo = db.db("docker");
});

app.get('/', (req, res) => {
    dbo.collection("users").find({}).toArray(function(err, result) {
        if (err) throw err;
        res.json(result);
      });
});

app.listen(3000, () => {
    console.log('Server running')
});