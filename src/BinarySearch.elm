module BinarySearch exposing (search)

import List.Extra as List


type WhereIsItem
    = Value
    | Left
    | Right


search : List Int -> Int -> Int
search items item =
    let
        midIndex =
            (List.length items) // 2

        midValue =
            List.getAt midIndex items
    in
        Maybe.map (search_ midIndex items item) midValue
            |> Maybe.withDefault -1


search_ : Int -> List Int -> Int -> Int -> Int
search_ midIndex items item value =
    case whereMightItemBe value item of
        Value ->
            midIndex

        Left ->
            List.take midIndex items
                |> flip search item

        Right ->
            let
                foundInRight =
                    (List.drop (midIndex + 1) items)
                        |> flip search item
            in
                if foundInRight == -1 then
                    -1
                else
                    foundInRight + midIndex + 1


whereMightItemBe : Int -> Int -> WhereIsItem
whereMightItemBe value item =
    if value == item then
        Value
    else if item < value then
        Left
    else
        Right
