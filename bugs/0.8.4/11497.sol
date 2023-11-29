contract C {
  uint constant a = uint(keccak256(abi.encode(d)));
  uint c = uint(keccak256(abi.encode(d)));
  uint constant d = a;
}