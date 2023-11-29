contract C {
  function f(int[] calldata b) external { [b[:]]; }
}