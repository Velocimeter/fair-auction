// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IFlow} from "contracts/interfaces/IFlow.sol";
import {FairAuctionNoES} from "contracts/FairAuctionNoES.sol";

contract DeployAutoBribe is Script {
    // token addresses
    
    address private constant PROJECT_TOKEN = address(0x079559CB64f252C96265Ef0B1da46b5b04248DA9);
    address private constant SALE_TOKEN = address(0xD87Ba7A50B2E7E660f678A895E4B72E7CB4CCd9C);
    uint256 private constant START_TIME = 8984595;
    uint256 private constant END_TIME = 8985595;
    address private constant treasury = address(0x10C8c5fD1764070AFf2469f25bf90AFb50Bb9eea);
    uint256 private constant MAX_PROJECT_TOKENS_TO_DISTRIBUTE = 1000;
    uint256 private constant MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN = 1000;
    uint256 private constant MAX_RAISE = 10000;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        
        FairAuctionNoES fairAuction = new FairAuctionNoES(
            IERC20(PROJECT_TOKEN),
            IERC20(SALE_TOKEN),
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

//  forge script scripts/DeployAutoBribe.s.sol:DeployAutoBribe --rpc-url https://mainnode.plexnode.org:8545 -vvv
// forge script scripts/DeployAutoBribe.s.sol:DeployAutoBribe --rpc-url https://mainnode.plexnode.org:8545 -vvv --broadcast --slow
// forge verify-contract --verifier blockscout --verifier-url https://tuber.build/api 0x98f04f3b3601106644089E5791117E702fb19BcD AutoBribe --chain-id 7700
// forge script scripts/DeployFairAuctionNoEs.s.sol:DeployAutoBribe --rpc-url https://rpc.ankr.com/eth_goerli --chain-id 5 -vvv
