// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;


// Import this file to use console.log
import "hardhat/console.sol";
import "./StudentToLevel.sol" ;

contract StudentLevelFactory 
{
    uint16 private id ; 
    StudentToLevel[] studentLevel ;
    event studentLevelCreated (uint16,uint16, uint16);

     function isStudentLevelUnique(uint16 _studentId, uint16 _levelId) public view returns(bool)
    {
        for (uint i=0 ; i< studentLevel.length ; i++)
        {
            if (_studentId == studentLevel[i].getStudentId() && _levelId == studentLevel[i].getLevelId() )         
            {
                return false ;
            }
        }
        return true ;
    }
    function createStudentLevel(uint16 _studentId, uint16 _levelId,address _lvlFactory) public 
    {
        if(isStudentLevelUnique(_studentId,_levelId))
        {
            StudentToLevel stdLvl = new StudentToLevel(id,_studentId,_levelId,_lvlFactory);
            studentLevel.push(stdLvl);
            emit studentLevelCreated(id,_studentId,_levelId);
            id++;
        }
        else 
        {
            revert("This student-Level already exists");
        }
    }

    function getStudentLevelsId(uint16 _studentId) public view returns(uint16[] memory)
    {
        uint16[] memory levels = new uint16[](studentLevel.length) ;
        uint levelNum ;

        for (uint16 i=0; i<studentLevel.length ;i++)
        {
            if (studentLevel[i].getStudentId()==_studentId)
            {
                levels[levelNum] = studentLevel[i].getLevelId();
                levelNum++ ;
            }
        }
        return levels ;
    }

    function getLevelStudentsId(uint16 _levelId) public view returns(uint16[] memory)
    {
        uint16[] memory students = new uint16[](studentLevel.length) ;
        uint studentNum ;

        for (uint16 i=0; i<studentLevel.length ;i++)
        {
            if (studentLevel[i].getLevelId()==_levelId)
            {
                students[studentNum] = studentLevel[i].getStudentId();
                studentNum++ ;
            }
        }
        return students ;
    }
}