module Main exposing (main)

import Browser exposing (application)
import Browser.Navigation exposing (Key)
import Flags exposing (decodeFlags)
import Html exposing (text)
import Model exposing (Model, initialModel)
import Pages.Example.Main as ExamplePage
import Pages.Top.Main as TopPage
import Tuple exposing (first, second)
import Update exposing (Msg(..), update)
import Url exposing (Url)
import View exposing (view)


main : Program String Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = \url -> updateUrl url |> UrlChanged
        }


init : String -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        initialUrl =
            updateUrl url

        pages =
            { example = first ExamplePage.init
            , top = first TopPage.init
            }
    in
    ( initialModel (decodeFlags flags) key pages initialUrl
    , Cmd.batch
        [ Cmd.map TopPageMsg (second TopPage.init)
        , Cmd.map ExamplePageMsg (second ExamplePage.init)
        ]
    )



-- Routing


updateUrl : Url -> Url
updateUrl url =
    pathFromFragment url
        |> fixPathAndQuery


pathFromFragment : Url -> Url
pathFromFragment url =
    { url
        | path = Maybe.withDefault "/" url.fragment
        , fragment = Nothing
    }


fixPathAndQuery : Url -> Url
fixPathAndQuery url =
    let
        ( path, query ) =
            case String.split "?" url.path of
                p :: q :: [] ->
                    ( p, Just q )

                _ ->
                    ( url.path, url.query )
    in
    { url
        | path = path
        , query = query
    }
