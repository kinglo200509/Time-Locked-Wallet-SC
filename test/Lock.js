const {expect} = require("chai");
const { ethers } = require("hardhat");

// ethers verion 6

describe("TimeLocked" , function(){
  let Contract , contract;


  //   In Ethers v6, deploy() internally handles:
  // Sending the transaction to deploy the contract.
  // Waiting for the transaction to be mined.
  // Returning the deployed contract.

  // before testing create an instance 
  beforeEach(async()=>{
    Contract = await ethers.getContractFactory("TimeLocked");
    contract =await Contract.deploy();
    //  Use waitForDeployment(): If you need fine-grained control
    await contract.waitForDeployment();
    console.log( await contract.getAddress());
  })

  it("This is should recive some eth in the address of the account ",async  ()=> {
    // should pass the value as an object pareEther-
    const tx = await contract.StoreEth({value: ethers.parseEther("1.0")});
    // since its a payable function we have to wait
    await tx.wait();
    // getBalance provider is a read-only abstraction to access the blockchain data.
    const balance = await ethers.provider.getBalance(await contract.getAddress());
    console.log( `THis is the address of the contract ${await contract.getAddress()}`)
    console.log(`This is the balance: ${balance}`);

    expect(balance.toString()).to.equal(ethers.parseEther("1.0").toString());

  })
})



// describe -> ethers.getCOntractFActory ->deploy->waitFOrDe.. ->contract.getAddress()
// with payable functions take transactions  and wait() for the transaction for to complete