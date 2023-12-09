contract C {
  int[] data;
  function f() public { (data.pop)(); }
}