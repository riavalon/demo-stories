module Controls.Steps exposing (..)

import Html exposing (Html, small, div, button, h3, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id, class)

import WizardShared.Types exposing (Model, Msg(..))


steps : Model -> Html Msg
steps model =
  div [ id "dtb-wizard-step-controls" ]
    [ h3 [ class "dtb-wizard-heading underline" ]
        [ text "Demo Steps Controls"
        , small [ class "dtb-wizard-inline-subhead" ] [ text "| Current Step (5/23)" ]
        ]
    , div [ class "dtb-wizard-step-buttons" ]
        [ button [ class "dtb-wizard-button" ] [ text "Previous" ]
        , button [ class "dtb-wizard-button" ] [ text "Next" ]
        ]
    ]
