// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/BridgeToken.sol";

contract DeployBridgeToken is Script {
    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(privateKey);

        vm.startBroadcast(privateKey);

        BridgeToken bridgeToken = new BridgeToken(deployerAddress);

        vm.stopBroadcast();

        console.log("Token deployed at: ", address(bridgeToken));
    }
}
