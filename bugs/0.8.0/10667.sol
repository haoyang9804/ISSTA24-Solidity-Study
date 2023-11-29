contract C {
  function()[] x;
  function f() public {
    function() view[] memory xmem;
    x = xmem;
  }
}