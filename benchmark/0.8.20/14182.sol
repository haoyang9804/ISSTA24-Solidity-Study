pragma experimental SMTChecker;
struct S {
    function() external returns (uint) x;
}
contract C {
    function X() public pure returns (uint) {
        return 1;
    }
    function f() public returns (uint) {
        S memory s;
        s.x = this.X;
        return s.x();
    }
}