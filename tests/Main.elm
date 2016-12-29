port module Main exposing (..)

import MergeSortTests
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)


main : TestProgram
main =
    run emit MergeSortTests.all


port emit : ( String, Value ) -> Cmd msg
