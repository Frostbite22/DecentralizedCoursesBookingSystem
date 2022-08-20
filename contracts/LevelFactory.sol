// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Level.sol" ;

contract LevelFactory 
{
    uint16 private id ; 
    Level[] levels ;
    event levelCreated (uint16 id,string levelName, string description, string imgUrl, string pathId);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }
    function createLevel(string memory _levelName,string memory _description,string memory _imageUrl, string memory _pathId) public 
    {
        Level level = new Level(id);
        level.setLevelName(_levelName);
        level.setDescription(_description);
        level.setImageUrl(_imageUrl);
        levels.push(level);
        emit levelCreated(id,_levelName,_description,_imageUrl,_pathId);
        id++ ; 
    }


    function getLevelsLength() public view returns(uint256)
    {
        return levels.length ;
    }

    function getLevelById(uint16 _id) public view returns (uint16,string memory,string memory,string memory, uint16)
    {
        for (uint256 i=0; i<levels.length ;i++)
        {
            if (levels[i].getLevelId()==_id)
            {
                return (levels[i].getLevelId(),levels[i].getLevelName(),levels[i].getDescription(),levels[i].getImageUrl(),levels[i].getPathId());
            }
        }
        revert('Session with this id is not Not found');
    }
} 