// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/BridgeToken.sol";

contract MintBridgeToken is Script {
    function run() public {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");
        address contractAddress = 0x8cd532eB2e94d3A055A740E7601605bCCB5c5Db1;
        address recipient = 0x1279874A02eEBA3fBEAe83BA7fbe3f3Aa60bfF3e;

        uint256 unformattedAmt = 4;
        uint256 formattedAmt = unformattedAmt * 1e18;

        vm.startBroadcast(deployerKey);

        BridgeToken bridgeToken = BridgeToken(contractAddress);

        bridgeToken.mint(recipient, formattedAmt);

        vm.stopBroadcast();
    }
}
