// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./StudentToSession.sol" ;
import "./SessionFactory.sol" ;
import "./Session.sol";

contract StudentSessionFactory 
{
    uint16 private id ; 
    StudentToSession[] studentSession ;
    event studentSessionCreated (uint16,uint16, uint16);

    function createStudentSessionFactory(uint16 _studentId, uint16 _sessionId) public 
    {
        StudentToSession stdSess = new StudentToSession(id,_studentId,_sessionId);
        studentSession.push(stdSess);
        emit studentSessionCreated(id,_studentId,_sessionId);
        id++;
    }

    function getStudentSessionsId(uint16 _studentId) public view returns(uint16[] memory)
    {
        uint16[] memory sessions ;

        for (uint i=0; i<studentSession.length ;i++)
        {
            uint sessionNum ;

            if (studentSession[i].getStudentId()==_studentId)
            {
                SessionFactory sf ;
                (uint16 sessionId,) = sf.getSessionById(studentSession[i].getSessionId()) ;
                sessions[sessionNum] = sessionId;
                sessionNum++ ;
            }
        }
        return sessions ;
    }
}