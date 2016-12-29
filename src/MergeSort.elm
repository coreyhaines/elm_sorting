module MergeSort exposing (..)


merge : List Int -> List Int -> List Int
merge xs ys =
    case ( xs, ys ) of
        ( [], _ ) ->
            ys

        ( _, [] ) ->
            xs

        ( x :: xs_, y :: ys_ ) ->
            if x < y then
                x :: (merge xs_ ys)
            else
                y :: (merge ys_ xs)


sort : List Int -> List Int
sort input =
    case input of
        [] ->
            []

        [ _ ] ->
            input

        _ ->
            let
                length =
                    (List.length input)

                half =
                    length // 2

                first =
                    List.take half input

                last =
                    List.drop half input
            in
                merge (sort first) (sort last)
