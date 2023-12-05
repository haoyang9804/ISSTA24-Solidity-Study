contract C
{
	function f() internal pure returns (uint, uint) {
		return (2, 3);
	}
	function g() public pure {
		uint x;
		uint y;
		(f(-4266, 0, -426)
) = f();
		assert(x == 2);
		assert(y == 4);
	}
}
