# Decentralized Courses Booking system based on Smart contracts

This is a decentralized courses booking system built with hardhat, solidity and Ethers JS and based on smart contracts

## Design Patterns :
### Normal Factory design pattern 
to create the student and Session objects in Factory Class
### Method template design pattern
thus creating an abstract interface for the student and use it in the Factory ckass to create the student 

### Try running some of the following tasks:

compile the contracts 

```
npx hardhat compile 
```

deploy the contracts locally 
```
npx hardhat run scripts/deploy.js
```

deploy the contracts on rinkeby network 
```
npx hardhat run scripts/deploy.js --network rinkeby
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