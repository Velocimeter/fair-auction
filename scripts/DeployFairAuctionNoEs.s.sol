// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {IFlow} from "contracts/interfaces/IFlow.sol";
import {FairAuctionNoES} from "contracts/FairAuctionNoES.sol";

contract DeployAutoBribe is Script {
    // token addresses
    address private constant FLOW = 0xB5b060055F0d1eF5174329913ef861bC3aDdF029;
    address private constant PROJECT_TOKEN = address(0);
    address private constant SALE_TOKEN = address(0);
    uint256 private constant START_TIME = 0;
    uint256 private constant END_TIME = 0;
    address private constant treasury = address(0);
    uint256 private constant MAX_PROJECT_TOKENS_TO_DISTRIBUTE = 0;
    uint256 private constant MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN = 0;
    uint256 private constant MAX_RAISE = 0;

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        uint256 csrNftId = IFlow(FLOW).csrNftId();
        FairAuctionNoES fairAuction = new FairAuctionNoES(
            IERC20(PROJECT_TOKEN),
            IERC20(SALE_TOKEN),
            START_TIME,
            END_TIME,
            treasury,
            MAX_PROJECT_TOKENS_TO_DISTRIBUTE,
            MIN_TOTAL_RAISED_FOR_MAX_PROJECT_TOKEN,
            MAX_RAISE,
            csrNftId
        );

        vm.stopBroadcast();
    }
}

//  forge script scripts/DeployAutoBribe.s.sol:DeployAutoBribe --rpc-url https://mainnode.plexnode.org:8545 -vvv
// forge script scripts/DeployAutoBribe.s.sol:DeployAutoBribe --rpc-url https://mainnode.plexnode.org:8545 -vvv --broadcast --slow
// forge verify-contract --verifier blockscout --verifier-url https://tuber.build/api 0x98f04f3b3601106644089E5791117E702fb19BcD AutoBribe --chain-id 7700
