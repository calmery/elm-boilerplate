module Update exposing (Msg(..), update)

import Browser exposing (UrlRequest(..))
import Browser.Navigation exposing (load, pushUrl)
import Model exposing (Model)
import Pages.Example.Update as ExamplePage
import Pages.Top.Update as TopPage
import Url exposing (Url)


type Msg
    = LinkClicked UrlRequest
    | UrlChanged Url
    | TopPageMsg TopPage.Msg
    | ExamplePageMsg ExamplePage.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model, pushUrl model.key (Url.toString url) )

                External href ->
                    ( model, load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )

        TopPageMsg topPageMsg ->
            let
                ( updatedModel, nextCmdMsg ) =
                    TopPage.update topPageMsg model.pages.top

                pages =
                    model.pages
            in
            ( { model
                | pages =
                    { pages | top = updatedModel }
              }
            , Cmd.map TopPageMsg nextCmdMsg
            )

        ExamplePageMsg examplePageMsg ->
            let
                ( updatedModel, nextCmdMsg ) =
                    ExamplePage.update examplePageMsg model.pages.example

                pages =
                    model.pages
            in
            ( { model
                | pages =
                    { pages | top = updatedModel }
              }
            , Cmd.map ExamplePageMsg nextCmdMsg
            )
