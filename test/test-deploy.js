const hre = require("hardhat");
const {expect , assert } = require("chai");

describe("StudentFactory", function () {
    let studentContractFactory, studentContract ;
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

        
        const currentLength = await studentContract.getStudentsLength();
        const expectedLength = "1";
        assert.equal(currentLength.toString(),expectedLength);
    
        const getStudent = await studentContract.getStudentById(id);
        expect(getStudent).to.eql([currentId,"mdfares","dark knight"]);

    })

  
    
} )