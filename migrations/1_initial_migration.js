const Pigman = artifacts.require("Pigman");
const Dividends = artifacts.require("Dividends");
const members = [
  "0xfd0Be21D49fd9Abb18299756091dEE95ee7AbF88",
  "0x43905A9616c530899Fca3be81914BB27B3BbF637",
];
const scales = [
  50,
  50,
];
module.exports = function (deployer, network, accounts) {
  deployer.deploy(Dividends, members, scales).then(function() {
      return deployer.deploy(Pigman, Dividends.address);
  });
};
