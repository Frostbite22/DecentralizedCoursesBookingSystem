// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol" ;
import "./AbstractUser.sol" ;

contract StudentFactory
{
    
    uint16 private id ; 
    AbstractUser[] students ;
    event studentCreated (uint16,string, string,address,string);

    function isStudentUnique(address _account) public view returns(bool)
    {
        for (uint i=0 ; i< students.length ; i++)
        {
            if (_account == students[i].getAccount())         
            {
                return false ;
            }
        }
        return true ;
    }

    function createStudent(string memory _firstName, string memory _lastName, string memory _email, address _account) public 
    {
        if(isStudentUnique(_account))
        {
            AbstractUser std = new Student(id) ;
            std.setFirstName(_firstName);
            std.setLastName(_lastName);  
            std.setEmail(_email);
            std.setAccount(_account);
            students.push(std);
            emit studentCreated(id,_firstName,_lastName,_account,_email);
            id++ ;
        }
        else 
        {
            revert("This student already exists");
        }
    }


    function getStudentsLength() public view returns(uint256)
    {
        return students.length ;
    }

    function getStudentById(uint16 _id) public view returns (uint16,string memory, string memory,address,string memory)
    {
        for (uint256 i=0; i<students.length ;i++)
        {
            if (students[i].getId()==_id)
            {
                return (students[i].getId(),students[i].getFirstName(),students[i].getLastName(),students[i].getAccount(),students[i].getEmail());
            }
        }
        revert('Student with this id is not Not found');

    }

    function getStudentByAccount(address account) public view returns(uint16,string memory, string memory,address,string memory)
    {
        for (uint256 i=0; i<students.length ;i++)
        {
            if (students[i].getAccount()==account)
            {
                return (students[i].getId(),students[i].getFirstName(),students[i].getLastName(),students[i].getAccount(),students[i].getEmail());
            }
        }
        revert('Student with this account address is not Not found');
    }

    function getCurrentId() public view returns(uint16)
    {
        return id ; 
    }


}