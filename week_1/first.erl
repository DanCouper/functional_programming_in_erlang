% The module name must always be provided, and must correspond
% to the actual name of the file.
% NOTE that expressions are terminated with a period.
-module(first).
% and any exports as well: those exports, when used, must be fully
% qualified: _eg_ `first:double(2)`
-export([mult/2,square/1,double/1,treble/1,area/3]).

% Variables/arguments use capital letters (or underscores).
% Contrast with atoms, which use lowercase letters.
mult(X,Y) ->
  X*Y.

square(X) ->
  mult(X,X).

double(X) ->
  mult(2,X).

treble(X) ->
  mult(3,X).

% When there are a sequence of expressions within a function body,
% they are seperated with commas - the final period terminates the
% sequence.
area(A,B,C) ->
  S = (A+B+C)/2,
  math:sqrt(S*(S-A)*(S-B)*(S-C)).
