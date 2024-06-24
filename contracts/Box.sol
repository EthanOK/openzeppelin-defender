// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import {SLGUUPSUpgradeable} from "./SLGUUPSUpgradeable.sol";

/// @title Box
/// @notice A box with objects inside.
contract Box is SLGUUPSUpgradeable {
    /*//////////////////////////////////////////////////////////////
                                VARIABLES
    //////////////////////////////////////////////////////////////*/

    /// @notice Number of objects inside the box.
    uint256 public numberOfObjects;

    /*//////////////////////////////////////////////////////////////
                                FUNCTIONS
    //////////////////////////////////////////////////////////////*/

    /// @notice No constructor in upgradable contracts, so initialized with this function.
    function initialize(uint256 objects, address multisig) public initializer {
        __SLGUUPS_init();

        numberOfObjects = objects;

        _grantRole(UPGRADER_ROLE, multisig);
    }

    /// @notice Remove an object from the box.
    function removeObject() external {
        require(numberOfObjects > 1, "Nothing inside");
        numberOfObjects -= 1;
    }
}
