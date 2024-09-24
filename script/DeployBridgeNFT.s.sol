// set up contract as script
// import "forge-std/Script.sol";
// run function / external
// get private key and address
// start broadcast
// new token
// stop broadcast
// log output

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/BridgeNFT.sol";

contract DeployBridgeNFT is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(privateKey);

        vm.startBroadcast();

        BridgeNFT bridgeNFT = new BridgeNFT(deployerAddress);

        vm.stopBroadcast();

        console.log("BridgeNFT deployed to", address(bridgeNFT));
    }
}
