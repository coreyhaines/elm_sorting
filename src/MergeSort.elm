module MergeSort exposing (..)


merge : List Int -> List Int -> List Int
merge xs ys =
    case xs of
        [] ->
            ys

        x :: xs_ ->
            case ys of
                [] ->
                    xs

                y :: ys_ ->
                    case x < y of
                        True ->
                            x :: (merge xs_ ys)

                        False ->
                            y :: (merge ys_ xs)


sort : List Int -> List Int
sort input =
    case input of
        [] ->
            []

        [ _ ] ->
            input

        [ x, y ] ->
            case x > y of
                True ->
                    [ y, x ]

                False ->
                    [ x, y ]

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
