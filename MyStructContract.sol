pragma solidity 0.5.9;

contract MyStructContract {
    
    // when calling people, it does not return the entire array of people
    // we need to reference the person by id
    // e.g. people[0], people[1]
    // We need to know the size of the array first
    // Then create a loop to get all people in the list
    Person[] public people;
    
    uint256 public peopleCount = 0;
    
    // Model
    struct Person {
        string _firstName;
        string _lastName;
    }
    
    function addPerson(string memory _firstName, string memory _lastName) public {
        people.push(Person(_firstName, _lastName));
        peopleCount += 1;
    }
}