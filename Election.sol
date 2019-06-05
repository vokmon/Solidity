pragma solidity ^0.5.9;

contract Election {
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }
    
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;
    uint public candidateCount;
    
    event voteEvent(uint indexed _candidateId);
    
    constructor() public {
        addCandidate('Candidate 1');
        addCandidate('Candidate 2');
    }
    
    function addCandidate(string memory _name) private {
        candidateCount++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
    
    function vote(uint _candidateId) public {
        require(!voters[msg.sender], "You've already voted.");
        require(_candidateId >0 && _candidateId <= candidateCount, "Wrong candidate id");
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit voteEvent(_candidateId);
    }
}