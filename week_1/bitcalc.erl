-module(bitcalc).
-export([bits/1,bitsRec/1]).

%% Given a number N, returns the sum of the
%% bits in a binary representation of N.
bitsRec(0) -> 0;
bitsRec(N) ->
  (N band 1) + bitsRec(N bsr 1).


bits(N) ->
  bits(N,0).

bits(0,Acc) ->
  Acc;
bits(N,Acc) ->
  bits(N bsr 1, (N band 1)+Acc).

