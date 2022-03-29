const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const SkyLaunchFundRaising = artifacts.require("SkyLaunchFundRaising");

module.exports = async function (deployer) {
    console.log("migrating")
    const scores = [399, 299, 199, 99, 10]
    const multipliers = [300, 250, 200, 150, 100]
    const testNFTAddress = "0x293A828B47B3cEa3B9eF4773485289116dA18e75"    
    await deployProxy(SkyLaunchFundRaising, [scores, multipliers, testNFTAddress], { deployer });    
}