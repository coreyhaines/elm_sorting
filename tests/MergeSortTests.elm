module MergeSortTests exposing (..)

import MergeSort
import Test exposing (..)
import Expect


testSorted : String -> List Int -> List Int -> Test
testSorted name sorted unsorted =
    test name <|
        \() -> Expect.equal sorted <| MergeSort.sort unsorted


all : Test
all =
    describe "Merge Sort"
        [ testSorted "Empty List" [] []
        , testSorted "One Element List" [ 1 ] [ 1 ]
        , testSorted "Two Element Sorted List" [ 1, 2 ] [ 1, 2 ]
        , testSorted "Two Element Unsorted List" [ 1, 2 ] [ 2, 1 ]
        , testSorted "Four Element Sorted List" [ 1, 2, 3, 4 ] [ 1, 2, 3, 4 ]
        , testSorted "Four Element Unsorted List not needing merge" [ 1, 2, 3, 4 ] [ 2, 1, 4, 3 ]
        , testSorted "Three Element Unsorted not needing merge" [ 1, 2, 3 ] [ 1, 3, 2 ]
        ]
