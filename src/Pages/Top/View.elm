module Pages.Top.View exposing (view)

import Html exposing (Html, a, article, aside, div, footer, header, nav, node, section, text)
import Html.Attributes exposing (href)
import Pages.Top.Model exposing (Model)
import Pages.Top.Update exposing (Msg)


view : Model -> Html Msg
view model =
    -- https://dequeuniversity.com/rules/axe/2.2/bypass?application=lighthouse
    div []
        [ header [] [ div [] [ text "This is the header." ] ]
        , nav [] [ div [] [ text "This is the navigation." ] ]
        , node "main"
            []
            [ div []
                [ text "This is the main content."
                , a [ href "/#/example" ] [ text "Go to Example" ]
                ]
            , section [] [ div [] [ text "This is a section." ] ]
            , article [] [ div [] [ text "This is an article." ] ]
            , aside [] [ div [] [ text "This is an aside." ] ]
            ]
        , footer [] [ div [] [ text "This is the footer." ] ]
        ]
