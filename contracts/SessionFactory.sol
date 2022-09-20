// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Session.sol" ;

contract SessionFactory
{
    uint16 private id ; 
    Session[] sessions ;
    event sessionCreated (uint16 id,string name,uint256 date,uint16 levelId);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }
    function createSession(string memory _name,uint256 _date,uint16 _levelId) public 
    {
        Session session = new Session(id);
        session.setName(_name);
        session.setDate(_date);
        session.setLevelId(_levelId);
        sessions.push(session);
        emit sessionCreated(id,_name,_date,_levelId);
        id++ ; 
    }


    function getSessionsLength() public view returns(uint256)
    {
        return sessions.length ;
    }

    function getSessionById(uint16 _id) public view returns (uint16,string memory,uint256,uint16)
    {
        for (uint256 i=0; i<sessions.length ;i++)
        {
            if (sessions[i].getId()==_id)
            {
                return (sessions[i].getId(),sessions[i].getName(),sessions[i].getDate(),sessions[i].getLevelId());
            }
        }
        revert('Session with this id is not Not found');
    }


    


}