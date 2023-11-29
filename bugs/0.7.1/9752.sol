contract C  {
  int x;
  string y;

  function f1 (string memory y_, int x_) public { x = x_ + 1; y = y_; }
  function f1 (int x_, string memory y_) public { x = x_; y = y_; }
  function g11 () public { f1({y_:"foo", x_:42}); } // calls first f1
  function g12 () public { f1({x_:42, y_:"foo"}); } // calls second f1

  function f2 (int z_, string memory y_, int x_) public { x = x_ + 1; y = y_; }
  function f2 (int z_, int x_, string memory y_) public { x = x_; y = y_; }
  function g21 () public { f2({y_:"foo", x_:42, z_:0}); } // typecheck error : function not found
  function g22 () public { f2({x_:42, y_:"foo", z_:0}); } // calls first f2

  function f3 (string memory y_, int z_, int x_) public { x = x_ + 1; y = y_; }
  function f3 (int x_, int z_, string memory y_) public { x = x_; y = y_; }
  function g31 () public { f3({y_:"foo", x_:42, z_:0}); } // calls first f3
  function g32 () public { f3({x_:42, y_:"foo", z_:0}); } // typecheck error : function not found

}