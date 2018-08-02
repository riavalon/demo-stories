module WizardCore.View exposing (..)

import Html exposing (Html, div, span, h1, text)
import Html.Attributes exposing (id, style)

import Controls.Steps exposing (steps)
import Controls.BuildStep exposing (buildStep)
import WizardShared.Types exposing (Msg, Model)


view : Model -> Html Msg
view model =
  let
      styleList =
        if model.shouldDisplay then
          [("display", "block")]
        else
          [("display", "none")]
  in
    div [ id "dtb-wizard-container", style styleList ]
      [ buildStep model
      , steps model
      ]
