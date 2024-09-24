// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract BridgeToken is ERC20, Ownable, ERC20Permit {
    constructor(address initialOwner) ERC20("BRIDGETOKEN", "BRT") Ownable(initialOwner) ERC20Permit("BRIDGETOKEN") {}

    function mint(address to, uint256 amt) public onlyOwner {
        _mint(to, amt);
    }
}
