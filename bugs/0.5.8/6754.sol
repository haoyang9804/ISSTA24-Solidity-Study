pragma experimental ABIEncoderV2;

contract A {
    struct Struct {
        string a;
        uint8 b;
        string c;
    }
    
    constructor(Struct memory s) public {}
}