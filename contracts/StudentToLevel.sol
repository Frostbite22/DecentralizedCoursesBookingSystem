// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol";
import "./Level.sol" ;
import "./ILevelFactory.sol" ;

contract StudentToLevel
{
    uint16 private studentId ;
    uint16 private levelId ;
    uint16 private id ;

    uint16 private currentId ;

    address LevelFactoryAddr;

    constructor(uint16 _id,uint16 _studentId, uint16 _levelId,address _levelFactoryAddress)
    {
        LevelFactoryAddr = _levelFactoryAddress ;
        ILevelFactory levelFactory = ILevelFactory(LevelFactoryAddr) ;
        Level level = levelFactory.getLevelObjectById(_levelId) ;
        if(level.getPlacesLeft()>0)
        {
            level.setPlacesLeft(level.getPlacesLeft()-1);
            studentId = _studentId ; 
            levelId = _levelId ;
            id = _id ;
        }
        else 
        {
            revert("there no places left");
        }
    }

    function getId() public view returns(uint16)
    {
        return id ; 
    }

    function getStudentId() public view returns(uint16)
    {
        return studentId ;
    }

    function getLevelId() public view returns(uint16)
    {
        return levelId ;
    }


}