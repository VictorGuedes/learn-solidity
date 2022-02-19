pragma solidity 0.7.5;

contract Bank{

    //mapping
    mapping(address => uint) balance;
    address owner;

    // Usado para em funcao para reaproveitar codigo (executa algo antes da funcao) 
    modifier onlyOwner {
        require(msg.sender == owner);
        _; // Run the rest of the function
    }

    modifier costs(uint price){
        require(msg.value >= price);
        _; // Run the rest of the function
    }

    constructor(){
        owner = msg.sender;
    }

    // require
    function addBalance(uint _toAdd) public onlyOwner returns(uint){
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