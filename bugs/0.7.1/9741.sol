pragma experimental SMTChecker;
contract C {
  function f(bool x) public pure { x ? (1,2) : (3,4); }
}