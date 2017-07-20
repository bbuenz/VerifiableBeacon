pragma solidity ^0.4.7;
import "SequentialHashing";

contract Referee is HashVerifier{
    //Should be power of 2
    uint8 constant NUM_CHECKPOINTS=1<<3;
    //Has to be even
    uint8 constant NUM_ROUNDS=10;
    uint constant CHALLENGE_RESPONSE_TIMEOUT=5 minutes;
    uint constant CHALLENGE_PERIOD=2 hours;

    struct ChallengeState{
        bool initialized;
        bytes32 firstCheckpoint;
        bytes32 lastCheckpoint;

        bytes32[7] checkpoints;
        uint8 round;
        uint lastChallenge;

    }
    bytes32 private challenge;
    //This stores the challenge and the beacon;
    //TODO: Protect this and beacon getter
    ChallengeState private initialState;

    mapping(address => ChallengeState) private challenges;

    address private prover;


    function Referee(){
        challenge= block.blockhash(block.number-1);
        //Fix for easier debuging
    }


    function submitBeacon(bytes32 _beacon, bytes32[7] _checkpoints) noBeacon{

        initialState=ChallengeState(true,challenge,_beacon,_checkpoints,0,now);
        prover=msg.sender;

    }

    function postChallenge(uint8 prevIndex,bytes32[7] _checkpoints,address challenger) beaconExists inChallengePeriod  indexInBounds(prevIndex)  {
        ChallengeState memory state=challenges[challenger];

        if(state.initialized==false){
            state=ChallengeState(true,initialState.firstCheckpoint,initialState.lastCheckpoint,initialState.checkpoints,0,now);
        }
        if(state.round>=NUM_ROUNDS){
            throw;
        }
        if(state.round%2==0&&msg.sender!=challenger){
            throw;
        }
        if(state.round%2==1&&msg.sender!=prover){
            throw;
        }

        if(prevIndex>0){
            state.firstCheckpoint=state.checkpoints[prevIndex-1];
        }
        if(prevIndex<NUM_CHECKPOINTS-2){
            state.lastCheckpoint=state.checkpoints[prevIndex];
        }
        state.checkpoints=_checkpoints;
        ++state.round;
        state.lastChallenge=now;
        challenges[challenger]=state;
    }
    function callTimeout(){
        ChallengeState state=challenges[msg.sender];
        if(state.round%2!=1){
            throw;
        }
        if(now-state.lastChallenge>CHALLENGE_RESPONSE_TIMEOUT){
                        selfdestruct(msg.sender);
        }

    }

    function finalChallenge(uint8 prevIndex)  inChallengePeriod indexInBounds(prevIndex)  returns (bool){
        address challenger=msg.sender;
        ChallengeState state=challenges[challenger];
        if(state.round!=NUM_ROUNDS){
            throw;
        }

        bytes32 claimedResult;
        bytes32 computedResult;
        bytes32 start;
        if(prevIndex==0){
            start=state.firstCheckpoint;
            claimedResult=state.checkpoints[0];
        }else if(prevIndex==NUM_CHECKPOINTS-2){
            start=state.checkpoints[prevIndex-1];
            claimedResult=state.lastCheckpoint;

        }else{
            start=state.checkpoints[prevIndex-1];
            claimedResult=state.checkpoints[prevIndex];

        }
        bool verified=verify(start,claimedResult);
        if(!verified){

            selfdestruct(challenger);
        }else{
            delete challenges[challenger];
        }
        return verified;



    }

    function getChallenge() returns (bytes32){
        return challenge;
    }
      function getBeacon() returns (bytes32){
        return initialState.lastCheckpoint;
    }
  function getCheckpoints() returns (bytes32[7]){
      return challenges[msg.sender].checkpoints;
  }
    function getFirstCheckpoint() returns (bytes32){
      return challenges[msg.sender].firstCheckpoint;
  }
   function getLastCheckpoint() returns (bytes32){
      return challenges[msg.sender].lastCheckpoint;
  }
    //Modifiers

    modifier noBeacon(){
        if(initialState.initialized==true){
            throw;
        }
        _;
    }
    modifier beaconExists() {
         if(initialState.initialized==false){
            throw;
        }
        _;
    }
    modifier indexInBounds(uint8 prevIndex){
        if(prevIndex>=NUM_CHECKPOINTS-1){
            throw;
        }
        _;
    }
      modifier inChallengePeriod(){
        if(now>initialState.lastChallenge+CHALLENGE_PERIOD){
            throw;
        }
        _;
    }









}
