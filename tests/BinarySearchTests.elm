module BinarySearchTests exposing (..)

import BinarySearch
import Test exposing (..)
import Expect


all : Test
all =
    describe "Binary Search"
        [ searchTests ]


testNotFound : String -> List Int -> Int -> Test
testNotFound name items item =
    test name <| \() -> Expect.equal -1 <| BinarySearch.search items item


searchTests : Test
searchTests =
    describe "Searching Tests"
        [ testNotFound "Searching an empty items" [] 1
        , testNotFound "Searching a one-element items, not found" [ 0 ] 1
        ]
