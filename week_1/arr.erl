-module(arr).
-export([count/1]).

count(Arr) ->
  count(Arr,0).

count([],Count) ->
  Count;
count([_Head|Tail],Count) ->
  count(Tail,Count+1).
