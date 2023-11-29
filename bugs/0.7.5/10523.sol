pragma experimental SMTChecker;
abstract contract A {
    function f() public mod returns (bool r) {
    }
    modifier mod virtual;
}
contract C is A {
    modifier mod override {
        if (false) _;
    }
}