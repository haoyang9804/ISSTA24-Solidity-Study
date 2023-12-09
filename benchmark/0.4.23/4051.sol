contract TestRevert {
    string constant ERR = "Error";
    
    function revertWithErr() public {
        revert(ERR);
    }
}