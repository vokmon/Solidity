pragma solidity 0.5.9;


//!IMPORTANT after deploying ERC20Token, copy the contract address
// e.g. contract address 	0xffca9c3e62aa2b7ad80bb773f52476ca86be26fd
// this contract address is used for the second parameter when constructing EtherContract
contract ERC20Token {
    string public name;
    
    // https://www.youtube.com/watch?v=on3SZ-BAFw8&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=5
    mapping(address => uint) public balances;
    
    function mint() public {
        // cannot use msg.sender here becasue it will be the address of the smart contract
        // who made a call to this method, in this case it is EtherContract
        // but we need the address of the person who made this transaction
        balances[tx.origin] += 1;
    }
}

contract EtherContract {

    
    // make wallet accepts ether
    address payable wallet;
    address public token;
    
    constructor(address payable _wallet, address _token) public {
        wallet = _wallet;
        token = _token;
    }
    
    // create index on buyer for searching
    event Purchase(address indexed _buyer, uint256 _amount);
    
    // public can be called from inside and outside the contract
    // external can be called only from outside
    // fallback function
    function() external payable {
        buyToken();
    }
    
    // payable: to allow the function send ether in the transaction
    function buyToken() public payable {
        
        // ERC20Token _token = ERC20Token(address(token));
        // _token.mint();
        ERC20Token(address(token)).mint();
        
        // send ether to the wallet
        wallet.transfer(msg.value);
        
        // emit an event
        emit Purchase(msg.sender, 1);
    }
}