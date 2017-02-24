-module(shapes).
-export([shapeFactory/4]).

-record(shape, {
          name :: atom(),
          sides :: non_neg_integer(),
          incenter :: {number(),number()},
          radius :: number(),
          apothem :: number(),
          sideLength :: number(),
          perimeter :: number(),
          area :: number(),
          vertices=[] :: [] | [{number(),number()}]
        }).

%%% Functions for calculating the perimeter and area of regular
%%% polygons. Take a tuple `{Sides,{X,Y},Radius}` where radius is the
%%% distance of the centre point to any vertex.

%calculateArea({}) ->
%calculateVertices({}) ->
%calculateApothem(Sides,Radius) ->

-spec(shapeFactory(atom(),integer(),{number(),number()},number()) -> #shape{}).
shapeFactory(_,Sides,_,_) when Sides == 0; Sides == 2 ->
  {error, "Polygon cannot have " ++ lists:concat([Sides]) ++ " sides."};
shapeFactory(Name,Sides,Incenter,Radius) ->
  #shape{
     name = Name,
     sides = Sides,
     incenter = Incenter,
     radius = Radius,
     apothem = calcApothem(Radius,Sides),
     sideLength = calcSideLength(Radius,Sides),
     perimeter = calcPerimeter(Radius,Sides),
     area = calcArea(Radius,Sides)
  }.

calcSideLength(Radius,Sides) ->
  2 * Radius * math:sin(math:pi()/Sides).

calcApothem(Radius,Sides) ->
  Radius * math:cos(math:pi()/Sides).

calcArea(Radius,Sides) ->
  Sides * math:pow(Radius,2) * math:tan(math:pi()/Sides).

calcPerimeter(Radius,Sides) ->
  calcSideLength(Radius,Sides) * Sides.
