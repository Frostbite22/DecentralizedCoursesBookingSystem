// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol";
import "./Session.sol" ;

contract StudentToSession 
{
    uint16 private studentId ;
    uint16 private sessionId ;
    uint16 private id ;

    uint16 private currentId ;

    constructor(uint16 _id,uint16 _studentId, uint16 _sessionId)
    {
        studentId = _studentId ; 
        sessionId = _sessionId ;
        id = _id ;
    }

    function getId() public view returns(uint16)
    {
        return id ; 
    }

    function getStudentId() public view returns(uint16)
    {
        return studentId ;
    }

    function getSessionId() public view returns(uint16)
    {
        return sessionId ;
    }


}