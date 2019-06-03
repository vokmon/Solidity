pragma solidity 0.5.9;

contract PeopleContract {
    
    uint256 public peopleCount = 0;
    
    // Maping unit to Person object
    // If the key does not exist e.g. 99999, the default value of person will be returned as an example below
    // 0: uint256: _id 0
    // 1: string: _firstName
    // 2: string: _lastName
    // So we need to know the size of the map
    mapping(uint => Person) public people;
     
    // Time in second
    // absolute unix timestamps (seconds since 1970-01-01)
    // https://www.epochconverter.com/clock
    uint256 openningTime = 1559537577;//Change this value for test
    
    modifier onlyWhileOpen() {
        // msg, tx, block, now
        require(block.timestamp >= openningTime, "This operation can be performed while the service is open");
        _;
    }
    
    // Model
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    // Add custom modifier: onlyOwner
    // Try switch accoutn and add a person, it will throw an exception
    function addPerson(
        string memory _firstName,
        string memory _lastName
    )
        public 
        onlyWhileOpen 
        returns(uint) 
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        // return id of the newly added person
        return peopleCount;
    }
    
    // private method
    function incrementCount() internal {
        peopleCount += 1;
    }
}