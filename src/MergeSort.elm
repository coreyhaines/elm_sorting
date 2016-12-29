module MergeSort exposing (..)


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
                        |> Debug.log "first"

                last =
                    List.drop half input
                        |> Debug.log "last"
            in
                (sort first) ++ (sort last)
