/**
 * Created by Pragma Labs
 * SPDX-License-Identifier: BUSL-1.1
 */
pragma solidity ^0.8.13;

import "../lib/accounts-v2/src/test/Base_IntegrationAndUnit.t.sol";
import { Base_Lending_Test } from "./Base_Lending.t.sol";

/// @notice Common logic needed by all integration and unit tests.
abstract contract Base_IntegrationAndUnit_Lending_Test is Base_Lending_Test, Base_IntegrationAndUnit_Test {
/*//////////////////////////////////////////////////////////////////////////
                                     VARIABLES
    //////////////////////////////////////////////////////////////////////////*/

/*//////////////////////////////////////////////////////////////////////////
                                   TEST CONTRACTS
    //////////////////////////////////////////////////////////////////////////*/

/*//////////////////////////////////////////////////////////////////////////
                                  SET-UP FUNCTION
    //////////////////////////////////////////////////////////////////////////*/

    function setUp() public virtual {
        Base_Lending_Test.setUp();
        Base_IntegrationAndUnit_Test.setUp();
    }

/*//////////////////////////////////////////////////////////////////////////
                                      HELPERS
    //////////////////////////////////////////////////////////////////////////*/

/*//////////////////////////////////////////////////////////////////////////
                                    CALL EXPECTS
    //////////////////////////////////////////////////////////////////////////*/
}
