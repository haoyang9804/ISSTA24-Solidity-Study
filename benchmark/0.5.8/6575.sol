pragma experimental SMTChecker;
contract C { constructor(uint) public {} }
contract A is C { constructor() C(2) public {} }
contract B is C { constructor() C(3) public {} }
contract J is C { constructor() C(3) public {} }