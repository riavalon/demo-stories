module Demos.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Header.Popup as PopupHeader
import Shared.Types exposing (Msg(..), Model, SprintDemo)
import Shared.Views exposing (btn)


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden vh-100 flex flex-column items-stretch" ]
        [ PopupHeader.view model.pageTitle
        , demoList model
        ]


demoList : Model -> Html Msg
demoList model =
    ul [ class "list pa0 ma0 bg-black-05 box-shadow-inset flex-grow-1" ]
        (List.indexedMap (\index name -> demoListItem name index) model.demos)


demoListItem : SprintDemo -> Int -> Html Msg
demoListItem demo index =
    let
        evenOddClass =
            if index % 2 == 0 then
                "bg-black-10"
            else
                "bg-black-20"
    in
        li [ class ("pl3 pointer f5 bb b--light-gray flex items-center justify-between " ++ evenOddClass) ]
            [ span [ class "ttu bold" ] [ text demo.sprint ]
            , span [ class "bold" ] [ text demo.date ]
            , div []
                [ btn "D" (Just "bn outline-0 hover-bg-light-red hover-dark-red bold bg-black-30 white pa3 ttu mr1") (Just (RemoveDemo index))
                , btn "L" (Just "bn outline-0 hover-bg-light-blue hover-dark-blue bold bg-black-30 white pa3 ttu ph3 mr1") (Just StartDemoBuilder)
                , btn "C" (Just "bn outline-0 hover-bg-light-green hover-dark-green bold bg-black-30 white pa3 ttu ph3") (Nothing)
                ]
            ]
