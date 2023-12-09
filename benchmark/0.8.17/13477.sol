pragma experimental SMTChecker;
library L1 {}
library L2 {
  function f1() public {}
  function f() internal { f1(); }
}