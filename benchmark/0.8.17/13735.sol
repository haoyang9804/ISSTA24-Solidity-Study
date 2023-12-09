pragma experimental SMTChecker;
contract C0 {
  type T0 is bool;
  mapping(T0 =>bytes25)s0;
  constructor() {
    s0[C0.T0.wrap(true)] ;
  }
}