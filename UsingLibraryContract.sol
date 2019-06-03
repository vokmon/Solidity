pragma solidity 0.5.9;

// DRY: Dont' repeat yourself
// Import Math library
import "./Math.sol";
import "./SafeMath.sol";

contract UsingLibraryContract {
    uint256 public value;
    
    // Use SafeMath for unit256 by default
    using SafeMath for uint256;
    uint256 public valueSafeMath;
    
    function calculate(uint256 _value1, uint256 _value2) public {
        value = Math.devide(_value1, _value2);
    }
    
    function calculateSafeMath(uint256 _value1, uint256 _value2) public {
        // Use method directly from SafeMath
        valueSafeMath = _value1.div(_value2);
    }
}