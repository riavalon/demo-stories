module Core.Subscriptions exposing (..)

import Shared.Types exposing (Msg(..), Model)
import Communication.ChromeStorage exposing (load)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ load LoadDemos
        ]
