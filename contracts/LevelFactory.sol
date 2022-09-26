// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Level.sol" ;
import "./ILevelFactory.sol";

contract LevelFactory 
{
    uint16 private id ; 
    Level[] public levels ;
    event levelCreated (uint16 id,string levelName, string description, string imgUrl,uint16 placesLeft,uint16 pathId);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }

    function isLevelUnique( string memory _levelName) internal view returns(bool)
    {
        for (uint i=0 ; i< levels.length ; i++)
        {
            if (keccak256(bytes(_levelName))==keccak256(bytes(levels[i].getLevelName())))            
            {
                return false ;
            }
        }
        return true ;
    }

    function createLevel(string memory _levelName,string memory _description,string memory _imageUrl,uint16 _placesLeft, uint16 _pathId) public 
    {
        if(isLevelUnique(_levelName))
        {
            Level level = new Level(id);
            level.setLevelName(_levelName);
            level.setDescription(_description);
            level.setImageUrl(_imageUrl);
            level.setPlacesLeft(_placesLeft);
            level.setPathId(_pathId);
            levels.push(level) ;
            emit levelCreated(id,_levelName,_description,_imageUrl,_placesLeft,_pathId);
            id++ ; 
        }
        else 
        {
            revert("Level name is not unique !");
        }
    }


    function getLevelsLength() public view returns(uint256)
    {
        return id ;
    }

    function getLevelById(uint16 _id) public view returns (uint16,string memory,string memory,string memory,uint16, uint16)
    {
        for (uint256 i=0; i< levels.length ;i++)
        {
            if (levels[i].getLevelId()==_id)
            {
                return (levels[i].getLevelId(),levels[i].getLevelName(),levels[i].getDescription(),levels[i].getImageUrl(),levels[i].getPlacesLeft(),levels[i].getPathId());
            }
        }
        revert('Level with this id is not Not found');
    }

    function getLevelObjectById(uint16 _id) public view returns(Level)
    {
        return levels[_id];
    }

   
} 