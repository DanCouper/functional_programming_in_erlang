-module(second).
-export([hypotenuse/2,perimeter/2,area/2]).

% When defining functions with multiple heads, the functions
% are delimited with a semicolon (the final function is
% terminated as normal, with a period).
hypotenuse(A,B) when A > 0, B > 0 ->
  math:sqrt(first:square(A)+first:square(B));
hypotenuse(_,_) ->
  {error, 'all side lengths must be positive'}.

perimeter(A,B) ->
  A+B+hypotenuse(A,B).

area(A,B) ->
  first:area(A,B,hypotenuse(A,B)).
