module Update exposing (Msg(NoOp), update)

import Model exposing (Model)


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    model ! []
