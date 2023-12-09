pragma experimental SMTChecker;
contract C {
    function f3() public returns(int) {
        ((, ), ) = ((7, 8), 9);
    }
}