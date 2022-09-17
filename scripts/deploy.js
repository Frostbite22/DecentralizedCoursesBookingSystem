const hre = require("hardhat");


const main = async () => {

    const studentContractFactory = await hre.ethers.getContractFactory("StudentFactory");

    const studentContract = await studentContractFactory.deploy();
    await studentContract.deployed();

    // verify deployment of student contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await studentContract.deployTransaction.wait(6);
      await verify(studentContract.address,[]);
    }

    console.log(`Deployed contract to: ${studentContract.address}`);

    // creating a student

    const studentToCreate = await studentContract.createStudent("john","doe","john@gmail.tn","0x4420F374a97077357272734d8753d28E6346B341")
    const student = await studentToCreate.wait();
    const event = student.events.find(event => event.event === 'studentCreated');
    const [id, first,last,account,email] = event.args;

    console.log(`created student with id ${id} firstName ${first} and lastName ${last} with acc ${account} and email ${email}`);

    // deploying path contract
    const pathContractFactory = await hre.ethers.getContractFactory("PathFactory");
    const pathContract = await pathContractFactory.deploy();
    await pathContract.deployed(); 


    // verify deployment of pathContract contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await pathContract.deployTransaction.wait(6);
      await verify(pathContract.address,[]);
    }

    // creating a path

    const createPathTxn = await pathContract.createPath("fullstack dev","front and back dev","url//image");
    const path= await createPathTxn.wait(); 
    const eventPath = path.events.find(event => event.event ==='pathCreated');
    const [id_path,pathName,description,url] = eventPath.args ;
    console.log(`path created with id ${id_path} and name ${pathName} : ${description} , ${url} `);
    
    // deploy the level contract 
    const levelContractFactory = await hre.ethers.getContractFactory("LevelFactory");
    const levelContract = await levelContractFactory.deploy();
    await levelContract.deployed(); 

    // verify deployment of levelContract contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await levelContract.deployTransaction.wait(6);
      await verify(levelContract.address,[]);
    }
    

    // creating a level for that path
    const createLevelTxn = await levelContract.createLevel("backend lvl1","backend dev nodejs","url//node",id_path);
    const level= await createLevelTxn.wait(); 
    const eventLevel = level.events.find(event => event.event ==='levelCreated');
    const [id_level,levelName,description_lvl,url_lvl,id_path_fk] = eventLevel.args ;
    console.log(`level created with id ${id_level} and name ${levelName} : ${description_lvl} , ${url_lvl} with path id ${id_path_fk}`);

    // session contract deployment
    const sessionContractFactory = await hre.ethers.getContractFactory("SessionFactory");
    const sessionContract = await sessionContractFactory.deploy();
    await sessionContract.deployed(); 

    // verify deployment of session contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await sessionContract.deployTransaction.wait(6);
      await verify(sessionContract.address,[]);
    }

    // creating a session for that level

    const dat = new Date(2022,12,25,14,30,0);
    const createSessTxn = await sessionContract.createSession(dat.getTime()/1000,id_level);

    const session = await createSessTxn.wait(); 
    const eventSession = session.events.find(event => event.event ==='sessionCreated');
    const [id_sess,date,level_id_fk] = eventSession.args ;
    const response_date = new Date(date*1000)
    console.log(`session created with id ${id_sess} and date ${response_date} and level id : ${level_id_fk} `);

    const createSess2Txn = await sessionContract.createSession("4555",id_level);
    const session2 = await createSess2Txn.wait(); 
    const eventSession2 = session2.events.find(event => event.event ==='sessionCreated');
    const [id_sess2,date2,level_id_fk_2] = eventSession2.args ;
    console.log(`session created with id ${id_sess2} and date ${date2} and level id : ${level_id_fk_2}`);


  

    // studentToSession contract 
    const stdToSesContractFactory = await hre.ethers.getContractFactory("StudentSessionFactory");
    const stdToSesContract = await stdToSesContractFactory.deploy();
    await stdToSesContract.deployed(); 

    // verify deployment of studentToSession contracts
    if (network.config.chainId===5 && process.env.ETHERSCAN_API_KEY)
    {
      console.log("Waiting for block confirmations ...");
      await stdToSesContract.deployTransaction.wait(6);
      await verify(stdToSesContract.address,[]);
    }

    const stdToSessTnx = await stdToSesContract.createStudentSession(id,id_sess) ;
    stdToSessTnx.wait(); 
    console.log("student added to Session");

    const stdToSess2Tnx = await stdToSesContract.createStudentSession(id,id_sess2) ;
    stdToSess2Tnx.wait(); 
    console.log("student added to Session");


    // sessions of Student 0
    const sessions = await stdToSesContract.getStudentSessionsId(id);
    console.log(`sessions of Student ${id}`);
    console.log([...new Set(sessions)]);
    // Students of session 0
    const students1 = await stdToSesContract.getSessionStudentsId(id_sess);
    console.log(`students of session ${id_sess}`);
    console.log([...new Set(students1)]);
    // Students of Session 1
    const students2 = await stdToSesContract.getSessionStudentsId(id_sess2);
    console.log(`students of session ${id_sess2}`);
    console.log([...new Set(students2)]);

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
