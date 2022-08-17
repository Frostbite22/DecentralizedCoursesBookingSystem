# Decentralized Courses Booking system based on Smart contracts

This is a decentralized courses booking system built with hardhat, solidity and Ethers JS and based on smart contracts

Design Pattern : I'm choosing to use Factory design pattern to create the objects

Try running some of the following tasks:

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

Execute Balance task  
```
npx hardhat balance --account account_public_key 
```