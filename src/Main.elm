module Main exposing (main)

import Browser
import Element exposing (Element)
import Html exposing (Html)
import Image exposing (Image)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    ()


type alias Msg =
    Never


init : Model
init =
    ()


update : Msg -> Model -> Model
update _ model =
    model


view : Model -> Html Msg
view _ =
    Element.layout
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]
    <|
        viewDocument


viewDocument : Element Msg
viewDocument =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]
        [ viewPage Image.page1
        , viewPage Image.page2
        , viewPage Image.page3
        , viewPage Image.page4
        , viewPage Image.page5
        , viewPage Image.page6
        , viewPage Image.page7
        , viewPage Image.page8
        , viewPage Image.page9
        ]


viewPage : Image -> Element Msg
viewPage =
    Image.toElement
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]
