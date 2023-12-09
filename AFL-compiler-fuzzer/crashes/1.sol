contract C {
    // function f0() public { (()) = 2; }

    function f1() public pure { (!()) = (); }

        function f2() internal pure returns (uint, uint) { return () = f2(); }

        function f3()public{return()=();}

        function f4 ( bytes32 hash , uint8 v , bytes32 r , bytes32 s , uint blockExpired , bytes32 salt ) public returns ( address ) {
        require (
) ;
        return ecrecover ( hash , v , r , s ) ;
    }
}
