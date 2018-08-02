module WizardMain exposing (..)

import Html

-- src

import WizardCore.Init exposing (init)
import WizardCore.Update exposing (update)
import WizardCore.Subscriptions exposing (subscriptions)
import WizardCore.View exposing (view)


main = Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }
