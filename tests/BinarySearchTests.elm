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
    test name <| \() -> Expect.equal -1 <| BinarySearch.search item items


testFound : String -> List Int -> Int -> Int -> Test
testFound name items item index =
    test name <| \() -> Expect.equal index <| BinarySearch.search item items


notFoundTests : Test
notFoundTests =
    describe "Not Found"
        [ testNotFound "Searching an empty items" [] 1
        , testNotFound "Searching a one-element items" [ 0 ] 1
        , testNotFound "Searching a two-element array" [ 0, 1 ] 3
        , testNotFound "Four element" [ 1, 2, 3, 10 ] 5
        ]


foundTests : Test
foundTests =
    describe "Found"
        [ testFound "One element items" [ 1 ] 1 0
        , testFound "Two element first" [ 1, 2 ] 1 0
        , testFound "Two element second" [ 1, 2 ] 2 1
        , testFound "Four element last" [ 1, 2, 3, 10 ] 10 3
        , testFound "Four element last" [ 1, 2, 3, 10, 11 ] 10 3
        ]


searchTests : Test
searchTests =
    describe "Searching Tests"
        [ notFoundTests
        , foundTests
        ]
