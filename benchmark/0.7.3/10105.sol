pragma experimental ABIEncoderV2;
contract C {
        struct S { int[][5] c; }
        S s;
        function f(S calldata c) external { s = c; }
}