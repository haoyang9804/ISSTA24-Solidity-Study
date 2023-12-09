pragma experimental SMTChecker;
contract C {
    function f() public returns (uint, uint) {
	while(1==1)
	    try this.f() returns (uint a, uint b) {
		    b = 2;
		} catch {
	    }
    }
}