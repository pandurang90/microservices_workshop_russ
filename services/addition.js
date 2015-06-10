var express = require('express');
var bodyParser = require('body-parser');

var app = express();
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

app.post('/add', function (req, res) {
  operands = req.body.operands;
  data = JSON.stringify(operands);

  arr = JSON.parse(data);
  sum = 0;

  arr.map(function(item) {
    sum+=parseInt(item);
  });

  console.log(sum);

  res.send(sum.toString());
});

var server = app.listen(3000, function () {

  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);

});
