pragma solidity ^0.4.7;
import "SequentialFunction";

contract HashVerifier is SequentialFunction{


    function verify(bytes32 x,bytes32 y)returns (bool){
         return hash(x)==y;

    }



    //Unrolled loop for speed improvements (48 gas per hash)
    //Returns keccack^1024(x)
    function hash(bytes32 x)   returns (bytes32 r){
        assembly{

            let nextFree:=mload(0x40)
            mstore(0x40,add(nextFree,0x20))

            mstore(nextFree,x)
            let n:=0
        loop:
            jumpi(loopend, eq(n, 10))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))

            n := add(n, 1)
            jump(loop)
        loopend:
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))
            mstore(nextFree,sha3(nextFree,0x20))

            r:= sha3(nextFree,0x20)
    }
    }
    }




