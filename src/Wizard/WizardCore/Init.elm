module WizardCore.Init exposing (..)


import WizardShared.Types exposing (Msg, Model)


init : ( Model, Cmd Msg )
init =
  ( Model "Wizard" False, Cmd.none )
