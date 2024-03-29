// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimunUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    //payable - envia ethereum para o contrato
    // msg.value - atributo que valida quanto foi enviado para o contrato
    function fund() public payable{
        // Quero setar um valor minimo de financiamento em USD
        //require(msg.value >= 1e18, "Not enouth money!"); // 1e18 é o equivalente a 1 ethereum
        require(msg.value.getConversionRate() >= minimunUsd, "Not enouth money!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public {
        for(uint256 index = 0; index < funders.length; index++){
            address funder = funders[index]; 
            addressToAmountFunded[funder] = 0;
        }
        // reset the array
        funders = new address[](0);

        //withdraw using transfer. this é o contrato e precisa transformar o sender em payable
        // Se a transacao falhar, da erro e reverte a transacao
        payable(msg.sender).transfer(address(this).balance);

        //withdraw using send. Se falhar retorna um booleano e nao reverte a transacao
        bool sucess = payable(msg.sender).send(address(this).balance);
        require(sucess, "Send failed");
        
        //withdraw using call. Nao tem limite de gas e retorna um booleano
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "call failed");
    }

}