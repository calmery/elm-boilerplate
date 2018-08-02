module Flags exposing (decodeFlags)

import Json.Decode exposing (Decoder, decodeString, string)
import Json.Decode.Pipeline exposing (required, decode)
import Model exposing (Flags)


decodeFlags : String -> Result String Flags
decodeFlags value =
    decodeString flagsDecoder value


flagsDecoder : Decoder Flags
flagsDecoder =
    decode Flags
        |> required "message" string
