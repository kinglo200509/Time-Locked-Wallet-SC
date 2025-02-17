// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract TimeLocked {
    address public user; 
    constructor() {
        user = msg.sender;
    }
    
}