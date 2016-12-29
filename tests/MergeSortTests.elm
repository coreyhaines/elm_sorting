module MergeSortTests exposing (..)

import MergeSort
import Test exposing (..)
import Expect


testSorted : String -> List Int -> List Int -> Test
testSorted name sorted unsorted =
    test name <|
        \() -> Expect.equal sorted <| MergeSort.sort unsorted


testMerged : String -> List Int -> List Int -> List Int -> Test
testMerged name expected xs ys =
    test name <|
        \() -> Expect.equal expected <| MergeSort.merge xs ys


sortTests : Test
sortTests =
    describe "Sorting Tests"
        [ testSorted "Empty List" [] []
        , testSorted "One Element List" [ 1 ] [ 1 ]
        , testSorted "Two Element Sorted List" [ 1, 2 ] [ 1, 2 ]
        , testSorted "Two Element Unsorted List" [ 1, 2 ] [ 2, 1 ]
        , testSorted "Four Element Sorted List" [ 1, 2, 3, 4 ] [ 1, 2, 3, 4 ]
        , testSorted "Four Element Unsorted List not needing merge" [ 1, 2, 3, 4 ] [ 2, 1, 4, 3 ]
        , testSorted "Three Element Unsorted not needing merge" [ 1, 2, 3 ] [ 1, 3, 2 ]
          -- , testSorted "Four Element Unsorted List needing merge" [ 1, 2, 3, 4 ] [ 4, 3, 1, 2 ]
        ]


mergeTests : Test
mergeTests =
    describe "Merging Tests"
        [ testMerged "Empty List" [] [] []
        , testMerged "Single Item Sorted" [ 1, 2 ] [ 1 ] [ 2 ]
        , testMerged "Single Item Unsorted" [ 1, 2 ] [ 2 ] [ 1 ]
        , testMerged "Big Items Unsorted" [ 1, 2, 3, 4, 5, 6, 7, 8 ] [ 1, 2, 5, 7, 8 ] [ 3, 4, 6 ]
        ]


all : Test
all =
    describe "Merge Sort"
        [ mergeTests
        , sortTests
        ]
