const hre = require("hardhat");
const {expect , assert } = require("chai");

let studentContractFactory, studentContract ;
let sessionContractFactory, sessionContract ; 
let levelContractFactory, levelContract ; 
let pathContractFactory, pathContract ; 
let studentSessionContractFactory, studentSessionContract ;


describe("StudentFactory", function () {
    
    beforeEach(async function(){
        studentContractFactory = await hre.ethers.getContractFactory("StudentFactory");
        studentContract = await studentContractFactory.deploy() ; 
    })
    it("Current Id should be 0 after creating of contract", async function()
    {
        const currentId = await studentContract.getCurrentId();
        const expectedId = "0" ; 
        assert.equal(currentId.toString(),expectedId);
    })

    it("Students length should be 0", async function(){
        const currentLength = await studentContract.getStudentsLength();
        const expectedLength = "0";
        assert.equal(currentLength.toString(),expectedLength);
    })

    it("create a student", async function()
    {
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight","land@gmail.tn","0x4420f374a97077357272734d8753d28e6346b341")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last,account,email] = event.args;
        expect([id.toString(),first,last,account,email]).to.eql([currentId.toString(),"mdfares","dark knight",account,"land@gmail.tn"]);
        
    }) 
    it("No duplicate students to be created",async function(){
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight","land@gmail.tn","0x4420f374a97077357272734d8753d28e6346b341")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last,account,email] = event.args;
        expect([id.toString(),first,last,account,email]).to.eql([currentId.toString(),"mdfares","dark knight",account,"land@gmail.tn"]);

        await expect(studentContract.createStudent("mdfares","dark knight","0x4420f374a97077357272734d8753d28e6346b341","land@gmail.tn")).to.be.reverted ;
 
    })  
    
    it("get students length after creating one student",async function(){
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight","land@gmail.tn","0x4420f374a97077357272734d8753d28e6346b341")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last,account,email] = event.args;
        expect([id.toString(),first,last,account,email]).to.eql([currentId.toString(),"mdfares","dark knight",account,"land@gmail.tn"]);
        
        const currentLength = await studentContract.getStudentsLength();
        const expectedLength = "1";
        assert.equal(currentLength.toString(),expectedLength);  
    })

    it("get student by id", async function()
    {
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight","land@gmail.tn","0x4420f374a97077357272734d8753d28e6346b341")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last,account,email] = event.args;
        expect([id.toString(),first,last,account,email]).to.eql([currentId.toString(),"mdfares","dark knight",account,"land@gmail.tn"]);
            
        const getStudent = await studentContract.getStudentById(id);
        expect(getStudent).to.eql([currentId,"mdfares","dark knight",account,"land@gmail.tn"]);

    }) 
} )

describe("PathFactory", function() {
    beforeEach(async function(){
        pathContractFactory = await hre.ethers.getContractFactory("PathFactory");
        pathContract = await pathContractFactory.deploy() ; 
    }); 

    it("Current Id should be 0 after creating of contract", async function()
    {
        const currentPathId = await pathContract.getCurrentId();
        const expectedPathId = "0" ; 
        assert.equal(currentPathId.toString(),expectedPathId);
    })

    it("create a path", async function()
    {
        const currentId = await pathContract.getCurrentId();
        const pathToCreate = await pathContract.createPath("fullstack dev","front and back dev","url//image");
        const path = await pathToCreate.wait();
        const event = path.events.find(event => event.event === 'pathCreated');
        const [id_path,pathName,description,url] = event.args;
        expect([id_path.toString(),pathName,description,url]).to.eql([currentId.toString(),"fullstack dev","front and back dev","url//image"]);
    
    })    
})


describe("LevelFactory", function() {
    beforeEach(async function(){
        levelContractFactory = await hre.ethers.getContractFactory("LevelFactory");
        levelContract = await levelContractFactory.deploy() ; 
    }); 

    it("Current Id should be 0 after creating of contract", async function()
    {
        const currentLevelId = await levelContract.getCurrentId();
        const expectedLevelId = "0" ; 
        assert.equal(currentLevelId.toString(),expectedLevelId);
    })

    it("create a level", async function()
    {
        const currentId = await levelContract.getCurrentId();
        const levelToCreate = await levelContract.createLevel("backend lvl1","backend dev nodejs","url//node",0);
        const level = await levelToCreate.wait();
        const event = level.events.find(event => event.event === 'levelCreated');
        const [id, levelName,description_lvl,url_lvl,id_path_fk] = event.args;
        expect([id.toString(),levelName,description_lvl,url_lvl,id_path_fk]).to.eql([currentId.toString(),"backend lvl1","backend dev nodejs","url//node",0]);
 
    })    
})


describe("SessionFactory", function() {
    beforeEach(async function(){
        sessionContractFactory = await hre.ethers.getContractFactory("SessionFactory");
        sessionContract = await sessionContractFactory.deploy() ; 
    }); 

    it("Current Id should be 0 after creating of contract", async function()
    {
        const currentSessionId = await sessionContract.getCurrentId();
        const expectedSessionId = "0" ; 
        assert.equal(currentSessionId.toString(),expectedSessionId);
    })

    it("create a session", async function()
    {   
        
        const currentId = await sessionContract.getCurrentId();
        const sessionToCreate = await sessionContract.createSession("10112019",0);
        const session = await sessionToCreate.wait();
        const event = session.events.find(event => event.event === 'sessionCreated');
        const [id, date,levelId] = event.args;
        expect([id.toString(),date,levelId]).to.eql([currentId.toString(),10112019,0]);

    })    
})


describe("StudentSessionFactory", function() {
    beforeEach(async function(){
        studentSessionContractFactory = await hre.ethers.getContractFactory("StudentSessionFactory");
        studentSessionContract = await studentSessionContractFactory.deploy() ; 
    }); 

    it("add student to session", async function()
    {   

        const stdToSessTnx = await studentSessionContract.createStudentSession(0,0) ;
        stdToSessTnx.wait(); 

    })    
})


