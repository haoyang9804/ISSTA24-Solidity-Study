pragma experimental SMTChecker;

contract C {
  fixed a;
  function f() public {
    {
      for(;; a++) f;
    }
  }
}