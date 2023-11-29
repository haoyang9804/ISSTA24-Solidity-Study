pragma experimental SMTChecker;
contract C {
  function g() public returns (uint, function() external, uint)
  {
    try this.g() returns(uint, function() external, uint b) { (b); }
    catch {}
  }
}