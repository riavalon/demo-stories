module Shared.Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared.Types exposing (Msg)


-- import Html.Events exposing (onClick)


type alias ButtonLabel =
    String


type alias ClassName =
    String


btn : ButtonLabel -> Maybe ClassName -> Html Msg
btn label clsname =
    let
        className =
            case clsname of
                Just val ->
                    val

                Nothing ->
                    "mh2 pa2"
    in
        button [ class className ] [ text label ]
