# Challenge - __SOLIDITY__

### Airline Ticket Manager
_Let’s get started on building your very first solidity program._

We will be making a fun Airline Ticket Booking program. The rest of the challenges of this series will continue adding to this base. So let’s get started!
```
  Task 01: Make a function that takes input (name, destination and passport ID) from the user and stores it. 
  (Hint: Use mappings and structs)
```

```  
  Task 02: You also need to add the option for the user to choose one of the three classes 
  (first class, business, and economy) and store it with the previous information.  
  (Hint: There is a special data type you can use to solve this trick in a jiffy!)
```

  Do you know the difference between state and local variables? You’ll be using them next. 
```
  Task 03: Initialize the price of economy, business and first class seats as follows 
  (be careful with units!):
  Economy price: 0.005 ether
  Business price: 0.007 ether
  First class price: 0.01 ether
```

  Did you know that your contract can send and withdraw ethers? That’s what this task is all about. 
```
  Task 04: Make a function that receives ethers on a successful ticket booking. 
  (Hint: You’ll need to to add a certain modifier to the function)
```

### Modifiers and Factory Pattern
_Next up are modifiers._

  You need to make a custom modifier that allows certain addresses to call a function. 
```
  Task 05: Make the two functions that add and remove addresses from the allowed list of addresses. 
  (Here’s a catch, both functions should implement the modifier.)
```

  Next Did you know that there is a contract that can deploy contracts? That’s what you need to make.
```
  Task 06: Make a parent contract that has the ability to deploy child contracts 
  (This function should implement the modifier you made in ‘Task 05’).
```

### Syntax Errors
_Find the syntax errors in this code snippets present in the file below named [Code-Snippets.pdf](https://github.com/Blockship-CrewChief/Quiz01Submissions/blob/main/Code-Snippets.pdf "Code Snippets File")_


# Solidity Template

My favorite setup for writing Solidity smart contracts.

- [Hardhat](https://github.com/nomiclabs/hardhat): compile and run the smart contracts on a local development network
- [TypeChain](https://github.com/ethereum-ts/TypeChain): generate TypeScript types for smart contracts
- [Ethers](https://github.com/ethers-io/ethers.js/): renowned Ethereum library and wallet implementation
- [Waffle](https://github.com/EthWorks/Waffle): tooling for writing comprehensive smart contract tests
- [Solhint](https://github.com/protofire/solhint): linter
- [Solcover](https://github.com/sc-forks/solidity-coverage): code coverage
- [Prettier Plugin Solidity](https://github.com/prettier-solidity/prettier-plugin-solidity): code formatter

This is a GitHub template, which means you can reuse it as many times as you want. You can do that by clicking the "Use this
template" button at the top of the page.

## Usage

### Pre Requisites

Before running any command, you need to create a `.env` file and set a BIP-39 compatible mnemonic as an environment
variable. Follow the example in `.env.example`. If you don't already have a mnemonic, use this [website](https://iancoleman.io/bip39/) to generate one.

Then, proceed with installing dependencies:

```sh
yarn install
```

### Compile

Compile the smart contracts with Hardhat:

```sh
$ yarn compile
```

### TypeChain

Compile the smart contracts and generate TypeChain artifacts:

```sh
$ yarn typechain
```

### Lint Solidity

Lint the Solidity code:

```sh
$ yarn lint:sol
```

### Lint TypeScript

Lint the TypeScript code:

```sh
$ yarn lint:ts
```

### Test

Run the Mocha tests:

```sh
$ yarn test
```

### Coverage

Generate the code coverage report:

```sh
$ yarn coverage
```

### Report Gas

See the gas usage per unit test and average gas per method call:

```sh
$ REPORT_GAS=true yarn test
```

### Clean

Delete the smart contract artifacts, the coverage reports and the Hardhat cache:

```sh
$ yarn clean
```

### Deploy

Deploy the contracts to Hardhat Network:

```sh
$ yarn deploy --greeting "Bonjour, le monde!"
```

## Syntax Highlighting

If you use VSCode, you can enjoy syntax highlighting for your Solidity code via the
[vscode-solidity](https://github.com/juanfranblanco/vscode-solidity) extension. The recommended approach to set the
compiler version is to add the following fields to your VSCode user settings:

```json
{
  "solidity.compileUsingRemoteVersion": "v0.8.4+commit.c7e474f2",
  "solidity.defaultCompiler": "remote"
}
```

Where of course `v0.8.4+commit.c7e474f2` can be replaced with any other version.
