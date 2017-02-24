-module(fibonacci).
-export([fib/1]).

%% Simple non-tail recursive fib:
simpleFib(0) -> 0;
simpleFib(1) -> 1;
simpleFib(N) -> fib(N-2) + fib(N-1).


%% Simple recursive fibonacci function: find the nth fibonacci number.
%%    1. fib(4)
%%    2. fib(4,0,1)
%%    3. fib(3,1,1)
%%    4. fib(2,1,2)
%%    5. fib(1,2,3)
%%    6. 3

% Base cases of 0 or 1 handled seperately
fib(0) -> 0;
fib(1) -> 1;
% Anything above 1 gets passed into `fib/3`
fib(T) -> fib(T,0,1).

% Guard takes into account that 0 and 1
% are special cases, so stop at third
% in fib sequence (1).
fib(0,Prev,_Curr) ->
  Prev;
fib(T,Prev,Curr) ->
  fib(T-1,Curr,Prev+Curr).


%% Return pairs of fibonacci numbers. The reason for this is
%% to move the two accumulators out of the function definition.
%% The return value is more complex, but the `fib/1` function can
%% be defined that extracts the correct value from the fibP/1 function.
fibP(O) ->
  {0,1};
fibP(T) ->
  {Prev,Curr} = fibP(T-1),
  {Curr,Prev+1}.
