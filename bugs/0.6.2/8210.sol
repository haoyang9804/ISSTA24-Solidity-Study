pragma experimental ABIEncoderV2;

contract Parent {
    function internalFn(bytes[2] memory signatures) internal returns (bytes memory) {
    }
    function externalFn(bytes[2] calldata signatures) external returns (bytes memory) {
        return internalFn(signatures);
    }
}