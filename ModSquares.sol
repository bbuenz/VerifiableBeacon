pragma solidity ^0.4.7;
import "SequentialFunction";

contract ModSquaresShort is SequentialFunction{
   function verify(bytes32 x,bytes32 y)returns (bool){
        uint root=uint(x);
       return bytes32(square(root,0))==y;

    }
    function square(uint root, uint round) returns (uint result){

        assembly{
            let prime:=93562206091353489197036529912283681953119642796574493316945928221464230509473
            let n:=0
        loop:
            jumpi(loopend, eq(n, 5))
            let nextFree:=mload(0x40)
            mstore(0x40,add(nextFree,0x20))

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)


            n := add(n, 1)
            jump(loop)
        loopend:

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            root:=xor(sha3(nextFree,32),mulmod(root,root,prime))
            round:=add(round,1)

            mstore(nextFree,round)
            result:=xor(sha3(nextFree,32),mulmod(root,root,prime))



        }
    }
}
