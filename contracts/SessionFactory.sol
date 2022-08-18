// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Session.sol" ;

contract SessionFactory
{
    uint16 private id ; 
    Session[] sessions ;
    event sessionCreated (uint16 id,uint32 date);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }
    function createSession(uint32 _date) public 
    {
        Session session = new Session(id);
        session.setDate(_date);
        sessions.push(session);
        emit sessionCreated(id,_date);
        id++ ; 
    }


    function getSessionsLength() public view returns(uint256)
    {
        return sessions.length ;
    }

    function getSessionById(uint16 _id) public view returns (uint16,uint32)
    {
        for (uint256 i=0; i<sessions.length ;i++)
        {
            if (sessions[i].getId()==_id)
            {
                return (sessions[i].getId(),sessions[i].getDate());
            }
        }
        revert('Session with this id is not Not found');
    }


    


}