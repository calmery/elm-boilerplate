module Tests exposing (..)

import Tuple exposing (first)
import Test exposing (..)
import TestExp exposing (..)
import Update exposing (Msg(NoOp), update)


all : Test
all =
    describe "Elm Tests"
        [ "Update"
            => first (update NoOp "Hello World")
            === "Hello World"
        ]
