// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Level 
{   

    uint16 private levelId ; 
    string private description ; 
    string private imageUrl ; 

    constructor(uint16 _levelId)
    {
        levelId = _levelId ; 
    }

    function setDescription(string memory _description) public 
    {
        description = _description ; 
    }

    function getDescription() view public returns(string memory)
    {
        return description ; 
    }

    function setImageUrl(string memory _imageUrl) public 
    {
        imageUrl = _imageUrl ; 
    }

    function getImageUrl() view public returns(string memory)
    {
        return imageUrl ; 
    }
    
    function getLevelId() view public returns(uint16)
    {
        return levelId ; 
    }
} 