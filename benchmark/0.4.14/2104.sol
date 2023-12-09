
library WithModifier {
    modifier mod() {
        _;
    }

    function withMod(uint self) mod() internal {}
}

contract Test {
    using WithModifier for *;

    function wontCompile(uint _value) {
        _value.withMod();
    }
}