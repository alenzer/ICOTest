const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const SkyLaunchFundRaising = artifacts.require("SkyLaunchFundRaising");

module.exports = async function (deployer) {
    const scores = [399, 299, 199, 99, 10]
    const multipliers = [300, 250, 200, 150, 100]
    const testNFTAddress = "0xa0ab50a1b03aCADf1e7DdDBb1fe685f3F34629A7"    
    await deployProxy(SkyLaunchFundRaising, [scores, multipliers, testNFTAddress], { deployer });    
}