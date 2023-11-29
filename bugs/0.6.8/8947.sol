pragma experimental SMTChecker;
contract c {
	function f() internal returns (uint) {
	}
		bool b = (f() == 0) && (f() == 0);
	function g() public returns (bool) {
	}
}