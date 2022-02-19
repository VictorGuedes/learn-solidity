pragma solidity 0.7.5;
//import "./Ownable.sol";
//import "./Destroyable.sol";

contract Ownable{
    address internal owner;

    modifier onlyOwner {
        require(msg.sender == owner);
        _; // Run the rest of the function
    }

    constructor(){
        owner = msg.sender;
    }
}

contract Destroyable is Ownable{

    function destroy() public onlyOwner {
        address payable receiver = msg.sender;
        selfdestruct(receiver);
    }

}



contract Bank is Ownable, Destroyable{
    mapping(address => uint) balance;
    
    event depositDone(uint amount, address indexed depositedTo);

    modifier costs(uint price){
        require(msg.value >= price);
        _;
    }

    function deposit() public payable returns(uint){
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        
        return balance[msg.sender];
    }

    function withdraw(uint amount) public returns(uint){
        require(balance[msg.sender] >= amount, "You can not withdraw more than you have");
        balance[msg.sender] -= amount;
        msg.sender.transfer(amount);
        
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