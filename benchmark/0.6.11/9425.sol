pragma experimental SMTChecker;
contract Other {
	C c;
	function h() public {
	    if (0==1)
		c.setOwner(address(0));
	}
}
contract C {
    address owner;
    function setOwner(address _owner) public {
	owner = _owner;
    }
}
