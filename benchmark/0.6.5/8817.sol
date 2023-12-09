pragma experimental SMTChecker;
contract C {
  fixed x;
  address owner;
  modifier onlyOwner {
    if (msg.sender == owner) _;
  }
  function f() public onlyOwner { x--; }
}