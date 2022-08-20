// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";
import "./Path.sol"; 

contract PathFactory 
{
    uint16 private id ; 
    Path[] paths ;
    event pathCreated (uint16 id,string pathName, string description, string imgUrl);

    function getCurrentId() view public returns(uint16)
    {
        return id ;
    }

     function isPathUnique( string memory _pathName) public view returns(bool)
    {
        for (uint i=0 ; i< paths.length ; i++)
        {
            if (keccak256(bytes(_pathName))==keccak256(bytes(paths[i].getPathName())))            
            {
                return false ;
            }
        }
        return true ;
    }
    function createPath(string memory _pathName,string memory _description,string memory _imageUrl) public 
    {
        if(isPathUnique(_pathName))
        {
            Path path = new Path(id);
            path.setPathName(_pathName);
            path.setDescription(_description);
            path.setImageUrl(_imageUrl);
            paths.push(path);
            emit pathCreated(id,_pathName,_description,_imageUrl);
            id++ ; 
        }
        else 
        {
            revert("Path name already exists !");
        }
    }


    function getPathsLength() public view returns(uint256)
    {
        return paths.length ;
    }

    function getPathById(uint16 _id) public view returns (uint16,string memory,string memory,string memory)
    {
        for (uint256 i=0; i<paths.length ;i++)
        {
            if (paths[i].getPathId()==_id)
            {
                return (paths[i].getPathId(),paths[i].getPathName(),paths[i].getDescription(),paths[i].getImageUrl());
            }
        }
        revert('Path with this id is not Not found');
    }
} 