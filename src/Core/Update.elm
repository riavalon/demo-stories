module Core.Update exposing (..)

import Shared.Types exposing (Msg(..), Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )
