  contract D {
	  constructor(function() external returns (uint) ) {
	  }
  }

  contract C {
	  function f() public returns (uint r) {
		  D d = new D(this.test);
	  }

	  function test() public pure returns (uint) {
	  }
  }