**Contract Description**

The RequireAssertRevert contract is created to handle balances and transactions for Ethereum addresses. It offers essential features commonly seen in financial contracts, like depositing funds, withdrawing funds, transferring funds between addresses, and checking account balances
.

**Get started**

To run this program, I utilize Remix, an online Solidity IDE. To begin, visit the Remix website at https://remix.ethereum.org/. 

Next, I generate a new file by selecting the "+" symbol in the sidebar on the left. Remember to save the file with a .sol extension.

**Code**

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract RequireAssertRevert {
   
    address private owner;
    
    mapping(address => uint) private balances;

    constructor() {
        owner = msg.sender;
    }

    function deposit(uint _amount) public {
        // Require that the sender is the owner
        require(msg.sender == owner, "Only the owner can deposit funds");

        // Increase the balance
        balances[msg.sender] += _amount;
    }

    function withdraw(uint _amount) public {
        // Assert that the balance is sufficient
        assert(balances[msg.sender] >= _amount);

        // Decrease the balance
        balances[msg.sender] -= _amount;
    }

    function transfer(address _recipient, uint _amount) public {
        // Revert if the recipient is the zero address
        if (_recipient == address(0)) {
            revert("Cannot transfer to the zero address");
        }

        // Ensure sender has sufficient balance
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Decrease the sender's balance
        balances[msg.sender] -= _amount;

        // Increase the recipient's balance
        balances[_recipient] += _amount;
    }

    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }
}

**Usage**

To compile the code, go to the "Solidity Compiler" tab on the left-hand sidebar. Ensure that the "Compiler" option is set to "0.8.26" and then click on the "Compile project1.sol" button.

After compiling the code, I deploy the contract by selecting the "Deploy & Run Transactions" tab on the left-hand sidebar. Then, I click the "Deploy" button.

Once the contract is deployed, I Simply click on the deployed  "RequireAssertRevert" contract and intreact with function.

1. Initially, I utilized the deposit function by entering the amount to deposit and then clicking on the transact button. After a successful transaction, I checked my account balance using the getbalance function.
2. Next, I employed the withdraw function by specifying the amount to deduct from the account and then clicking on the transact button. Following a successful transaction, I verified my account balance using the getbalance function.
3. Lastly, I made use of the transfer function to send a specific amount to another account by providing the account address and clicking on the transact button. After a successful transaction, I checked my account balance using the getbalance function.

 **License**
 
 This contract is licensed under the MIT License. SPDX-License-Identifier: MIT.
