// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TinyTestToken is ERC20 {
    constructor() ERC20("TinyTestToken", "TTT") {
        // 100 tokens with 18 decimals
        _mint(msg.sender, 100 * 10 ** decimals());
    }
}
