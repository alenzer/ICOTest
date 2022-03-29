const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const TestNFT = artifacts.require("TestNFT");

module.exports = async function (deployer) {
    await deployer.deploy(TestNFT)
}