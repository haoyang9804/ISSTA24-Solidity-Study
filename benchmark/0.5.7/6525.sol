contract InvalidTest {

  function() internal storedFn;

  constructor() public {
    function() internal invalid;
    storedFn = invalid; //wrong format!
  }

  function run() public {
    storedFn(); //not guaranteed to cause exception!
  }
}