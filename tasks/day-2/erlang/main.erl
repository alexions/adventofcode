-module(main).
-export([start/1]).

start([InputFile]) ->
    {ok, Data} = file:read_file(InputFile),
    Dimensions = binary:split(Data, <<$\n>>, [global]),
    [Square, RibonLength] = lists:foldl(fun(Dimension, [_Square, _RibonLength]) ->
            [Width, Length, Height] = [binary_to_integer(D) || D <- binary:split(Dimension, <<$x>>, [global])],
            [
                _Square + present:get_square(Width, Length, Height),
                _RibonLength + present:get_ribon_length(Width, Length, Height)
            ]
        end, [0, 0], Dimensions),
    io:format("Total square feets: ~w~nRibon length: ~w~n", [Square, RibonLength]),
    halt().