// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimunUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;
    
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not owner");
        _;
    }

    //payable - envia ethereum para o contrato
    // msg.value - atributo que valida quanto foi enviado para o contrato
    function fund() public payable{
        // Quero setar um valor minimo de financiamento em USD
        //require(msg.value >= 1e18, "Not enouth money!"); // 1e18 é o equivalente a 1 ethereum
        require(msg.value.getConversionRate() >= minimunUsd, "Not enouth money!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public onlyOwner {
        for(uint256 index = 0; index < funders.length; index++){
            address funder = funders[index]; 
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

}