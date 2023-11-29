pragma experimental SMTChecker;
contract C {
	bytes array;
	function g(uint x) public {
		for (uint i = 0; i < x; ++i)
			array.push() = bytes1(uint8(i));
	}
}