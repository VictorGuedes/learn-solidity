// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "../node_modules/@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20Capped, Ownable{

    constructor() ERC20("MyToken", "MT") ERC20Capped(100000){
        _mint(msg.sender, 1000);
    }


}