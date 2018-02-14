module Core.View exposing (..)

import Html exposing (Html, div)
import Shared.Types exposing (Msg, Model)
import Core.Routing as AppRouter
import Demos.List as DemosList
import Demos.Add as DemosAdd


view : Model -> Html Msg
view model =
    div []
        [ page model ]


page : Model -> Html Msg
page model =
    case model.route of
        AppRouter.ListRoute ->
            DemosList.view model

        AppRouter.CreateRoute ->
            DemosAdd.view model

        AppRouter.NotFoundRoute ->
            DemosList.view model
