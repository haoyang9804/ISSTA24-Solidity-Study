contract A {
    function balance() returns (uint) {
        return 1;
    }
}
contract C {
    event Log(uint v);
    function B() {
        A a = new A();
        Log(a.balance);
    }
}