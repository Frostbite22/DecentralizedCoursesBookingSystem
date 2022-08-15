// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Student.sol" ;

contract StudentFactory
{
    uint16 private id ; 
    Student[] students ;
    event studentCreated (Student std, uint16 id);

    function createStudent(string memory _firstName, string memory _lastName) public 
    {
        Student std = new Student(id);
        std.setFirstName(_firstName);
        std.setLastName(_lastName); 
        students.push(std);
        emit studentCreated(std,id);
        id++ ;
    }


    function getStudentsLength() public view returns(uint256)
    {
        return students.length ;
    }

    function getStudentById(uint16 _id) public view returns (uint16,string memory, string memory)
    {
        for (uint256 i=0; i<students.length ;i++)
        {
            if (students[i].getId()==_id)
            {
                return (students[i].getId(),students[i].getFirstName(),students[i].getLastName());
            }
        }
        revert('Student with this id is not Not found');

    }

    function getStudentByAccount(address account) public view returns(uint16,string memory, string memory)
    {
        for (uint256 i=0; i<students.length ;i++)
        {
            if (students[i].getAccount()==account)
            {
                return (students[i].getId(),students[i].getFirstName(),students[i].getLastName());
            }
        }
        revert('Student with this account address is not Not found');
    }


}