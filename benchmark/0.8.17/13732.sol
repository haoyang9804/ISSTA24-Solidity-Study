pragma experimental SMTChecker;
contract C {
        ///@custom:smtchecker b
        ///@custom:smtchecker
        function f()internal {}
}