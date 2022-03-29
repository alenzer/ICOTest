// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
pragma experimental ABIEncoderV2;

// Import the IERC20 interface and and SafeMath library
import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';

contract SkyLaunchUtilityNFT is ERC721 {
    using SafeMath for uint256;
    
    constructor() ERC721('Skylaunch Utility NFT', 'SKYNFT') {
    }

    uint256[] public allocations;
    mapping(address => uint256) public userToAllocation;

    event AllocationSpent(uint256 id, uint256 amount);
    event UserClaimed(address user);

    function mint(address to, uint256 value) public {
        allocations.push(value);
        _mint(to, allocations.length - 1);
    }

    function getAvailableAllocation(uint256 id) public view returns (uint256) {
        return allocations[id];
    }

    function spendAllocation(uint256 id, uint256 amount) public {
        uint256 allocation = allocations[id];
        allocations[id] = allocation.sub(amount);
        emit AllocationSpent(id, amount);
    }

    function claim() public {
        userToAllocation[msg.sender]=200*1 ether;
        emit UserClaimed(msg.sender);
    }
}