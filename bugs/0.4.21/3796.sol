//pragma solidity 0.4.20;

contract test {
    function f() pure public {
        int8 x;
        if( x == 1) {} // OK
        if( 1 == x) {} // Compiler error
    }
}