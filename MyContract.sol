pragma solidity 0.5.9;

contract MyContract {
    
    // State variable, set to public
    // Can be accessed from outside
    string public value = "My Value";
    
    // Constant value
    string public constant constantValue = "Constant value";
    
    bool public myBool = true;
    
    // signed integer: can be negative e.g. -100
    int public myInt = -10;
    
    // Unsigned integer: cannot be negative
    uint public myUInit = 1;
    
    uint8 public myInt8 = 8;
    uint256 public myInt256 = 999999;
    
    //enum
    enum State { Waiting, Ready, Active }
    State public state = State.Ready;
    
    // constructor() public {
    //     value = "My Value";
    // }
    
    
    function setValue(string memory _value) public {
        value = _value;
    }
    
    // These 2 methods can be omitted as the variables are public
    // function get() public view returns(string memory) {
    //   return value;
    // }
    
    // function getConstant() public pure returns(string memory) {
    //     return constantValue;
    // }
}