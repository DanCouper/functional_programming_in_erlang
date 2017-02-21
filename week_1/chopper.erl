-module(chopper).
-export([pieces/1,pieces3D/1]).

%% Specify how many regions on a 2D plane can be created with `N` cuts.
%% [Equation taken from cut-the-knot.com](http://www.cut-the-knot.org/proofs/LinesDividePlane.shtml).
pieces(N) ->
  binomial(N,2) + binomial(N,1) + binomial(N,0).

%% Specify how many regions on a 3D plane can be created with `N` cuts.
%% [Equation taken from cut-the-knot.com](http://www.cut-the-knot.org/proofs/LinesDividePlane.shtml).
pieces3D(N) ->
  binomial(N,3) + binomial(N,2) + binomial(N,1) + binomial(N,0).

% Note converted from a Haskell example
binomial(N,0) ->
  1;
binomial(N,K) when is_integer(N), is_integer(K), (N>=0), (K>=0), (N>=K) ->
  binomial(N,K,1,1).
 
binomial(N,K,K,Acc) ->
  (Acc * (N-K+1)) div K;
binomial(N,K,I,Acc) ->
  binomial(N,K,I+1,(Acc * (N-I+1)) div I).
