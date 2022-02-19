pragma solidity 0.7.5;

contract Bank{

    //mapping
    mapping(address => uint) balance;

    function addBalance(uint _toAdd) public returns(uint){
        balance[msg.sender] += _toAdd;

        return balance[msg.sender];
    }

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        // check balance of msg.sender
        _transfer(msg.sender, recipient, amount);

    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;

    }


}