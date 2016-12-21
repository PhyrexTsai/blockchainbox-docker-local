var Web3 = require("web3");
var web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"));
console.log(web3.eth.accounts);

var fs = require('fs');
fs.readFile('/root/.primaryaccount', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  console.log(data);
});

fs.readFile('/root/.accountpassword', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  console.log(data);
});
