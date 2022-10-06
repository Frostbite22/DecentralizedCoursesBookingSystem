# Decentralized Courses Booking system based on Smart contracts

This is a decentralized courses booking system built with hardhat, solidity and Ethers JS and based on smart contracts

## Requirements :
You need to have a wallet with testnet ethereum on the Goerli network
[Get free Goerli faucet](https://goerlifaucet.com/)

## Architecture : 
![alt text](https://github.com/Frostbite22/DecentralizedCoursesBookingSystem/blob/main/architecture.png?raw=true)


## Design Patterns :
### Normal Factory design pattern 
to create the student and Session objects in Factory Class
### Method template design pattern
thus creating an abstract interface for the student and use it in the Factory ckass to create the student 

![alt text](https://github.com/Frostbite22/DecentralizedCoursesBookingSystem/blob/main/course_system_white.png?raw=true)


## Setting up the project 
### Clone the project 
then ``` cd DecentralizedCoursesBookingSystem ```
### Install npm dependencies 
``` npm i ```
### Configurations 
create ```.env``` file in the root directory 
set up these constants
```
QUICKNODE_API_URL=YOUR_QUICKNODE_API_KEY
RINKEBY_ACCOUNT_PK=YOUR_RINKEBY_ACCOUNT_PK
ETHERSCAN_API_KEY=YOUR_ETHERSCAN_API_KEY
COINMARKETCAP_API_KEY=YOUR_COINMARKETCAP_API_KEY
```
## Try running some of the following tasks:

compile the contracts 

```
npx hardhat compile 
```

deploy the contracts locally 
```
npx hardhat run scripts/deploy.js
```

deploy the contracts to goerli network 
```
npx hardhat run scripts/deploy.js --network goerli
```

Unit Testing for the contract 
```
npx hardhat test 
```

Test coverage report  
```
npx hardhat coverage 
```

Execute Balance task  
```
npx hardhat balance --account account_public_key 
```

## Deployed at 

### Instructions 
For the app users, connect your Wallet with an account that have GoerliETH on the Goerli testnet network [get GoerliETH for free](https://goerlifaucet.com/), create an account if you are a user and get access to the plateform. <br>
If you are an admin, you should connect with your admin account already written on the blockchain.
### Admin interface
https://frostbite22.github.io/DecentralizedCoursesBookingSystemFrontAdmin

### Student interface
https://frostbite22.github.io/DecentralizedCoursesBookingSystemFront