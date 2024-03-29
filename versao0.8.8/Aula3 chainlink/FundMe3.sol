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

    //function withdraw() public {}

}