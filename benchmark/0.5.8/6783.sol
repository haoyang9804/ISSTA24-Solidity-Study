contract StructsMappingArrays {

  struct A {
    mapping(int=>int)[] m;
  }

  A a1;

  function() external payable {
    A memory ma = A();
    a1.m.length = 3;
    a1 = ma;
    assert(a1.m.length == 3);
  }

}