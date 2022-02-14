pragma solidity 0.7.5;

contract HelloWorld{

    // Arrays

    int[] numbers1;
    int[7] numbers2 = [0,1,2,3,4,5,6];
    int[] numbers;

    function addNumber(int _number) public {
        numbers.push(_number);
    }

    function getNumber(uint _index) public view returns(int) {
        return numbers[_index];
    }

    function getNumbers() public view returns(int[] memory){
        return numbers;
    }


}