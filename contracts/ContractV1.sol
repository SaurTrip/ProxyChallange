//SPDX-License-Identifier:MIT


pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract ContractV1 {

address public implementation;
address public admin;
uint public counter ;

function increment() public {
    counter += 1;

}

function getCounter() public view returns(uint){
    console.log("counter value : %s",counter);
    return counter;
}

}