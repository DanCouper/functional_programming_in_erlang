-module(perfect).
-export([isPerfect/1]).

isPerfect(N) ->
  isPerfect(N,1,1).

isPerfect(N,Acc,PowVal) ->
  Double = math:pow(2,PowVal),
  Calc   = Double*(Acc+Double),
  if
    Calc==N -> true;
    Calc>N  -> false;
    Calc<N  -> isPerfect(N,Acc+Double,PowVal+1)
  end.



  
