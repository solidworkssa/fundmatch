// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title FundMatch Contract
/// @author solidworkssa
/// @notice Quadratic funding platform for public goods.
contract FundMatch {
    string public constant VERSION = "1.0.0";


    struct Grant {
        address recipient;
        uint256 totalDonated;
        uint256 matched;
    }
    
    Grant[] public grants;
    
    function createGrant(address _recipient) external {
        grants.push(Grant({
            recipient: _recipient,
            totalDonated: 0,
            matched: 0
        }));
    }
    
    function donate(uint256 _id) external payable {
        grants[_id].totalDonated += msg.value;
        // QF logic would go here
    }

}
