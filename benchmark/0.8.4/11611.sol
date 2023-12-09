contract C {
    function f (address) external returns (bool) {
        this.f{gas: 42}.address;
    }
}

//--optimize