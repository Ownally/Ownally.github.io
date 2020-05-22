module Window exposing
    ( Window
    , classifyDevice
    , height
    , init
    , onResize
    )

import Browser.Events
import Element exposing (Attribute, Device)


type Window
    = Window Dimension


type alias Dimension =
    { width : Int
    , height : Int
    }


type alias Flag flag =
    { flag
        | width : Int
        , height : Int
    }


type alias Model model =
    { model | window : Window }


init : (Window -> ( Model model, Cmd msg )) -> Flag flag -> ( Model model, Cmd msg )
init model flag =
    model <| Window <| Dimension flag.width flag.height


classifyDevice : Window -> Device
classifyDevice (Window dimension) =
    Element.classifyDevice dimension


onResize : (Window -> msg) -> Sub msg
onResize msg =
    let
        toMsg : Int -> Int -> msg
        toMsg width currentHeight =
            msg <| Window <| Dimension width currentHeight
    in
    Browser.Events.onResize toMsg


height : Window -> Attribute msg
height (Window window) =
    Element.height <| Element.px window.height
