// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
pragma experimental ABIEncoderV2;


// Import this file to use console.log
import "hardhat/console.sol";
import "./StudentToSession.sol" ;

contract StudentSessionFactory 
{
    uint16 private id ; 
    StudentToSession[] studentSession ;
    event studentSessionCreated (uint16,uint16, uint16);

    function createStudentSession(uint16 _studentId, uint16 _sessionId) public 
    {
        StudentToSession stdSess = new StudentToSession(id,_studentId,_sessionId);
        studentSession.push(stdSess);
        emit studentSessionCreated(id,_studentId,_sessionId);
        id++;
    }

    function getStudentSessionsId(uint16 _studentId) public view returns(uint16[] memory)
    {
        uint16[] memory sessions = new uint16[](studentSession.length) ;
        uint sessionNum ;

        for (uint16 i=0; i<studentSession.length ;i++)
        {
            if (studentSession[i].getStudentId()==_studentId)
            {
                sessions[sessionNum] = studentSession[i].getSessionId();
                sessionNum++ ;
            }
        }
        return sessions ;
    }

    function getSessionStudentsId(uint16 _sessionId) public view returns(uint16[] memory)
    {
        uint16[] memory students = new uint16[](studentSession.length) ;
        uint studentNum ;

        for (uint16 i=0; i<studentSession.length ;i++)
        {
            if (studentSession[i].getSessionId()==_sessionId)
            {
                students[studentNum] = studentSession[i].getStudentId();
                studentNum++ ;
            }
        }
        return students ;
    }
}