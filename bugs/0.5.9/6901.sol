contract Test {
    function test(address target) external view returns (bool status) {
        (status, ) = target.staticcall.gas(30000)("");
    }
}