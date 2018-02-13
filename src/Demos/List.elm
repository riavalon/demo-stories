module Demos.List exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Shared.Types exposing (Msg)
import Shared.Views exposing (btn)


-- import Html.Events exposing (..)


demoList : Html Msg
demoList =
    ul [ class "list pa0 ma0 bg-white-80 flex-grow-1" ]
        (List.indexedMap
            (\index name -> demoListItem name index)
            [ "Demo 2018-02-16"
            , "Demo 2018-02-23"
            , "Demo 2018-03-02"
            , "Demo 2018-03-09"
            ]
        )


demoListItem : String -> Int -> Html Msg
demoListItem demoName index =
    let
        evenOddClass =
            if index % 2 == 0 then
                "bg-black-10"
            else
                "bg-black-20"
    in
        li [ class ("pa2 bb b--light-gray flex items-center justify-between " ++ evenOddClass) ]
            [ span [ class "bold" ] [ text demoName ]
            , div []
                [ btn "Edit" Nothing
                , btn "Delete" Nothing
                , btn "Launch" Nothing
                ]
            ]
