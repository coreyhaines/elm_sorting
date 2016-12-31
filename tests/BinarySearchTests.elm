module BinarySearchTests exposing (..)

import BinarySearch
import Test exposing (..)
import Expect


all : Test
all =
    describe "Binary Search"
        [ searchTests ]


searchTests : Test
searchTests =
    describe "Searching Tests"
        [ test "Searching an empty array" <| \() -> Expect.equal -1 <| BinarySearch.search [] 1
        ]
