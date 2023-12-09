contract C{
  struct S{int m;}
  function f(S calldata s) public returns(int r) {assembly{s:=r} }
}