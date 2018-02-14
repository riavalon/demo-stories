module Shared.Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Shared.Types exposing (Msg(..))


type alias CTALabel =
    String


type alias ClassName =
    String


type alias LinkHREF =
    String


btn : CTALabel -> Maybe ClassName -> Maybe Msg -> Html Msg
btn label clsname msg =
    let
        className =
            case clsname of
                Just val ->
                    val

                Nothing ->
                    "mh2 pa2"

        event =
            case msg of
                Just val ->
                    onClick val

                Nothing ->
                    onClick NoOp
    in
        button [ event, class className ] [ text label ]


alink : CTALabel -> Maybe ClassName -> LinkHREF -> Html Msg
alink label className linkHref =
    let
        clsName =
            case className of
                Just val ->
                    val

                Nothing ->
                    "mh2 pa2 bn bg-light-gray"
    in
        a [ href linkHref, class clsName ] [ text label ]
