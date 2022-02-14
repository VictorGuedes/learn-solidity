pragma solidity 0.7.5;

contract HelloWorld{
    
   string message;

    constructor(string memory _message){ // Como passar variabel por parametro
        message = _message;
    }

    // some variables	
    int a = 1;
    uint aa = 2; // only positive numbers >= 0

    string b = "hello";
    bool c = false;
    address d = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    function hello() public pure returns(string memory){
        string memory message = "Hello Naruto"; // dentro de funcao precisa colocar memory
	return "Hello World";
    }

    // pure - significa que a funcao nao interage com nada de fora alem do que ta dentro da funcao 
    function hello() public pure returns(string memory){
        return "hello world";
    }

    // view - interagem com variables globais, mas nao tem o poder de alteralas
    function hellow() public view returns(string memory){
        return message;
    }

    // if else - int como parametro nao precisa de memory
    function helloIf(int number) public view returns(string memory){
        msg.sender // endereço ethereum de quem esta chamando o contrato, interagindo com o contrato
        msg.value // valor da transacao se alguem interagir com o contrato com um montate de ether
        
        if(number == 10){
            return message;
        } else {
            return "wrong number";
        }

        return message;
    }

    // for loops and while funcionam igual C, java, javascript
    function count(int number) public pure returns(int){
        for(int i = 0; i < 10; i++){
            number++;
        }

        return number;
    }
 
    int number;

    function getNumber() public view returns(int){
       return number;
    }

    function setNumber(int _number) public{
        number = _number;
    }	  

}