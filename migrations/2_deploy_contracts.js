const PankungCollection = artifacts.require('PankungCollection')

module.exports = function (deployer) {
  deployer.deploy(PankungCollection);
};
