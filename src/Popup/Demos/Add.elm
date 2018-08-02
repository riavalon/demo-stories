module Demos.Add exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Shared.Types exposing (..)
import Shared.Views exposing (alink)
import Core.Routing as Routing
import Header.Add as AddDemoHeader


type alias FieldLabel =
    String


type alias FieldValue =
    String


type alias FieldPlaceholder =
    String


view : Model -> Html Msg
view model =
    div [ class "overflow-hidden vh-100 flex bg-black-05 flex-column items-stretch" ]
        [ AddDemoHeader.view model.pageTitle
        , demoCreateForm model
        ]


demoCreateForm : Model -> Html Msg
demoCreateForm model =
    div [ class "flex flex-column w-90 tl center" ]
        [ formGroup model.addForm.sprint "Sprint Number" "Sprint 6 ..." SprintField
        , formGroup model.addForm.date "Date" "2018-02-25 ..." DateField
        , formSubmit HandleSave
        ]


formGroup : FieldValue -> FieldLabel -> FieldPlaceholder -> FieldType -> Html Msg
formGroup fieldVal fieldLabel fieldPlaceholder fieldType =
    div [ class "mb3" ]
        [ label [ class "f4 mv3 bold db" ] [ text fieldLabel ]
        , input
            [ type_ "text"
            , value fieldVal
            , placeholder fieldPlaceholder
            , onInput (OnUpdateField fieldType)
            , class "h3 ph2 w-100 ba b--gray"
            ]
            []
        ]


formSubmit : Msg -> Html Msg
formSubmit clickMsg =
    div [ class "self-center mt3" ]
        [ button [ class "ttu bn bg-green white bold ph4 pv3 mh3", clickMsg |> onClick ] [ text "Submit" ]
        , alink "cancel" (Just "ttu no-underline bold bg-gray white ph4 pv3 bn") Routing.indexPath
        ]
