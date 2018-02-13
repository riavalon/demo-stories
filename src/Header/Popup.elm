module Header.Popup exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared.Types exposing (Msg, Model)
import Shared.Views exposing (btn)


view : Html Msg
view =
    div [ class "pa3 bg-blue white bb b--dark-blue demo-header f4 relative" ]
        [ btn "Create Demo" (Just "bn bg-white-30 ph4 nowrap absolute white right-0 top-0 bottom-0")
        ]
