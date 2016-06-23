-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    {SantaSet, _} = lists:foldl(fun move/2, {sets:from_list([{0, 0}]), {0, 0}}, binary_to_list(Data)),

    {SantaMove, RobotMove} = split(binary_to_list(Data)),
    {SSet, _} = lists:foldl(fun move/2, {sets:from_list([{0, 0}]), {0, 0}}, SantaMove),
    {RSet, _} = lists:foldl(fun move/2, {sets:from_list([{0, 0}]), {0, 0}}, RobotMove),

    io:format("Houses with presents (only Santa): ~w~n", [sets:size(SantaSet)]),
    io:format("Houses with presents (Santa with robot): ~w~n", [sets:size(sets:union(SSet, RSet))]),
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

split(L) -> split(L, [], []).
split([H1,H2|T], L1, L2) -> split(T, [H1|L1], [H2|L2]);
split([H1], L1, L2) -> split([], [H1|L1], L2);
split([], L1, L2) -> {lists:reverse(L1), lists:reverse(L2)}.