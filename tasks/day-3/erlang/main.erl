-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    {Set, _} = lists:foldl(fun(Direction, {Set, Position}) ->
            NewPosition = case Direction of
                $^ -> {element(1, Position), element(2, Position) + 1};
                $v -> {element(1, Position), element(2, Position) - 1};
                $> -> {element(1, Position) + 1, element(2, Position)};
                $< -> {element(1, Position) - 1, element(2, Position)};
                _ -> Position
            end,
            {sets:add_element(NewPosition, Set), NewPosition}
        end, {sets:from_list([{0, 0}]), {0, 0}}, binary_to_list(Data)),

    io:format("Houses with presents: ~w~n", [sets:size(Set)]),
    halt().