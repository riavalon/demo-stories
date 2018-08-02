module Core.Update exposing (..)

import Navigation
import Shared.Types exposing (..)
import Core.Routing exposing (parseLocation)
import Communication.ChromeStorage exposing (save, removeDemo)
import Communication.DemoBuilder exposing (startDemoBuilder)


andThen : Msg -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
andThen msg ( model, cmd ) =
    let
        ( newModel, newCmd ) =
            update msg model
    in
        newModel ! [ cmd, newCmd ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )

        StartDemoBuilder ->
            ( model, ( startDemoBuilder "start_demo" ) )

        CreateNewDemo ->
            ( Model
                model.pageTitle
                (model.addForm :: model.demos)
                model.route
                (SprintDemo "" "")
            , Navigation.newUrl "/"
            )

        HandleSave ->
            update CreateNewDemo model
                |> andThen SaveDemoList

        RemoveDemo index ->
            let
                editObject =
                    { demos = model.demos, index = index }
            in
                ( model, removeDemo editObject )

        SaveDemoList ->
            ( model, save model.demos )

        LoadDemos demos ->
            ( { model | demos = demos }, Cmd.none )

        OnUpdateField fieldType value ->
            setModelForFieldType model fieldType value

        NoOp ->
            ( model, Cmd.none )



-- TODO: Make below this use a better utility setter function


setModelForFieldType : Model -> FieldType -> String -> ( Model, Cmd Msg )
setModelForFieldType model fieldType value =
    case fieldType of
        SprintField ->
            let
                oldAddForm =
                    model.addForm

                newAddForm =
                    { oldAddForm | sprint = value }
            in
                ( { model | addForm = newAddForm }, Cmd.none )

        DateField ->
            let
                oldAddForm =
                    model.addForm

                newAddForm =
                    { oldAddForm | date = value }
            in
                ( { model | addForm = newAddForm }, Cmd.none )
