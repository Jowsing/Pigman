const Pigman = artifacts.require("Pigman");

module.exports = function (deployer, network, accounts) {
  let deployArgs = accounts[0];
  console.log(accounts);
  deployer.deploy(Pigman, deployArgs);
};
