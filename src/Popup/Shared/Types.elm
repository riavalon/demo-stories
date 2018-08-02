module Shared.Types exposing (..)

import Navigation
import Core.Routing exposing (Route)


type Msg
    = CreateNewDemo
    | OnUpdateField FieldType String
    | OnLocationChange Navigation.Location
    | HandleSave
    | SaveDemoList
    | StartDemoBuilder
    | LoadDemos (List SprintDemo)
    | RemoveDemo Int
    | NoOp


type FieldType
    = SprintField
    | DateField


type alias RemoveSprintDemo =
    { demos : List SprintDemo
    , index : Int
    }


type alias Model =
    { pageTitle : String
    , demos : List SprintDemo
    , route : Route
    , addForm : SprintDemo
    }


type alias SprintDemo =
    { sprint : String
    , date : String
    }
