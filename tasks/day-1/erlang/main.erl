-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    {Level, Basemant, _} = lists:foldl(fun level/2, {0, 0, 1}, binary_to_list(Data)),
    io:format("Level: ~w~nBasemant: ~w~n", [Level, Basemant]),
    halt().

level(Char, {-1, 0, Index}) ->
    level(Char, {-1, Index - 1, Index});
level($(, {Level, Basemant, Index}) -> 
    {Level + 1, Basemant, Index + 1};
level($), {Level, Basemant, Index}) -> 
    {Level - 1, Basemant, Index + 1};
level(_, Acc) -> Acc.