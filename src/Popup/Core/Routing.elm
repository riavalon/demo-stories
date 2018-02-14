module Core.Routing exposing (..)

import Navigation
import UrlParser exposing (..)


type Route
    = ListRoute
    | CreateRoute
    | NotFoundRoute


matchers : UrlParser.Parser (Route -> a) a
matchers =
    UrlParser.oneOf
        [ UrlParser.map ListRoute UrlParser.top
        , UrlParser.map CreateRoute (s "create")
        ]


parseLocation : Navigation.Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute


createDemoPath : String
createDemoPath =
    "#create"


indexPath : String
indexPath =
    ""
