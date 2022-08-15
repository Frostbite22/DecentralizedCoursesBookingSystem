// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol";
import "./Session.sol" ;

contract StudentToSession 
{
    mapping (Session => Student[]) sessionToStudents ;
    mapping (Student => Session[]) studentToSessions ; 

    function addStudentToSession(Student _student, Session _session) public 
    {
        sessionToStudents[_session].push(_student);
        studentToSessions[_student].push(_session);
    }

}