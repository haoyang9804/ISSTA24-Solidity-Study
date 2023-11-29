pragma experimental SMTChecker;
contract C {
  function f() public {
    (byte("") & (""));
  }
}