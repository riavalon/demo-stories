module Main exposing (..)

-- PACKAGES

import Html exposing (Html)


-- SRC

import Core.Init exposing (init)
import Core.Update exposing (update)
import Core.View exposing (view)
import Core.Subscriptions exposing (subscriptions)
import Shared.Types exposing (Model, Msg)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
