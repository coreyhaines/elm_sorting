module BinarySearch exposing (search)

import List.Extra as List


search : List Int -> Int -> Int
search items item =
    case items of
        [] ->
            -1

        _ ->
            let
                midIndex =
                    (List.length items) // 2

                left =
                    List.take midIndex items

                right =
                    List.drop (midIndex + 1) items

                midValue =
                    List.getAt midIndex items

                isMid value =
                    if value == item then
                        midIndex
                    else if value > item then
                        search left item
                    else
                        let
                            foundInRight =
                                search right item
                        in
                            if foundInRight == -1 then
                                -1
                            else
                                foundInRight + midIndex + 1
            in
                Maybe.map isMid midValue
                    |> Maybe.withDefault -1



-- get a midpoint (floor)
-- does item == items[midpoint] if so return midpoint
-- if item < items[midpoint] then search items low..mid - 1
-- if item > items[midpoint ] then search items mid + 1 - high
