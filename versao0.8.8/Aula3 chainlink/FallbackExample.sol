// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FallbackExample{

    uint256 public result;

    // Toda vez que enviar uma transacao com ETH pra esse contrato sem usar nenhuma funcao do contrato
    // receive é trigged e executa o que tem dentro 
    receive() external payable {
        result = 1;
    }

    // Toda vez que enviar uma transacao pra esse contrato enviando algum dado que nao é reconhecido pelo contrato
    // fallback é trigged e executa o que tem dentro 
    fallback() external payable { 
        result = 2;
    }

}