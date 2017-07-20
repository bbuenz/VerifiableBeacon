pragma solidity ^0.4.7;

contract ModSquaring{
        //It is faster to pass in the parameters then to store them in the contract
        //mu is precomputed as in http://cacr.uwaterloo.ca/hac/about/chap14.pdf 14.42
       function  squareMod(uint128[] a,uint128[] p,uint128[] mu) returns (uint128[]){
        return reduce(square(a),p,mu);

    }


    //http://cacr.uwaterloo.ca/hac/about/chap14.pdf 14.42
     function reduce(uint128[] x,uint128[] p, uint128[] mu) returns (uint128[]) {
        uint k=p.length;
        uint128[] memory q2=multiply(x,(k-1),x.length,mu);
        uint128[] memory resultArr=new uint128[] (k+1);
        multiply(q2,k+1,q2.length,p,resultArr);

        subtract(x,k+1,resultArr,resultArr);
        if(compare(resultArr,p)>0){
                 subtract(resultArr,resultArr.length,p,resultArr);
        }
        return resultArr;

    }



    //["55118165149374409119441216119413761026", "265061826949299110830368790704498640569", "300521695615681644794695341510018298528", "54530299560789227599107570026971128394", "71733251100534160453953577909295437626", "220411398049372823160336614040244919231", "184696793962099687431081466998393535749", "7322398326798248374870583692637721116"],["8927915239697290504852011324446591464", "187495788097959546505201523618550384481", "40973013603509160184080314943928029279", "172895300241464466985696750100405637966", "61578131693935342232040621215739594614", "251941516561054923699045255914867180567", "211463475223641439340526528779523568258", "214728581139365324922875373285087570001", "273870799808541713772737455294475126899", "279682588608523038486153166561967936179", "57394012307978892662500096995871093432", "155834915080132789790604408201555017510", "82896135016063304504922814160290442132", "212052247433649349713454407107857307483", "119842806979691575985921458468191875116", "284391773475239181811945254931245429520"]

    function  multiply(uint128[] a,uint128[] b) returns (uint128[]){
        uint blength=b.length;
        uint128[] memory result=new uint128[](a.length+blength);
        for (uint i=0;i<a.length;++i){
            uint128 carry=0;
            uint128 ai;
            assembly{
                ai:=mload(add(add(a,0x20),i))
            }
            for (uint j =0;j<blength;++j){

                uint256 temp;
                assembly{
                    let j:=0
                loop:
                    jumpi(loopend, eq(j, blength))
                    let bj:=mload(add(add(b,0x20),j))
                    let resultij:=mload(add(add(result,0x20),add(i,j)))
                    temp:=add(carry,add(mul(ai,bj),resultij))
                    j := add(j, 1)
                    jump(loop)
                loopend:

                }
                result[i+j]=uint128(temp);
                carry=uint128(temp>>128);

            }
            result[i+blength]=carry;

        }
        return result;



    }
    function  multiply(uint128[] a, uint aStart,uint aEnd,uint128[] b) returns (uint128[]){
        uint128[] memory result=new uint128[](aEnd-aStart+b.length);
        for (uint i=aStart;i<aEnd;++i){
            uint128 carry=0;
            uint256 ai=uint256(a[i]);
            for (uint j =0;j<b.length;++j){
                uint resultIndex=i+j-aStart;
                uint256 temp=carry+ai*b[j]+result[resultIndex];
                result[resultIndex]=uint128(temp);
                carry=uint128(temp>>128);
            }
            result[i+b.length-aStart]=carry;

        }
        return result;

    }
    function  multiply(uint128[] a, uint aStart,uint aEnd,uint128[] b,uint128[] result) returns (uint128[]){
        for (uint i=aStart;i<aEnd;++i){
            uint128 carry=0;
            uint256 ai;
            assembly{
                ai:=mload(add(add(a,0x20),i))
            }
            for (uint j =0;j<b.length;++j){
                uint resultIndex=i+j-aStart;
                if(resultIndex<result.length){
                    uint256 temp=carry+ai*b[j]+result[resultIndex];
                    result[resultIndex]=uint128(temp);
                    carry=uint128(temp>>128);
                }
            }
            uint finalIndex=i+b.length-aStart;
            if(finalIndex<result.length){
                result[finalIndex]=carry;
            }

        }

    }


    function square(uint128[] a) returns (uint128[]){
       uint128[] memory result=new uint128[](a.length*2);
       for(uint i=0;i<a.length;++i){
           uint256 temp=a[i]*a[i];

       }


        return multiply(a,a);
    }




    function compare(uint128[] a, uint128[] b) returns (int8){
        uint aLength=a.length;
        uint bLength=b.length;

        uint maxLength=aLength > bLength? aLength : bLength;
        for(uint i =maxLength-1;i>=0;--i){
            uint128 aVal=i>=aLength?0:a[i];
            uint128 bVal=i>=bLength?0:b[i];
            if(aVal>bVal){
                return 1;
            }
            if(bVal > aVal){
                return -1;
            }
        }
        return 0;
    }
    //a>b
    function subtract(uint128[] a, uint128[] b) returns (uint128[]){

       uint128[] memory result=new uint128[](a.length);

        uint8 carry=0;
        for(uint i=0;i<a.length;++i){
            int bVal=i>=b.length?0:b[i];
            int resultBuf=a[i]-bVal-carry;
            result[i]=uint128(resultBuf);
            if(resultBuf<0){
                carry=1;
            }else{
                carry=0;
            }
        }
        return result;
    }
    //a>b
    function subtract(uint128[] a,uint aLength, uint128[] b) returns (uint128[]){

       uint128[] memory result=new uint128[](aLength);

        uint8 carry=0;
        for(uint i=0;i<aLength;++i){
            int bVal=i>=b.length?0:b[i];
            int resultBuf=a[i]-bVal-carry;
            result[i]=uint128(resultBuf);
            if(resultBuf<0){
                carry=1;
            }else{
                carry=0;
            }
        }
        return result;
    }
    //a>b
    function subtract(uint128[] a,uint aLength, uint128[] b,uint128[] result) returns (uint128[]){


        uint8 carry=0;
        for(uint i=0;i<aLength;++i){
            int bVal=i>=b.length?0:b[i];
            int resultBuf=a[i]-bVal-carry;
            result[i]=uint128(resultBuf);
            if(resultBuf<0){
                carry=1;
            }else{
                carry=0;
            }
        }
        return result;
    }





}

