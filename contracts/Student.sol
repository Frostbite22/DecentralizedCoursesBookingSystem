// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./AbstractStudent.sol" ;

contract Student is AbstractStudent
{
    string private firstName ; 
    string private lastName ; 
    uint16 private id ; 
    string private email ;
    address private account ; 

    constructor(uint16 _id)
    {
        account = msg.sender ;
        id = _id ;
    }

    modifier onlyOwner() 
    {
        require(msg.sender == account,"Not the owner");
        _;
    }

    function setFirstName(string calldata _fn) onlyOwner override public 
    {
        firstName = _fn ;
    }

    function getFirstName() override public view returns(string memory) 
    {
        return firstName ;
    }

    function setLastName(string calldata _ln) onlyOwner override public
    {
        lastName = _ln ;
    }

    function getLastName()  view override public returns(string memory) 
    {
        return lastName ;
    }

    function getId() override public view returns(uint16) 
    {
        return id ; 
    }

    function getAccount() override public view returns(address) 
    {
        return account ; 
    }

    function getEmail() override public view returns(string memory) 
    {
        return email ;
    }

    function setEmail(string memory _email) onlyOwner override public
    {
        email = _email ;
    }
}