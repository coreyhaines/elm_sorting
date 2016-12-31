module BinarySearch exposing (search)

import List.Extra as List
import Maybe.Extra as Maybe


type WhereIsItem
    = Value
    | Left
    | Right


search : Int -> List Int -> Int
search item items =
    let
        midIndex =
            (List.length items) // 2

        midValue =
            List.getAt midIndex items
    in
        Maybe.unwrap -1 (search_ item items midIndex) midValue


search_ : Int -> List Int -> Int -> Int -> Int
search_ item items midIndex value =
    case whereMightItemBe item value of
        Value ->
            midIndex

        Left ->
            List.take midIndex items
                |> search item

        Right ->
            let
                foundInRight =
                    (List.drop (midIndex + 1) items)
                        |> search item
            in
                if foundInRight == -1 then
                    -1
                else
                    foundInRight + midIndex + 1


whereMightItemBe : Int -> Int -> WhereIsItem
whereMightItemBe item value =
    if value == item then
        Value
    else if item < value then
        Left
    else
        Right
