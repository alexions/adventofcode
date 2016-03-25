-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    {Level, Basemant, _} = lists:foldl(fun(Sym, {Level, Basemant, Index}) ->
            NewLevel = case Sym of
                $( -> Level + 1;
                $) -> Level - 1;
                _ -> Level
            end,
            NewBasemant = case NewLevel of
                -1 when Basemant == 0 -> Index;
                _ -> Basemant
            end,
            {NewLevel, NewBasemant, Index + 1}
        end, {0, 0, 1}, binary_to_list(Data)),
    io:format("Level: ~w~nBasemant: ~w~n", [Level, Basemant]).