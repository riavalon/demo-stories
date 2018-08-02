module Controls.BuildStep exposing (..)

import Html exposing (Html, text, div, button, h3)
import Html.Events exposing (onClick)
import Html.Attributes exposing (id, class)

import WizardShared.Types exposing (Msg, Model)


buildStep : Model -> Html Msg
buildStep model =
  div [ id "dtb-wizard-build-step-container" ]
    [ h3 [ class "dtb-wizard-heading" ] [ text "Build Step Controls" ]
    , div [ id "dtb-wizard-build-step-controls" ]
        [ button [ class "dtb-wizard-event-button" ] [ text "Highlight" ]
        , button [ class "dtb-wizard-event-button" ] [ text "Click" ]
        , button [ class "dtb-wizard-event-button" ] [ text "Display HTML" ]
        , button [ class "dtb-wizard-event-button" ] [ text "Refresh Page" ]
        , button [ class "dtb-wizard-event-button" ] [ text "Send Values To..." ]
        , button [ class "dtb-wizard-event-button" ] [ text "Show DevTools..." ]
        ]
    ]
