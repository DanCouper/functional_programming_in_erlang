# Functional Programming in Erlang

> The Erlang philosophy for "let it fail" -- if we're writing a process
> or function to do something, and it fails, we let it fail because we
> want the caller to take responsibility...you design things for correct
> operation, and then other parts of the system will be designed to handle
> error...so it's not defensive programming, it's offensive programming.

Workthrough of [this FutureLearn course](https://www.futurelearn.com/courses/functional-programming-erlang/) run by the University of Kent.

## Syntax Notes

See the page on [Learn X in Y minutes](https://learnxinyminutes.com/docs/erlang/) for a quick overview.

```
% Comment lines use `%`. Multiline comments aren't supported

% Variables use capital letters
A = 1.
B = [4,5,6].

% Expressions are terminated with a period `.`, for example, the variables
% above are all terminated.

% Functions with multiple heads terminate with a semicolon unless they
% are the last function, when they terminate with a period.

% Anonymous functions. Note that the argument _must_ be wrapped in parentheses.
> (fun (X) -> X * X end)(2).
4

% Files must start with the name of the module (the `defmodule` macro does
% this in Elixir). And any functions in the module must be manually `export`ed.
% Module attributes are prepended with a hyphen: ie `-`. The same termination
% rule must be adhered to.
-module(first).
-export([double/2]).

% Function calls from outside the module must be fully qualified
> first:double(2)
4

% Atoms start with a lowercase letter
> foo.
foo

% Numbers can have a base (an int between 2 and 36) specified, in the
% form `base#number`
> 10#100.
100
> 2#100.
4
```



