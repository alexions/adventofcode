-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    {SantaSet, _} = lists:foldl(fun move/2, {sets:from_list([{0, 0}]), {0, 0}}, binary_to_list(Data)),

    {SantaWRobotSet, _, _, _} = lists:foldl(fun(Direction, {Set, Santa, Robot, Switcher}) ->
            case Switcher of
                true ->
                    {NewSet, NewPosition} = move(Direction, {Set, Santa}),
                    {NewSet, NewPosition, Robot, not Switcher};
                false ->
                    {NewSet, NewPosition} = move(Direction, {Set, Robot}),
                    {NewSet, Santa, NewPosition, not Switcher}
            end
        end, {sets:from_list([{0, 0}]), {0, 0}, {0, 0}, true}, binary_to_list(Data)),

    io:format("Houses with presents (only Santa): ~w~n", [sets:size(SantaSet)]),
    io:format("Houses with presents (Santa with robot): ~w~n", [sets:size(SantaWRobotSet)]),
    halt().

move(Direction, {Set, {X, Y}}) ->
    NewPosition = case Direction of
        $^ -> {X, Y + 1};
        $v -> {X, Y - 1};
        $> -> {X + 1, Y};
        $< -> {X - 1, Y};
        _ -> {X, Y}
    end,
    {sets:add_element(NewPosition, Set), NewPosition}.