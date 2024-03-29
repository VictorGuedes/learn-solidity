// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts@1.0.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimunUsd = 50 * 1e18;

    address[] public funders;
    mapping (address => uint256) public addressToAmountFunded;

    //payable - envia ethereum para o contrato
    // msg.value - atributo que valida quanto foi enviado para o contrato
    function fund() public payable{
        // Quero setar um valor minimo de financiamento em USD
        //require(msg.value >= 1e18, "Not enouth money!"); // 1e18 é o equivalente a 1 ethereum
        require(getConversionRate(msg.value) >= minimunUsd, "Not enouth money!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function getPrice() public view returns (uint256){
        // ABI
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = priceFeed.latestRoundData(); // EHT in terms of USD
        
        return uint256(price * 1e10);
    }

    function getVersion() public view returns (uint256){
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;

        return ethAmountInUsd;
    }

    //function withdraw() public {}

}