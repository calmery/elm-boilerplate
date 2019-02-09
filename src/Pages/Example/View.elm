module Pages.Example.View exposing (view)

import Html exposing (Html, a, div, text)
import Html.Attributes exposing (href)
import Pages.Example.Model exposing (Model)
import Pages.Example.Update exposing (Msg)


view : Model -> Html Msg
view model =
    div []
        [ text "Example Page"
        , a [ href "/#/" ] [ text "Go to Top" ]
        ]
