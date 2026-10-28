module Main exposing (main)

import Element exposing (centerX, centerY, el, layout, text)
import Html exposing (Html)


main : Html msg
main =
    layout [] (el [ centerX, centerY ] (text "Hello, elm-ui!"))
