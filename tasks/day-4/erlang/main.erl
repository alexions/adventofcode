-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Puzzle} = file:read_file(InputFile),
    io:format("5-0 index: ~w~n", [search_index(binary:bin_to_list(Puzzle), 0, fun(Hash) ->
            case Hash of
                <<0, 0, H, _/binary>> when H >= 16#0, H =< 16#F -> true;
                _ -> false
            end
        end
        )]),
    io:format("6-0 index: ~w~n", [search_index(binary:bin_to_list(Puzzle), 0, fun(Hash) ->
            case Hash of
                <<0, 0, 0, _/binary>> -> true;
                _ -> false
            end
        end
        )]),
    halt().

search_index(Puzzle, Index, Check) ->
    Hash = erlang:md5(Puzzle ++ integer_to_list(Index)),
    case Check(Hash) of
        true -> Index;
        _ -> search_index(Puzzle, Index + 1, Check)
    end.