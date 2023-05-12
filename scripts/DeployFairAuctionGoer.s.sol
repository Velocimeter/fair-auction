// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "../forge-std/Script.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {FairAuctionGoer} from "contracts/FairAuctionGoer.sol";

contract DeployFairAuctionGoer is Script {
    // token addresses
    IERC20 private constant PROJECT_TOKEN = IERC20(0x079559CB64f252C96265Ef0B1da46b5b04248DA9);
    IERC20 private constant SALE_TOKEN = IERC20(0xD87Ba7A50B2E7E660f678A895E4B72E7CB4CCd9C);
    uint256 private constant START_TIME = 8984860;
    uint256 private constant END_TIME = 8987860;
    address private constant treasury = address(0x10C8c5fD1764070AFf2469f25bf90AFb50Bb9eea);
    uint256 private constant MAX_PROJECT_TOKENS_TO_DISTRIBUTE = 300000;
    uint256 private constant MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN = 300000;
    uint256 private constant MAX_RAISE = 3000000;

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


