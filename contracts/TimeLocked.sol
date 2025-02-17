// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract TimeLocked {
    address  public owner; 

    constructor() {
        owner= msg.sender;
    }

    // function to storeEth
    // simply doing this will send eth in your contract
    function StoreEth() public payable {
        // how much balance is there in smart contract 
        // this is an contract instance whihc will be converted to address object
        // address(this).balance alrrady cointain msg.value
        // no need to manually assign eth 
        
    }
    
}











        // .tranfer is only applicble for address payable ;
        // owner.transfer(msg.value);