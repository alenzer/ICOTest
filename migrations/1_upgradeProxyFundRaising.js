const { deployProxy, upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const SkyLaunchFundRaisingV2 = artifacts.require("SkyLaunchFundRaisingV2");

module.exports = async function (deployer) {
    // 0x9CAFc5E4b8b5e290d582aa62d63C8CD21325BC7C SkyLaunchFundRaising(origin) address
    const upgraded = await upgradeProxy("0x9CAFc5E4b8b5e290d582aa62d63C8CD21325BC7C", SkyLaunchFundRaisingV2, { deployer });
    const scores = [399, 299, 199, 99, 10]
    const multipliers = [300, 250, 200, 150, 100]
    const testNFTAddress = "0xa0ab50a1b03aCADf1e7DdDBb1fe685f3F34629A7"
    upgraded.initialize(scores, multipliers, testNFTAddress)
}