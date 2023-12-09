import "9229.sol" as A;

library L {
    function f() internal pure {}
}

contract C
{
    function test() public pure {
        A.L;
    }
}