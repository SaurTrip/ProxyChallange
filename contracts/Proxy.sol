//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Proxy {

address public implementation;
address public admin;

constructor () {
    admin = msg.sender;
}

function upgradeTo(address _implementation) external {
    require(msg.sender == admin, "Only admin can upgrtade.");
    implementation = _implementation;
}

function _delegate(address _implementation) private {

    assembly { 

        calldatacopy(0x0, 0x0, calldatasize() )
        let result := delegatecall(gas(), _implementation, 0x0, calldatasize(), 0, 0)
        returndatacopy(0, 0, returndatasize())
        switch result
        case 0 {
            revert(0, returndatasize())
        }
        default {
            return(0, returndatasize())
        }
    }
}

fallback() external payable {
    _delegate(implementation) ; 
}
receive()external payable {
    _delegate(implementation);
}


function getImplementation() public view returns(address) {
    console.log("Implementation code address %s",implementation);
    return implementation;
}


}