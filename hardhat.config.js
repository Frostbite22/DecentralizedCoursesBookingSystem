require("@nomiclabs/hardhat-waffle");
require("dotenv").config();
require("@nomiclabs/hardhat-etherscan");
require("./tasks/account_balance");


const QUICKNODE_API_URL = process.env.QUICKNODE_API_URL;
const RINKEBY_ACCOUNT_PK = process.env.RINKEBY_ACCOUNT_PK;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY ;


/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.9",
  networks: {
    rinkeby: {
      url: QUICKNODE_API_URL,
      accounts: [RINKEBY_ACCOUNT_PK],
      chainId: 4,
    },
  },
  etherscan : {
    apiKey : ETHERSCAN_API_KEY 
  }
};
