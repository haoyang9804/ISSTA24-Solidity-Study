contract C {
    function () internal returns (uint) x;
    constructor() public {
        C.x;
    }
}