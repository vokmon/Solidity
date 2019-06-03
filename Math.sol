pragma solidity 0.5.9;

// DRY: Dont' repeat yourself
library Math {
    function devide(uint256 a, uint256 b) internal pure returns(uint256) {
        require(b > 0, "Devider must be greater than 0!");
        return a/b;
    }
}