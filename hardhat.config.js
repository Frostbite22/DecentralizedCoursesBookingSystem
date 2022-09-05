require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");
require("./tasks/account_balance");
require("hardhat-gas-reporter");
require('solidity-coverage')




const QUICKNODE_API_URL = process.env.QUICKNODE_API_URL;
const ACCOUNT_PK = process.env.ACCOUNT_PK;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY ;
const COINMARKETCAP_API_KEY= process.env.COINMARKETCAP_API_KEY ;
const GOERLI_ALCHEMY_URL = process.env.GOERLI_ALCHEMY_URL ; 

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    goerli: {
      url: GOERLI_ALCHEMY_URL,
      accounts: [ACCOUNT_PK],
      chainId: 5,
    },
  },
  etherscan : {
    apiKey: ETHERSCAN_API_KEY
  },
  gasReporter: {
    currency: 'USD',
    coinmarketcap : COINMARKETCAP_API_KEY,
    enabled : true,
    outputFile : "gas-report.txt",
    noColors :true,
    token :"AVAX"
  }

};
