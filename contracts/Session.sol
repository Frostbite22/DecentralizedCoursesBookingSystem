// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Session 
{
    uint16 private sessionId ; 
    uint256 private date ; 
    uint16 private levelId ; 
    
    constructor(uint16 _sessionId)
    {
        sessionId = _sessionId ;
    }
    function setDate(uint256 _date) public 
    {
        date = _date;
    }

    function getDate() view public returns(uint256)
    {
        return date ; 
    }
    
    function getId() view public returns(uint16)
    {
        return sessionId ; 
    }

     function setLevelId(uint16 _levelId) public 
    {
        levelId = _levelId;
    }

    function getLevelId() view public returns(uint16)
    {
        return levelId ; 
    }
    
}