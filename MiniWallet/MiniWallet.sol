//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

contract MiniWallet{
    address payable public owner;

    struct Reciepient {
        address payable receiver;
    }
    uint amount;

    constructor (){
        owner = payable(msg.sender);
    }

    mapping(address => uint)balances;

    receive() external payable{}

    function send(address payable receipient) external payable {
        require(owner == msg.sender, "Only the owner can send out Ether");
        receipient.transfer(amount);
    }

    function getbalance()public view returns(uint){
        return msg.sender.balance;
    }
}