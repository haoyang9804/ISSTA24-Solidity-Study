// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

contract A {
    /// @return y value
    function g(int x) public pure virtual returns (int y) { return x; }
}

contract B is A {
    function g(int x) public pure override returns (int z) { return x; }
}