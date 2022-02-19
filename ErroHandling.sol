pragma solidity 0.7.5;

contract Bank{

    //mapping
    mapping(address => uint) balance;
    address owner;

    constructor(){
        owner = msg.sender;
    }
    // require
    function addBalance(uint _toAdd) public returns(uint){
        require(msg.sender == owner);

        balance[msg.sender] += _toAdd;

        return balance[msg.sender];
    }

    function getBalance() public view returns(uint){
        return balance[msg.sender];
    }

    function transfer(address recipient, uint amount) public {
        require(balance[msg.sender] >= amount, "Balance not sufficient");
        require(msg.sender != recipient, "Can not transfer money to yourself");

        _transfer(msg.sender, recipient, amount);

    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;

    }


}