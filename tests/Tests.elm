module Tests exposing (..)

import BinarySearchTests
import MergeSortTests
import Test exposing (Test, describe)


all : Test
all =
    describe "Our Tests"
        [ MergeSortTests.all
        , BinarySearchTests.all
        ]
