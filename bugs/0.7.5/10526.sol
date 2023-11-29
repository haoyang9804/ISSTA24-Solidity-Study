pragma experimental SMTChecker;
contract C {
    uint[] data;
    function f(uint x, uint[] calldata input) public returns (uint, uint) {
        (uint a, uint[] calldata b) = fun(input, data);
    }
}
function fun(uint[] calldata _x, uint[] storage _y) view  returns (uint, uint[] calldata) {
	return (_y[0], _x);
}