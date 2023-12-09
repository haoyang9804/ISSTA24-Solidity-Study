pragma experimental SMTChecker;
contract C {
        function f() public {
                (((,))) = ((2),3);
        }
}