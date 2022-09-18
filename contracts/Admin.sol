// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./AbstractUser.sol" ;

contract Admin is AbstractUser
{
    string private firstName ; 
    string private lastName ; 
    uint16 private id ; 
    string private email ;
    address private account ; 

    constructor(uint16 _id)
    {
        id = _id ;
    }


    function setFirstName(string calldata _fn)  override public 
    {
        firstName = _fn ;
    }

    function getFirstName() override public view returns(string memory) 
    {
        return firstName ;
    }

    function setLastName(string calldata _ln)  override public
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

    function setAccount(address _account)  override public
    {
        account = _account ;
    }

    function getEmail() override public view returns(string memory) 
    {
        return email ;
    }

    function setEmail(string memory _email)  override public
    {
        email = _email ;
    }
}