// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {FairAuctionGoer} from "contracts/FairAuctionGoer.sol";

contract DeployFairAuctionGoer is Script {
    // token addresses
    IERC20 private constant PROJECT_TOKEN = IERC20(0x0Be47c0355306Aff6166A62B023Ae0b2bb85ECb0);
    IERC20 private constant SALE_TOKEN = IERC20(0xFF970A61A04b1cA14834A43f5dE4533eBDDB5CC8);
    uint256 private constant START_TIME = 1684425600;
    uint256 private constant END_TIME = 1684717200;
    address private constant treasury = address(0xa1EFdA57ffF5Bde3e74C10e2E14154eB0277AD80);
    uint256 private constant MAX_PROJECT_TOKENS_TO_DISTRIBUTE = 300_000e18;
    uint256 private constant MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN = 300_000e6;
    uint256 private constant MAX_RAISE = 3_000_000e6;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        FairAuctionGoer fairAuction = new FairAuctionGoer(
            PROJECT_TOKEN,
            SALE_TOKEN,
            START_TIME,
            END_TIME,
            treasury,
            MAX_PROJECT_TOKENS_TO_DISTRIBUTE,
            MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN,
            MAX_RAISE
        );

        vm.stopBroadcast();
    }

}


