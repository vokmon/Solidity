pragma solidity 0.5.9;

//!IMPORTANT after deploying ERC20Token, copy the contract address
// e.g. contract address 	0xffca9c3e62aa2b7ad80bb773f52476ca86be26fd
// this contract address is used for the second parameter when constructing EtherContract
contract ERC20Token {
    string public name ;
    
    // https://www.youtube.com/watch?v=on3SZ-BAFw8&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=5
    mapping(address => uint) public balances;
    
    constructor(string memory _name) public {
        name = _name;
    }
    
    function mint() public {
        // cannot use msg.sender here becasue it will be the address of the smart contract
        // who made a call to this method, in this case it is EtherContract
        // but we need the address of the person who made this transaction
        balances[tx.origin] += 1;
    }
}

// inherite from ERC20Token
contract MyToken is ERC20Token {
    
    string public symbol;
    address[] public owners;
    uint256 ownerCount;
    
    // call constructor;
    constructor(string memory _name, string memory _symbol) ERC20Token(_name) public {
        symbol = _symbol;
    }
    
    // Overide the method
    function mint() public {
        // call mint method from parent
        super.mint();
        
        // additional behaviours
        ownerCount = ownerCount+1;
        owners.push(msg.sender);        
    }
}