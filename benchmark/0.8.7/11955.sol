contract C { type T0 is uint; }
contract D { C.T0 x = C.T0.wrap(uint(1)); }