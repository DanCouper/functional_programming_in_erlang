-module(bitcalc).
-export([bitsTRec/1]).

bitsTRec(N) ->
  bitsTRec(N,0).

bitsTRec(0,Acc) ->
  Acc;
bitsTRec(N,Acc) ->
  bitsTRec(N bsr 1, (N band 1)+Acc).

