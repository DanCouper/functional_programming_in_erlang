-module(third).
-export([xOr_1/2,xOr_2/2,xOr_3/2,xOr_4/2,xOr_5/2,xOr_6/2,xOr_7/2]).


xOr_1(true,false) ->
  true;
xOr_1(false,true) ->
  true;
xOr_1(_,_) ->
  false.


xOr_2(X,X) ->
  false;
xOr_2(_,_) ->
  true.


xOr_3(X,Y) when X =/= Y ->
  true;
xOr_3(_,_) ->
  false.


xOr_4(X,Y) ->
  if
    X == Y ->
      false;
    X =/= Y ->
      true
  end.

xOr_5(X,Y) ->
  X xor Y.


xOr_6(X,Y) ->
  case X and Y of
    true -> false;
    false -> true
  end.

xOr_7(X,Y) ->
  not(X == Y).
