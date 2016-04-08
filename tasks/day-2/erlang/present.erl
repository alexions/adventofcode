-module(present).

-export([get_square/3, get_ribon_length/3]).

get_square(Width, Length, Height) ->
    SideA = Length * Width,
    SideB = Width * Height,
    SideC = Height * Length,
    MinSide = lists:min([SideA, SideB, SideC]),
    2 * (SideA + SideB + SideC) + MinSide.

get_ribon_length(Width, Length, Height) ->
    [MinSideA, MinSideB, _] = lists:sort([Width, Length, Height]),
    Bow = Width * Length * Height,
    Ribon = (MinSideA + MinSideB) * 2,
    Bow + Ribon.