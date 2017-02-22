-module(factorial).
-export([simple_fac/1,fac/1]).

% Regarding recursion, recursive functions can be described as
% "executable specifications" - they are a direct description
% of the possible states. Variables are not being changed, instead
% the answer is being directly described.
simple_fac(0) ->
  1;
simple_fac(N) when N>0 ->
  simple_fac(N-1)*N.

% Above version isn't tail recursive, so
% can be modified by using an accumulator.
fac(N) ->
  fac(N,1).

fac(0,Acc) ->
  1;
fac(N,Acc) where N>0 ->
  fac(N-1,N*Acc).
