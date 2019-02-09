module Pages.Example.Main exposing (init, subscriptions)

import Pages.Example.Model exposing (Model, initialModel)
import Pages.Example.Update exposing (Msg)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
