pragma experimental SMTChecker;

contract C {
    function f() public pure {
        // ffff0000 in bytes4
        bytes4 x = ~bytes4(hex"ffff");
        assert(x == 0xffff0000); // fails
        assert(x == 0x0000ffff); // holds
    }
}