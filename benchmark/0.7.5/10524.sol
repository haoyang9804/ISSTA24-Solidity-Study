pragma experimental SMTChecker;
library L {
    struct S {
        uint256[] data;
    }
    function f(S memory _s) internal {
    }
}
contract C {
    using L for L.S;
    function f() public returns (uint256) {
        L.S memory x;
        (x.f)();
    }
}