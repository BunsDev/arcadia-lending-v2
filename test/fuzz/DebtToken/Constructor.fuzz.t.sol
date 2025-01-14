/**
 * Created by Pragma Labs
 * SPDX-License-Identifier: BUSL-1.1
 */
pragma solidity 0.8.19;

import { DebtToken_Fuzz_Test } from "./_DebtToken.fuzz.t.sol";

import { DebtTokenExtension } from "../../utils/Extensions.sol";

/**
 * @notice Fuzz tests for the function "constructor" of contract "DebtToken".
 */
contract Constructor_DebtToken_Fuzz_Test is DebtToken_Fuzz_Test {
    /* ///////////////////////////////////////////////////////////////
                              SETUP
    /////////////////////////////////////////////////////////////// */

    function setUp() public override {
        DebtToken_Fuzz_Test.setUp();
    }

    /*//////////////////////////////////////////////////////////////
                              TESTS
    //////////////////////////////////////////////////////////////*/
    function testFuzz_Success_deployment() public {
        debt_ = new DebtTokenExtension(asset);

        assertEq(debt_.name(), string("Arcadia Asset Debt"));
        assertEq(debt_.symbol(), string("darcASSET"));
        assertEq(debt_.decimals(), 18);
    }
}
