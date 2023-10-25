// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0;

contract bankAccount{
    //test push
    address owner;

    constructor(){
        owner = msg.sender;
    }

    mapping (address => uint) balance;

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }

    function deposit(uint _amount) public{
        balance[msg.sender] += _amount;
    }

    function withdraw(uint _amount) public{
        require(balance[msg.sender] >= _amount, "Insufficient Balance");
        balance[msg.sender] -= _amount;
    }

    function transfer(uint _amount, address _destination) public{
        require(_destination != msg.sender, "You cannot transfer to yourself!");
        require(balance[msg.sender] >= _amount, "Insufficient Balance");
        balance[msg.sender] -= _amount;
        balance[_destination] += _amount;
    }

}