// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "forge-std/Test.sol";
import "../src/FundMatch.sol";

contract FundMatchTest is Test {
    FundMatch public c;
    
    function setUp() public {
        c = new FundMatch();
    }

    function testDeployment() public {
        assertTrue(address(c) != address(0));
    }
}
