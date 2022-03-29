// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import '@openzeppelin/contracts-upgradeable/token/ERC20/IERC20Upgradeable.sol';
import '@openzeppelin/contracts-upgradeable/token/ERC20/utils/SafeERC20Upgradeable.sol';
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract FundRaisingGuild is Initializable {
    using SafeERC20Upgradeable for IERC20Upgradeable;

    address public stakingContract;

    function initialize(address _stakingContract) public initializer {
        stakingContract = _stakingContract;
    }

    function withdrawTo(IERC20Upgradeable _token, address _recipient, uint256 _amount) external {
        require(msg.sender == stakingContract, "Guild.withdrawTo: Only staking contract");
        _token.safeTransfer(_recipient, _amount);
    }

    function tokenBalance(IERC20Upgradeable _token) external view returns (uint256) {
        return _token.balanceOf(address(this));
    }
}