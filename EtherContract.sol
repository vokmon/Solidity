pragma solidity 0.5.9;

contract EtherContract {
    // https://www.youtube.com/watch?v=BHdPZWRjtgc&list=PLS5SEs8ZftgUq-aMMYeKf8nPqHrNqa3Iu&index=4
    mapping(address => uint) public balances;
    
    // make wallet accepts ether
    address payable wallet;
    
    constructor(address payable _wallet) public {
        wallet = _wallet;
    }
    
    // payable: to allow the function send ether in the transaction
    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        
        // send ether to the wallet
        wallet.transfer(msg.value);
        
        
    }
}