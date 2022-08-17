const hre = require("hardhat");


const main = async () => {

    const studentContractFactory = await hre.ethers.getContractFactory("StudentFactory");
    const signers = await hre.ethers.getSigners() ; 

    const studentContract = await studentContractFactory.deploy();
    await studentContract.deployed();

    if (network.config.chainId===4 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await studentContract.deployTransaction.wait(1);
      await verify(studentContract.address,[]);
    }

    console.log(`Deployed contract to: ${studentContract.address}`);


    const studentToCreate = await studentContract.createStudent("mdfares","dark knight")
    const student = await studentToCreate.wait();
    const event = student.events.find(event => event.event === 'studentCreated');
    const [id, first,last] = event.args;

    console.log(`created student with id ${id} firstName ${first} and lastName ${last}`);

    // session contract 
    const sessionContractFactory = await hre.ethers.getContractFactory("SessionFactory");
    const sessionContract = await sessionContractFactory.deploy();
    await sessionContract.deployed(); 

    const createSessTxn = await sessionContract.createSession("1455");
    createSessTxn.wait(1); 
    console.log(`session created `);

    // const [sessionCreated] = txnReceipt.events;
    // const { sessionId, date } = sessionCreated.args;


    // let session = await sessionContract.getSessionById(0);
    // session.wait() ;
    // let std = await studentContract.getStudentById(0);
    // std.wait();


    // // studentToSession contract 
    // const stdToSesContractFactory = await hre.ethers.getContractFactory("StudentToSession");
    // const stdToSesContract = await stdToSesContractFactory.deploy();
    // await stdToSesContract.deployed(); 

    // const stdToSessTnx = await stdToSesContract.addStudentToSession(std[0],session[0]) ;
    // stdToSessTnx.wait(); 
    // console.log("student added to Session");

}

async function verify(contractAddress,args)
{
  console.log("Verifying contract ..");
  try{
  await run("verify:verify", {
    address : contractAddress,
    constructor : args 
  })
  }catch (e){
    if (e.message.toLowerCase().includes("already verified"))
    {
      console.log("already verified");
    }
    else 
    {
      console.log(e);
    }
  }

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
