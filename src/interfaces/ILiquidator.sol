/**
 * Created by Pragma Labs
 * SPDX-License-Identifier: MIT
 */
pragma solidity 0.8.19;

interface ILiquidator {
    /**
     * @notice Called by a Creditor to start an auction to liquidate collateral of a Account.
     * @param account The contract address of the Account to liquidate.
     * @param openDebt The open debt taken by `originalOwner`.
     * @param maxInitiatorFee The maximum fee that is paid to the initiator of a liquidation.
     */
    function startAuction(address account, uint256 openDebt, uint80 maxInitiatorFee) external;
}
