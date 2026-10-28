module Main exposing (main)

import Browser
import Element exposing (..)
import Element.Input as Input
import Html exposing (Html)


type alias Model =
    { count : Int
    , total : Int
    }


init : Model
init =
    { count = 0
    , total = 0
    }


type Msg
    = AddToCount
    | SubToCount


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddToCount ->
            { count = model.count + 1
            , total = model.total + 1
            }

        SubToCount ->
            { count = model.count - 1
            , total = model.total + 1
            }


view : Model -> Html Msg
view model =
    layout []
        (row
            [ alignTop
            , width fill
            , spaceEvenly
            ]
            [ el
                [ padding 20
                ]
                (text "Hello, elm-ui!")
            , Input.button
                []
                { onPress = Just AddToCount
                , label = text "Add 1"
                }
            , Input.button
                []
                { onPress = Just SubToCount
                , label = text "Sub 1"
                }
            , text ("Number: " ++ String.fromInt model.count)
            , text ("TBC: " ++ String.fromInt model.total)
            ]
        )


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
