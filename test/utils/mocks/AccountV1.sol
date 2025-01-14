/**
 * Created by Pragma Labs
 * SPDX-License-Identifier: BUSL-1.1
 */
pragma solidity 0.8.19;

contract AccountV1 {
    address public owner;
    uint256 public totalValue;
    uint256 public lockedValue;
    address public baseCurrency;
    address public trustedCreditor;
    uint16 public accountVersion;

    uint256 public mockToSurpressWarning;

    constructor(address _owner) payable {
        owner = _owner;
    }

    function setTotalValue(uint256 _totalValue) external {
        totalValue = _totalValue;
    }

    function setTrustedCreditor(address _trustedCreditor) external {
        trustedCreditor = _trustedCreditor;
    }

    function isAccountHealthy(uint256 amount, uint256 totalOpenDebt)
        external
        view
        returns (bool success, address _trustedCreditor, uint256 accountVersion_)
    {
        if (amount != 0) {
            //Check if Account is still healthy after an increase of used margin.
            success = totalValue >= lockedValue + amount;
        } else {
            //Check if Account is healthy for a given amount of openDebt.
            success = totalValue >= totalOpenDebt;
        }

        return (success, trustedCreditor, accountVersion);
    }

    function accountManagementAction(address, bytes calldata) external returns (address, uint256) {
        mockToSurpressWarning = 1;
        return (trustedCreditor, accountVersion);
    }
}
