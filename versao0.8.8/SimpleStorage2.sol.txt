// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // 0.8.24 - current
 
contract SimpleStorage {
    uint256 public favoriteNumber;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    
    // View - so le informaçao do contrato (nao gasta gas)
    // Nao atualiza informacao na blockchain
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    // Pure - usado como funcao interna, tipo reutilizar uma funcao de calculo
    // tambem nao permite ver info da blockchain
    function add() public pure returns (uint256) {
        return (1 + 1);
    }

}