pragma experimental SMTChecker;
library L {
       function f() public {
        (bool success, ) = address(10).staticcall{gas: 3}("");
    }
}