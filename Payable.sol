pragma solidity 0.7.5;

contract Bank{

    //mapping
    mapping(address => uint) balance;
    
    address owner;

    // pode adicionar o token indexed tipo 
    // com isso os argumentos com indexed sao indexados pelos nós do ethereum
    // logo posso pegar os address que usaram o event 
    event depositDone(uint amount, address indexed depositedTo);

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

    // payable é o que permite que possa interagir com gwai, ether. No caso depositar ether na carteira.
    function deposit() public payable returns(uint){
        balance[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        
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