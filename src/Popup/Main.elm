module Main exposing (..)

-- PACKAGES

import Navigation


-- SRC

import Core.Init exposing (init)
import Core.Update exposing (update)
import Core.View exposing (view)
import Core.Subscriptions exposing (subscriptions)
import Shared.Types exposing (Model, Msg(..))


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
