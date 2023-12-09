contract C {
	function literalToUFixed() public pure returns (ufixed8x2) {
		ufixed8x2 a = 0.10;
		return a;
	}
}