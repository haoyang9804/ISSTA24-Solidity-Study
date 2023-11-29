pragma experimental SMTChecker;
  
contract C {
    function f(bool b) public pure {
        uint v;
        if (b)
            v >>= 2;
    }
}