module Model exposing (Model, initialModel)

import Browser.Navigation exposing (Key)
import Data.EnvironmentVariables exposing (EnvironmentVariables)
import Pages.Example.Model as ExamplePage
import Pages.Top.Model as TopPage
import Url exposing (Url)


initialModel : EnvironmentVariables -> Key -> Pages -> Url -> Model
initialModel environmentVariables key pages url =
    { environmentVariables = environmentVariables
    , key = key
    , pages = pages
    , url = url
    }


type alias Model =
    { environmentVariables : EnvironmentVariables
    , key : Key
    , pages : Pages
    , url : Url
    }


type alias Pages =
    { example : ExamplePage.Model
    , top : TopPage.Model
    }
