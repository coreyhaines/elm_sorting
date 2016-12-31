module BinarySearch exposing (search)

import List.Extra as List


search : List Int -> Int -> Int
search items item =
    let
        midIndex =
            (List.length items) // 2

        midValue =
            List.getAt midIndex items

        search_ value =
            if value == item then
                midIndex
            else if value > item then
                let
                    left =
                        List.take midIndex items
                in
                    search left item
            else
                let
                    right =
                        (List.drop (midIndex + 1) items)

                    foundInRight =
                        search right item
                in
                    if foundInRight == -1 then
                        -1
                    else
                        foundInRight + midIndex + 1
    in
        Maybe.map search_ midValue
            |> Maybe.withDefault -1
