module WizardCore.Update exposing (..)

import WizardShared.Types exposing (Msg(..), Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of

    DisplayWizard shouldDisplay ->
      ( Model
          model.name
          shouldDisplay
      , Cmd.none
      )
