-module(factorial).
-export([simple_fac/1]).

% Regarding recursion, recursive functions can be described as
% "executable specifications" - they are a direct description
% of the possible states. Variables are not being changed, instead
% the answer is being directly described.
simple_fac(0) ->
  1;
simple_fac(N) when N>0 ->
  simple_fac(N-1)*N.
