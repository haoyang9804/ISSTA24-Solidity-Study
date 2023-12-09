contract A {
    function f() virtual internal {}
}
contract B is A {
    function f() override internal {}
    function h() internal { f; }
}