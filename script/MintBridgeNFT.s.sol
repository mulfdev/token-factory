// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/BridgeNFT.sol";

contract MintBridgeNFT is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address contractAddress = 0x3fDF6968C4e2Fa70bb74b58671046d6EBE717E62;
        address deployerAddress = vm.addr(privateKey);
        address recipient = 0x1279874A02eEBA3fBEAe83BA7fbe3f3Aa60bfF3e;

        vm.startBroadcast(privateKey);

        BridgeNFT bridgeNFT = new BridgeNFT(contractAddress);

        bridgeNFT.safeMint(recipient);

        vm.stopBroadcast();
    }
}
