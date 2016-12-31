module BinarySearch exposing (search)


search : List Int -> Int -> Int
search items item =
    case items of
        [] ->
            -1

        x :: xs ->
            if x == item then
                0
            else
                -1
