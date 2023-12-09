pragma experimental ABIEncoderV2;
contract CrashContract {
   function f1() public pure returns (bytes) {
       return abi.encode(1,-2);
   }
}