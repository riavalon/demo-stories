module WizardShared.Types exposing (..)


type Msg
  = DisplayWizard Bool


type alias Model =
  { name : String
  , shouldDisplay : Bool
  }
