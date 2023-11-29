contract testReturnValues {
    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    function retunValues1 () public returns (bool _b, uint _u, int _i, address _a)  {
        _b = true;
        _u = 345;
        _i = -345;
        _a = msg.sender;
    }

    function retunValues2 () public returns (byte _b, bytes2 _b2, bytes3 _b3, bytes memory _blit, bytes5 _b5, bytes6 _b6, string memory _str, bytes7 _b7, bytes22 _b22, bytes32 _b32)  {
        _b = 0x12;
        _b2 = 0x1223;
        _b5 = hex"043245";
        _b6 = hex"2345532532";
        _b7 = hex"03252353253253";
        _b22 = hex"325235235325325325235325";
        _b32 = hex"032523532532523532523532523532";
        _blit = hex"123498";
        _str = "this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string _ this is a long string";
    }

    function retunValues3 () public returns (ActionChoices _en, int[5][] memory _a1)  {
       _en = ActionChoices.GoStraight;
       int[5][] memory a = new int[5][](3);
       a[0] = [int(1),-45,-78,56,60];
       a[1] = [int(-1),42,334,-45455,-446];
       a[2] = [int(1),10,-5435,45,-7];
      _a1 = a;
    }
  }