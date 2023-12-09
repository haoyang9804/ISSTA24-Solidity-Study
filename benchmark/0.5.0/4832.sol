// `external` keyword problem in interface 
interface FooI {
    // No problem
    function fooNum(uint num) external;

    // TypeError: Function overload clash during conversion to external types for arguments.
    function fooNums(uint[] calldata nums) external;

    // Error not thrown for no matching implementation 
    function fooNums2(uint[] calldata nums) external;
}

contract Foo is FooI {
    function fooNum(uint num) public {}
    function fooNums(uint[] memory nums) public {}
}