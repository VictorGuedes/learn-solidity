pragma solidity 0.7.5;
import "./Ownable.sol";
import "./Destroyable.sol";

interface GovernmentInterface{
    function addTransaction(address _from, address _to, uint _amount) external;
}

contract Bank is Ownable, Destroyable{
    
    GovernmentInterface governmentInstance = GovernmentInterface(0xB57ee0797C3fc0205714a577c02F7205bB89dF30);
    
    
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
        governmentInstance.addTransaction(msg.sender, recipient, amount);
    }

    function _transfer(address from, address to, uint amount) private {
        balance[from] -= amount;
        balance[to] += amount;

    }
}