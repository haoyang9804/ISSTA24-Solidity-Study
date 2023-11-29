error Error(string);
error Panic(uint);

function panic(uint code)
{
  bytes memory data = abi.encodeCall(Panic, code);
  assembly "evmasm" ("memory-safe") {
    revert(data, mload(data))
  }
}