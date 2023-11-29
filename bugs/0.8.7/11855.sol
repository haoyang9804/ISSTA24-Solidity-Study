// Dummy.sol
pragma solidity 0.6.11;

contract Dummy {
    string public constant FOO = "FOO";
}

// HasAlias.sol
pragma solidity 0.6.11;

import {Dummy as AliasedDummy} from "./Dummy.sol";

// UseAlias.sol
pragma solidity 0.6.11;

import {AliasedDummy} from "./HasAlias.sol";

contract TestAlias is AliasedDummy {}