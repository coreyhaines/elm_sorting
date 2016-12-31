module BinarySearchTests exposing (..)

import BinarySearch
import Test exposing (..)
import Expect


all : Test
all =
    describe "Binary Search"
        [ searchTests ]


testNotFound : String -> List Int -> Int -> Test
testNotFound name array key =
    test name <| \() -> Expect.equal -1 <| BinarySearch.search array key


searchTests : Test
searchTests =
    describe "Searching Tests"
        [ testNotFound "Searching an empty array" [] 1
        , testNotFound "Searching a one-element array, not found" [ 0 ] 1
        ]
