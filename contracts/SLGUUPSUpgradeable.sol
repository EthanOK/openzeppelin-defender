// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/AccessControlUpgradeable.sol";

contract SLGUUPSUpgradeable is UUPSUpgradeable, AccessControlUpgradeable {
    bytes32 public constant UPGRADER_ROLE = "UPGRADER_ROLE";
    bytes32 public constant OPERATOR_ROLE = "OPERATOR_ROLE";

    function __SLGUUPS_init() internal onlyInitializing {
        __AccessControl_init();
        __UUPSUpgradeable_init();

        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    /// @notice UUPS _authorizeUpgrade method.
    /// @param newImplementation new implementation address
    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyRole(UPGRADER_ROLE) {}
}
