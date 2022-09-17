// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Level 
{   
    uint16 private levelId ; 
    string private levelName ; 
    string private description ; 
    string private imageUrl ; 
    uint16 private pathId ;
    uint16 private placesLeft ;

    constructor(uint16 _levelId)
    {
        levelId = _levelId ; 
    }

    function setLevelName(string memory _levelName) public 
    {
        levelName = _levelName ; 
    }

    function getLevelName() view public returns(string memory)
    {
        return levelName ; 
    }

     function setPlacesLeft(uint16 _placesLeft) public 
    {
        placesLeft = _placesLeft ; 
    }

    function getPlacesLeft() view public returns(uint16)
    {
        return placesLeft ; 
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
    function getPathId() view public returns(uint16)
    {
        return pathId ;
    }

    function setPathId(uint16 _pathId) public 
    {
        pathId = _pathId ; 
    }
} 