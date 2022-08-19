const hre = require("hardhat");
const {expect , assert } = require("chai");

let studentContractFactory, studentContract ;
let sessionContractFactory, sessionContract ; 
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
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last] = event.args;
        expect([id.toString(),first,last]).to.eql([currentId.toString(),"mdfares","dark knight"]);
        
    }) 
    it("No duplicate students to be created",async function(){
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last] = event.args;
        expect([id.toString(),first,last]).to.eql([currentId.toString(),"mdfares","dark knight"]);

        await expect(studentContract.createStudent("mdfares","dark knight")).to.be.reverted ;
 
    })  
    
    it("get students length after creating one student",async function(){
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last] = event.args;
        expect([id.toString(),first,last]).to.eql([currentId.toString(),"mdfares","dark knight"]);
        
        const currentLength = await studentContract.getStudentsLength();
        const expectedLength = "1";
        assert.equal(currentLength.toString(),expectedLength);  
    })

    it("get student by id", async function()
    {
        const currentId = await studentContract.getCurrentId();
        const studentToCreate = await studentContract.createStudent("mdfares","dark knight")
        const student = await studentToCreate.wait();
        const event = student.events.find(event => event.event === 'studentCreated');
        const [id, first,last] = event.args;
        expect([id.toString(),first,last]).to.eql([currentId.toString(),"mdfares","dark knight"]);
            
        const getStudent = await studentContract.getStudentById(id);
        expect(getStudent).to.eql([currentId,"mdfares","dark knight"]);

    }) 
} )

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
        const sessionToCreate = await sessionContract.createSession("10112019");
        const session = await sessionToCreate.wait();
        const event = session.events.find(event => event.event === 'sessionCreated');
        const [id, date] = event.args;
        expect([id.toString(),date]).to.eql([currentId.toString(),10112019]);

    
    })    
})

