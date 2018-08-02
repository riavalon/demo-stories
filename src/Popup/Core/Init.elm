module Core.Init exposing (..)

import Navigation
import Core.Routing as Routing
import Shared.Types exposing (Msg, Model, SprintDemo)


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    let
        currentRoute =
            Routing.parseLocation location
    in
        ( Model
            "Sprint Demos"
            [ (SprintDemo "sprint 7" "2018-02-23") ]
            currentRoute
            (SprintDemo "" "")
        , Cmd.none
        )
