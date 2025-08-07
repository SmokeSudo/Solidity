// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SMOKESUDO is ERC20, ERC20Burnable, Pausable, Ownable {
    uint256 public constant INITIAL_SUPPLY = 333_333_333 * 10 ** 18;

    constructor() 
        ERC20("SmokeSudoToken", "SMOKE") 
        Ownable(msg.sender) // 👈 Pass initial owner to Ownable constructor
    {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _update(address from, address to, uint256 value)
        internal
        override
        whenNotPaused
    {
        super._update(from, to, value);
    }
}
