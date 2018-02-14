module Header.Popup exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Core.Routing as Routing
import Shared.Types exposing (Msg(..), Model)
import Shared.Views exposing (alink)


createButtonClass : String
createButtonClass =
    "bn no-outline bg-white-10 ttu bold flex no-underline items-center ph4 nowrap absolute white right-0 top-0 bottom-0 "
        ++ "hover-bg-white-30"


view : String -> Html Msg
view pageTitle =
    div [ class "pa3 bg-dark-gray white demo-header f4 relative" ]
        [ span [ class "ttu bold white-90" ] [ text pageTitle ]
        , alink "New" (Just createButtonClass) Routing.createDemoPath
        ]
