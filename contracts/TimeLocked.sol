// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.28;
import "hardhat/console.sol";

contract TimeLocked {
    address  public owner; 

    constructor() {
        owner= msg.sender;
    }

    // to store TimeStamp
    uint public startTime;
    uint public lockedTime;
    uint public unlockTime;

    // function to storeEth
    // simply doing this will send eth in your contract
    // this function to lock the time 
    function Lock(uint min) public payable {
        // how much balance is there in smart contract 
        // this is an contract instance which will be converted to address object-(address(this).balance)
        // address(this).balance alrrady cointain msg.value
        // no need to manually assign eth   
        require(msg.value > 0 , "The value should be more than zero"); 
        startTime = block.timestamp;
        lockedTime = min *60; // sec
        unlockTime =    startTime + lockedTime;   
        
    }

    // function less call for paying to smart contractc
    receive() external payable {}


    //Calldata is a type of temporary storage, containing the data specified in a function’s arguments
    function withdraw(uint eth) public payable {
        require(block.timestamp>= unlockTime, "this is reverted due to time restrains");
        require(address(this).balance  >= eth , "Insufficient Funds");
        // sending money to the sender 
        console.log("THis is money being sent to the msg.sender with the value ");
        (bool s,) = payable(msg.sender).call{value: eth }("");
        require(s , "Withdraw Funds");
    }
    
}











        // .tranfer is only applicble for address payable ;
        // owner.transfer(msg.value);