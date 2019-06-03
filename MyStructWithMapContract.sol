pragma solidity 0.5.9;

contract MyStructWithMapContract {
    
    uint256 public peopleCount = 0;
    
    // Maping unit to Person object
    // If the key does not exist e.g. 99999, the default value of person will be returned as an example below
    // 0: uint256: _id 0
    // 1: string: _firstName
    // 2: string: _lastName
    // So we need to know the size of the map
    mapping(uint => Person) public people;
     
    
    // Model
    struct Person {
        uint _id;
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public returns(uint) {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstName, _lastName);
        // return id of the newly added person
        return peopleCount;
    }
}