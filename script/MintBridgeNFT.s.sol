// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/BridgeNFT.sol";

contract MintBridgeNFT is Script {
    function run() public {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(privateKey);
        address contractAddress = 0x935823a204874dA68023f073d61bCD759Ff267Af;

        vm.startBroadcast(privateKey);

        BridgeNFT bridgeNFT = BridgeNFT(contractAddress);

        bridgeNFT.safeMint(deployerAddress);

        vm.stopBroadcast();
    }
}
