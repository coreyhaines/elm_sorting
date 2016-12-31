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


testFound : String -> List Int -> Int -> Int -> Test
testFound name items item index =
    test name <| \() -> Expect.equal index <| BinarySearch.search items item


notFoundTests : Test
notFoundTests =
    describe "Not Found"
        [ testNotFound "Searching an empty items" [] 1
        , testNotFound "Searching a one-element items" [ 0 ] 1
        ]


foundTests : Test
foundTests =
    describe "Found"
        [ testFound "One element items" [ 1 ] 1 0 ]


searchTests : Test
searchTests =
    describe "Searching Tests"
        [ notFoundTests
        , foundTests
        ]
