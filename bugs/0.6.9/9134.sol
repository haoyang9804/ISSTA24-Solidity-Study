//SPDX-License-Identifier: MIT
pragma solidity ^0.6.9;

contract CalldataTest {
  function test(bytes calldata x) public returns (bytes calldata) {
    return x;
  }
  function tester(bytes calldata x) public {
    this.test(x);
  }
}