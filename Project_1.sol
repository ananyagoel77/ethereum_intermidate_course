// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract RequireAssertRevert {
 // State variable to store the owner's address
    address private owner;      
 // Mapping to store balances of addresses
    mapping(address => uint) private balances;   

    constructor() {
        owner = msg.sender;
    }
     // Function to deposit funds into the contract
    function deposit(uint _amount) public {
        // Require that the sender is the owner
        require(msg.sender == owner, "Only the owner can deposit funds");
        // Increasing the balance of sender
        balances[msg.sender] += _amount;
    }

   // Function to withdraw funds from the contract
    function withdraw(uint _amount) public {
        // Assert that the balance is sufficient
        assert(balances[msg.sender] >= _amount);
        // Decreasing the balance of the sender
        balances[msg.sender] -= _amount;
    }

   // Function to transfer funds to another address
    function transfer(address _recipient, uint _amount) public {
        // Revert if the recipient is the zero address
        if (_recipient == address(0)) {
            revert("Cannot transfer to the zero address");
        }
        // Ensure sender has sufficient balance in account to transter the fund to another account
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        // Decrease the sender's balance
        balances[msg.sender] -= _amount;
        // Increase the recipient's balance
        balances[_recipient] += _amount;
    }

   // Function to get the balance of a specific account
    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }
}
