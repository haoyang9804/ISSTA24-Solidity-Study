pragma experimental SMTChecker;
contract A {
  int[] a;
  function f() public {
    (A.a[a.length]=2);
  }
}