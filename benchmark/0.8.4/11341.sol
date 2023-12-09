pragma experimental SMTChecker;
contract State {
    function f() public view returns (uint) {
    }
}
contract C {
    State s;
    uint z = s.f();
}