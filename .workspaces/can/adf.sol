// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC1155, Ownable {
    constructor() ERC1155("") {}
     uint256 public mintRate = 0.01 ether;
     uint256[] public minted = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
     uint256[] public supplies = [200, 200, 200, 200, 300, 300 , 400, 200, 500, 500];
   

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint256 id, uint256 amount)
        payable
        public
    {
        require(id <= supplies.length, "Token doesn't exist.");
        require(id > 0, "Token doesn't exist.");
        require(msg.value >= (amount * mintRate), "Not enough ether sent.");
        require(minted[id - 1] + amount <= supplies[id - 1], "Not enough supply left.");
        _mint(msg.sender, id, amount,"" );
    }
    
} 