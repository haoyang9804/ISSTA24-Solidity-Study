pragma experimental SMTChecker;
contract C {
    bytes data;
    function g() public returns (uint ret) {
        data.push("b");
    }
}