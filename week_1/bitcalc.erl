-module(bitcalc).
-export([bits/1]).

%% Given a number N, returns the sum of the
%% bits in a binary representation of N.
%% NOTE I may be being an idiot here, but I couldn't
%% figure out a direct-recursive version.
bits(N) ->
  bits(N,0).

bits(0,Acc) ->
  Acc;
bits(N,Acc) ->
  bits(N bsr 1, (N band 1)+Acc).

