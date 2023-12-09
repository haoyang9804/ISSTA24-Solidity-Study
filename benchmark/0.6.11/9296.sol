pragma experimental SMTChecker;
contract C
{
    function i() public returns (uint d) {
	if (0==0)
            (d) = 13;
    }
}