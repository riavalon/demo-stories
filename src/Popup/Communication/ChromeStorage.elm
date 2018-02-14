port module Communication.ChromeStorage exposing (..)

import Shared.Types exposing (..)


port removeDemo : RemoveSprintDemo -> Cmd msg


port save : List SprintDemo -> Cmd msg


port load : (List SprintDemo -> msg) -> Sub msg
