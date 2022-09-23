// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Import this file to use console.log
import "hardhat/console.sol";
import "./Admin.sol" ;
import "./AbstractUser.sol" ;

contract AdminFactory
{
    
    uint16 private id ; 
    AbstractUser[] admins ;
    event adminCreated (uint16,string, string,address,string);

    function isAdminUnique(address _account) public view returns(bool)
    {
        for (uint i=0 ; i< admins.length ; i++)
        {
            if (_account == admins[i].getAccount())         
            {
                return false ;
            }
        }
        return true ;
    }

    function createAdmin(string memory _firstName, string memory _lastName, string memory _email, address _account) public 
    {
        if(isAdminUnique(_account))
        {
            AbstractUser std = new Admin(id) ;
            std.setFirstName(_firstName);
            std.setLastName(_lastName);  
            std.setEmail(_email);
            std.setAccount(_account);
            admins.push(std);
            emit adminCreated(id,_firstName,_lastName,_account,_email);
            id++ ;
        }
        else 
        {
            revert("This admin already exists");
        }
    }


    function getAdminsLength() public view returns(uint256)
    {
        return admins.length ;
    }

    function getAdminById(uint16 _id) public view returns (uint16,string memory, string memory,address,string memory)
    {
        for (uint256 i=0; i<admins.length ;i++)
        {
            if (admins[i].getId()==_id)
            {
                return (admins[i].getId(),admins[i].getFirstName(),admins[i].getLastName(),admins[i].getAccount(),admins[i].getEmail());
            }
        }
        revert('Admin with this id is not Not found');

    }

    function getAdminByAccount(address account) public view returns(uint16,string memory, string memory,address,string memory)
    {
        for (uint256 i=0; i<admins.length ;i++)
        {
            if (admins[i].getAccount()==account)
            {
                return (admins[i].getId(),admins[i].getFirstName(),admins[i].getLastName(),admins[i].getAccount(),admins[i].getEmail());
            }
        }
        revert('Admin with this account address is not Not found');
    }

    function getCurrentId() public view returns(uint16)
    {
        return id ; 
    }


}