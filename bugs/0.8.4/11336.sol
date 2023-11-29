pragma experimental SMTChecker;
contract C {
  struct S {
    int a;
    bytes5 b;
  }
  function f() public {
    [S({a:2, b:""})];
  }
}