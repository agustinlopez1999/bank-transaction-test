// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0;

contract bankAccount{
    address owner;
    mapping (address => uint) balance;

    constructor(){
        owner = msg.sender;
        balance[msg.sender] = 0;
    }

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

    function transfer(uint _amount, address _destination) payable public{
        require(_destination != msg.sender, "You cannot transfer to yourself!");
        require(balance[msg.sender] >= _amount, "Insufficient Balance");
        balance[msg.sender] -= _amount;
        balance[_destination] += _amount;
    }
}