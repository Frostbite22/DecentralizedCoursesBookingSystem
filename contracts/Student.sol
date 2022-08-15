// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract Student 
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

    function setFirstName(string calldata _fn) onlyOwner public 
    {
        firstName = _fn ;
    }

    function getFirstName() public view returns(string memory)
    {
        return firstName ;
    }

    function setLastName(string calldata _ln) onlyOwner public 
    {
        lastName = _ln ;
    }

    function getLastName() public view returns(string memory)
    {
        return lastName ;
    }

    function getId() public view returns(uint16)
    {
        return id ; 
    }

    function getAccount() public view returns(address)
    {
        return account ; 
    }

    function getEmail() public view returns(string memory)
    {
        return email ;
    }

    function setEmail(string memory _email) public 
    {
        email = _email ;
    }
}