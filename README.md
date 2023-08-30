# Diya Token (DA) Smart Contract

This repository contains the smart contract code for the Diya Token (DA), an ERC-20 compliant token on the Ethereum blockchain.

## Overview

The Diya Token is a basic ERC-20 token with additional features like minting and burning tokens. It allows users to transfer tokens, approve spending limits for other addresses, and perform various token-related operations.

## Contract Details

- Name: Diya Token (DA)
- Symbol: DA
- Decimals: 18
- Total Supply: [Total Supply Value]

## Functionality

### `transfer`

The `transfer` function allows users to send tokens to another address. It checks the sender's balance and ensures that the sender has enough tokens to perform the transfer.

### `approve`

The `approve` function allows the token owner to grant another address the ability to spend a certain number of tokens on their behalf.

### `transferFrom`

The `transferFrom` function allows an address with an approved allowance to transfer tokens from the token owner's account to another address.

### `mint`

The `mint` function is only executable by the contract owner. It allows the owner to mint new tokens and add them to their own balance or distribute them as needed.

### `burn`

The `burn` function allows users to destroy a certain number of their own tokens, reducing the total supply accordingly.

## Usage

To deploy and interact with the Diya Token smart contract, follow these steps:

1. Deploy the smart contract to the Ethereum blockchain.
2. Interact with the contract using an Ethereum wallet or a smart contract interaction tool.

## Example Code

Here's an example of how you might deploy the Diya Token contract using [Truffle](https://www.trufflesuite.com/) and interact with it using web3.js:

```javascript
// Deploy Diya Token
const DiyaToken = artifacts.require("ERC20");
module.exports = function (deployer) {
  deployer.deploy(DiyaToken);
};

// Interact with Diya Token
const Web3 = require('web3');
const web3 = new Web3(new Web3.providers.HttpProvider('YOUR_INFURA_URL'));

const token = new web3.eth.Contract(ABI, CONTRACT_ADDRESS);

// Perform token transfers, approvals, minting, and burning as needed
// Example:
// token.methods.transfer(recipientAddress, amount).send({ from: senderAddress });
