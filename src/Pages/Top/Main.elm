module Pages.Top.Main exposing (init, subscriptions)

import Pages.Top.Model exposing (Model, initialModel)
import Pages.Top.Update exposing (Msg)


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
