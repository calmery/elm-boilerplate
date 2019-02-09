module View exposing (view)

import Browser exposing (Document)
import Html exposing (Html, div, text)
import Model exposing (Model)
import Pages.Example.View as ExamplePage
import Pages.Top.View as TopPage
import Update exposing (Msg(..))


view : Model -> Document Msg
view model =
    { title = "Elm App"
    , body =
        [ route model
        ]
    }


route : Model -> Html Msg
route model =
    let
        empty =
            text ""
    in
    case model.url.path of
        "/" ->
            Html.map TopPageMsg (TopPage.view model.pages.top)

        "/example" ->
            Html.map ExamplePageMsg (ExamplePage.view model.pages.example)

        _ ->
            empty
