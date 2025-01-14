/**
 * Created by Pragma Labs
 * SPDX-License-Identifier: BUSL-1.1
 */
pragma solidity 0.8.19;

import { Tranche_Fuzz_Test } from "./_Tranche.fuzz.t.sol";

/**
 * @notice Fuzz tests for the function "maxDeposit" of contract "Tranche".
 */
contract MaxDeposit_Tranche_Fuzz_Test is Tranche_Fuzz_Test {
    /* ///////////////////////////////////////////////////////////////
                              SETUP
    /////////////////////////////////////////////////////////////// */

    function setUp() public override {
        Tranche_Fuzz_Test.setUp();
    }

    /*//////////////////////////////////////////////////////////////
                              TESTS
    //////////////////////////////////////////////////////////////*/
    function testFuzz_Success_maxDeposit_Locked(address receiver) public {
        vm.prank(address(pool));
        tranche.lock();

        assertEq(tranche.maxDeposit(receiver), 0);
    }

    function testFuzz_Success_maxDeposit_AuctionInProgress(address receiver) public {
        vm.prank(address(pool));
        tranche.setAuctionInProgress(true);

        assertEq(tranche.maxDeposit(receiver), 0);
    }

    function testFuzz_Success_maxDeposit_Paused(address receiver) public {
        vm.warp(35 days);
        vm.startPrank(users.creatorAddress);
        pool.changeGuardian(users.creatorAddress);
        pool.pause();
        vm.stopPrank();

        assertEq(tranche.maxDeposit(receiver), 0);
    }

    function testFuzz_Success_maxDeposit_SupplyCapExceeded(address receiver, uint128 supplyCap, uint128 totalLiquidity)
        public
    {
        vm.assume(supplyCap > 0);
        vm.assume(supplyCap < totalLiquidity);

        vm.prank(users.creatorAddress);
        pool.setSupplyCap(supplyCap);
        pool.setTotalRealisedLiquidity(totalLiquidity);

        assertEq(tranche.maxDeposit(receiver), 0);
    }

    function testFuzz_Success_maxDeposit_WithSupplyCap(address receiver, uint128 supplyCap, uint128 totalLiquidity)
        public
    {
        vm.assume(supplyCap > 0);
        vm.assume(supplyCap >= totalLiquidity);

        vm.prank(users.creatorAddress);
        pool.setSupplyCap(supplyCap);
        pool.setTotalRealisedLiquidity(totalLiquidity);

        assertEq(tranche.maxDeposit(receiver), supplyCap - totalLiquidity);
    }

    function testFuzz_Success_maxDeposit_WithoutSupplyCap(address receiver, uint128 totalLiquidity) public {
        pool.setTotalRealisedLiquidity(totalLiquidity);

        vm.prank(users.creatorAddress);
        pool.setSupplyCap(0);

        assertEq(tranche.maxDeposit(receiver), type(uint128).max - totalLiquidity);
    }

    function testFuzz_Success_maxMint_Locked(address receiver) public {
        vm.prank(address(pool));
        tranche.lock();

        assertEq(tranche.maxMint(receiver), 0);
    }
}
