// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Level.sol" ;
import "./ILevelFactory.sol";

interface ILevelFactory 
{
    function getLevelObjectById(uint16 _id) view external returns(Level);
    function getLevelsLength() external view returns(uint256);

}