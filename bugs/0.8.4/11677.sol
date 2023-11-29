contract C {
    function f(string calldata data) external pure {
        bytes(data[:32]);
    }
}