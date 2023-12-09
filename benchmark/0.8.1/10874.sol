contract A {
  function f() public virtual {}
}
contract B {
  function g() public {}
}
contract C is A,B {
  function f() public override (g) {}
}