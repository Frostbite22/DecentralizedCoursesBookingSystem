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

    // session contract 
    const sessionContractFactory = await hre.ethers.getContractFactory("SessionFactory");
    const sessionContract = await sessionContractFactory.deploy();
    await sessionContract.deployed(); 
    const date = new Date(2022,12,25,14,30,0);
    const createSessTxn = await sessionContract.createSession(date.getTime());
    createSessTxn.wait(); 
    console.log("session created");

    let session = await sessionContract.getSessionById(0);
    let std = await studentContract.getStudentById(0);


    // studentToSession contract 
    const stdToSesContractFactory = await hre.ethers.getContractFactory("StudentToSession");
    const stdToSesContract = await stdToSesContractFactory.deploy();
    await stdToSesContract.deployed(); 

    const stdToSessTnx = await stdToSesContract.addStudentToSession(std[0],session[0]) ;
    stdToSessTnx.wait(); 
    console.log("student added to Session");


    
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
