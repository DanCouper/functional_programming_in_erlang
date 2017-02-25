-module(shapes).
-export([shapeFactory/3]).

-record(shape, {
          name :: atom(),
          sides :: non_neg_integer(),
          radius :: number(),
          apothem :: number(),
          sideLength :: number(),
          perimeter :: number(),
          area :: number(),
          maxHeight :: number(),
          maxWidth :: number()
        }).

%%% Given a name, the number of sides, and a radius (circumradius), generates
%%% a record containing most required information about the regular polygon
%%% generated from the input.
%%%
%%% NOTE: when runnning this in the shell, to load the record in properly use:
%%%
%%%     c(shapes).
%%%     rr(shapes).
%%%
%%% Leaving off the `rr(shapes).` line will mean that the records will display
%%% as bare tuples (none of the fields name), which is a bit difficult to read.
%%%
%%% This doesn't quite fulfil the criteria suggested, for the simple reason that
%%% I'm not quite sure of the criteria or how to shoehorn them into the suggested
%%% functions. I _assume_ this is supposed to expand on the previous video, with
%%% the `{shapename, {X,Y}, Height, Width}` tuple. But this seems to throw up
%%% more questions than it answers (include irregular? down't inclue? base
%%% everything off coordinates?).

-spec(shapeFactory(atom(),integer(),number()) -> #shape{}).
shapeFactory(_,Sides,_) when Sides == 0; Sides == 2 ->
  {error, "Polygon cannot have " ++ lists:concat([Sides]) ++ " sides."};
shapeFactory(Name,Sides,Radius) ->
  #shape{
     name = Name,
     sides = Sides,
     radius = Radius,
     apothem = calcApothem(Radius,Sides),
     sideLength = calcSideLength(Radius,Sides),
     perimeter = calcPerimeter(Radius,Sides),
     area = calcArea(Radius,Sides),
     maxHeight = calcHeight(Radius,Sides),
     maxWidth = calcWidth(Radius,Sides)
  }.

calcSideLength(Radius,1) ->
  2 * Radius * math:pi();
calcSideLength(Radius,Sides) ->
  2 * Radius * math:sin(math:pi()/Sides).

calcApothem(Radius,1) -> Radius;
calcApothem(Radius,Sides) ->
  Radius * math:cos(math:pi()/Sides).

calcArea(Radius,1) ->
  math:pi()*math:pow(Radius,2);
calcArea(Radius,Sides) ->
  Sides * math:pow(Radius,2) * math:tan(math:pi()/Sides).

calcPerimeter(Radius,Sides) ->
  calcSideLength(Radius,Sides) * Sides.

calcHeight(Radius,1) -> Radius * 2;
calcHeight(Radius,Sides) when Sides rem 2 == 0 -> calcApothem(Radius,Sides) * 2;
calcHeight(Radius,Sides) -> Radius + calcApothem(Radius,Sides).

calcWidth(Radius,3) -> calcSideLength(Radius,3);
calcWidth(Radius,Sides) when Sides rem 4 == 0 -> calcApothem(Radius,Sides) * 2;
calcWidth(Radius,Sides) when Sides == 1; Sides rem 2 == 0 -> Radius * 2;
calcWidth(Radius,Sides) -> 2 * calcHeight(Radius,Sides) * math:tan(math:pi()/(2 * Sides)).

