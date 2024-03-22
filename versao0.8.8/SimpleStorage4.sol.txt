// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; // 0.8.24 - current
 
contract SimpleStorage {
    uint256 public favoriteNumber;
    
    People public person = People({favoriteNumber: 2, name: "Naruto"});

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    struct People{
        uint256 favoriteNumber;
        string name;
    }

    // memory - existe temporariamente na transacao, pode ser modificado
    // calldata - existe temporariamente na transacao, nao pode ser modificado (constante)
    // storage - existe tipo variavel, fica armazenado
    function addPerson(uint256 _favoriteNumber, string memory _name) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

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