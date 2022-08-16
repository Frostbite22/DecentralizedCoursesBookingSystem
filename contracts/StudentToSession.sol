// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol";
import "./Session.sol" ;

contract StudentToSession 
{
    mapping (uint16 => uint16[]) sessionToStudents ;
    mapping (uint16 => uint16[]) studentToSessions ; 

    function addStudentToSession(uint16 _studentId, uint16 _sessionId) public 
    {
        sessionToStudents[_sessionId].push(_studentId);
        studentToSessions[_studentId].push(_sessionId);
    }

}