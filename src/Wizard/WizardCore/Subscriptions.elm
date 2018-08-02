module WizardCore.Subscriptions exposing (..)

import WizardShared.Types exposing (Model, Msg(..))
import WizardPorts.Ports exposing (displayWizard)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ displayWizard DisplayWizard
    ]
