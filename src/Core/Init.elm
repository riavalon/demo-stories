module Core.Init exposing (..)

import Shared.Types exposing (Msg, Model)


init : ( Model, Cmd Msg )
init =
    ( "Hello, world!", Cmd.none )
