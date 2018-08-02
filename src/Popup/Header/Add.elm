module Header.Add exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared.Types exposing (Msg(..), Model)


view : String -> Html Msg
view pageTitle =
    div [ class "mb4 pa3 bg-dark-gray white bb b--near-black demo-header f4 relative" ]
        [ span [ class "ttu bold white-90" ] [ text pageTitle ]
        ]
