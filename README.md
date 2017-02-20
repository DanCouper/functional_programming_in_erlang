# Functional Programming in Erlang

Workthrough of [this FutureLearn course](https://www.futurelearn.com/courses/functional-programming-erlang/) run by the University of Kent.

## Differences from Elixir

```
% Comment lines use `%`. Multiline comments aren't supported

% Variables use capital letters
A = 1.
B = [4,5,6].

% Expressions are terminated with a period `.`, for example, the variables
% above are all terminated.

% Anonymous functions. Note that the argument _must_ be wrapped in parentheses.
> (fun (X) -> X * X end)(2).
4

% Files must start with the name of the module (the `defmodule` macro does
% this in Elixir). And any functions in the module must be manually `export`ed.
% Module attributes are prepended with a hyphen: ie `-`. The same termination
% rule must be adhered to.
-module(first).
-export([double/2]).
```


## Week 1: Basics


