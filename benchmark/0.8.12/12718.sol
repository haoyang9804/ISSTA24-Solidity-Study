pragma solidity 0.8.12;

contract Sender {
    function main(string memory helloworld) external {
        // TypeError: Cannot implicitly convert component at position 0 from "string" to "string".
        abi.encodeCall(IReceiver.methodName, (helloworld));
    }
}

interface IReceiver {
    function methodName(string calldata) external;
}