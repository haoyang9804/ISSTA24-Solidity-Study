contract C {
  address constant e = 0x1212121212121212121212121000002134593163;

  function f() public returns (byte z) {
    assembly { z := e }
  }
}