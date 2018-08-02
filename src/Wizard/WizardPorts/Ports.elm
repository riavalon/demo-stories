port module WizardPorts.Ports exposing (..)

import WizardShared.Types exposing (Msg)


port displayWizard : (Bool -> msg) -> Sub msg
