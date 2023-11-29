pragma experimental SMTChecker;
contract C {
	function f() public {
		fixed x;
		x>>>6;
	}
}