// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // 0.8.24 - current
 
contract SimpleStorage1 {
    // boolean, uint, int, address, bytes, string
    bool hasFavoriteNumber = true;
    uint number = 5;
    string text = "dasjdoijasiodj";
    int256 Integer = -4;
    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    bytes32 favoriteBytes = "cat"; //0x38238409328409238409 converted to bytes object

}