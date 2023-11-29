contract A{
    function x() public virtual {
    }
}

interface I{
    function x() external;
}

contract B is A, I{
    
    function x() override(A, I) public {
        super.x();
    }
    
}