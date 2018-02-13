module Core.View exposing (..)

import Html exposing (Html, div)
import Html.Attributes exposing (class)
import Shared.Types exposing (Msg, Model)
import Header.Popup as Header
import Demos.List as Demos


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden vh-100 flex flex-column items-stretch" ]
        [ Header.view
        , Demos.demoList
        ]
