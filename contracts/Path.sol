// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Path 
{
    uint16 private pathId ; 
    string private pathName ; 
    string private description ; 
    string private imageUrl ; 

    constructor(uint16 _pathId)
    {
        pathId = _pathId ; 
    }

    function setPathName(string memory _pathName) public 
    {
        pathName = _pathName ; 
    }

    function getPathName() view public returns(string memory)
    {
        return pathName ; 
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

    
    function getPathId() view public returns(uint16)
    {
        return pathId ; 
    }
} 