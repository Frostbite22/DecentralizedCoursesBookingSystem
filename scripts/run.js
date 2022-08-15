// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

const main = async () => {


    const studentContractFactory = await hre.ethers.getContractFactory("StudentFactory");
    const signers = await hre.ethers.getSigners() ; 

    const studentContract = await studentContractFactory.deploy();
    await studentContract.deployed()

    console.log(`Deployed contract to: ${studentContract.address}`)

    const createStdTxn = await studentContract.createStudent("fares","landouslsi");
    createStdTxn.wait(); 
    console.log("Student created");

    let studentsCount;

    studentsCount = await studentContract.getStudentsLength();

    for (let i=0; i<studentsCount;i++)
    {
        student = await studentContract.getStudentById(i);
        console.log(student);
    }
    
 
    
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
