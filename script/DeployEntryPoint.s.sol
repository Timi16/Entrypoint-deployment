// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Script, console} from "forge-std/Script.sol";
import {EntryPoint} from "../src/core/EntryPoint.sol";

contract DeployEntryPoint is Script {
    function run() external returns (EntryPoint) {
        // Load private key from .env
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        
        // Start broadcasting transactions
        vm.startBroadcast(deployerPrivateKey);
        
        // Deploy EntryPoint
        EntryPoint entryPoint = new EntryPoint();
        
        console.log("=================================");
        console.log("EntryPoint deployed at:", address(entryPoint));
        console.log("=================================");
        
        vm.stopBroadcast();
        
        return entryPoint;
    }
}
