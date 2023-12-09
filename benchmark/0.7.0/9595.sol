pragma experimental SMTChecker;
contract C {
  mapping(byte => int) x;
  constructor() {
    x[""];
  }
}