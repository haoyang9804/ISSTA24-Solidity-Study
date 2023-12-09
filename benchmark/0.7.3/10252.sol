pragma experimental SMTChecker;
contract C {
    function f3() public returns (bytes memory r) {
        bytes memory y = "def";
        y[0]&= "e";
    }
}