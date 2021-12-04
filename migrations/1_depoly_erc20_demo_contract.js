const DemoERC20Token = artifacts.require("./DemoERC20Token.sol");

module.exports = function (deployer) {
  deployer.deploy(DemoERC20Token, "DemoERC20 Token", "DemoERC20Token", 1000000000000000);
};
