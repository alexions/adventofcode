-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Puzzle} = file:read_file(InputFile),
    io:format("5-0 index: ~s~n", [erlang:md5("hello")]),
    halt().

md5_check(Puzzle, Index) ->
    Hash = erlang:md5(Puzzle ++ integer_to_list(Index)),
    case Hash of
        <<00000, _>> -> Index;
        _ -> md5_check(Puzzle, Index + 1)
    end.
