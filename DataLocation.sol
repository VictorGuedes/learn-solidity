pragma solidity 0.7.5;

contract DataLocation{

    // places in solidity we can store data

    //storage - example: uint data = 123; the uint we be store permanatelly

    //memory - temporary data; example memory string

    //calldata - similar to memory, but READ-ONLY, like val on kotlin, cost less ethereum gas
    //example string calldata text

    function getString(string memory text) public pure returns(string memory){
        return text;
    }

}