-module(fourth).
-export([maxThree/3,howManyEqual/3]).

maxThree(X,X,X) ->
  X;
maxThree(X,X,Y) ->
  max(X,Y);
maxThree(X,Y,Z) ->
  MaxXY = max(X,Y),
  maxThree(MaxXY,MaxXY,Z).


howManyEqual(X,X,X) -> 3;
howManyEqual(X,X,_) -> 2;
howManyEqual(X,_,X) -> 2;
howManyEqual(_,X,X) -> 2;
howManyEqual(_,_,_) -> 0.
