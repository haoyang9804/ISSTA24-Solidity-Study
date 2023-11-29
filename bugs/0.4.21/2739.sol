library L {
  function f() {}
  function g() external {}
}

contract C {
  function f() {
    L.f();
    L.g(); // not visible
  }
}