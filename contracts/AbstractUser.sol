// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";


abstract contract AbstractUser
{

    function setFirstName(string calldata _fn) virtual public  ;
    

    function getFirstName() public virtual view returns(string memory);   
   

    function setLastName(string calldata _ln) public virtual  ;
   

    function getLastName() public virtual view returns(string memory);


    function getId() public virtual view returns(uint16);
    
    function getAccount() public virtual view returns(address);


    function getEmail() public virtual view returns(string memory);
  

    function setEmail(string memory _email)  public virtual ;
    function setAccount(address _account)  public virtual ;

  
}