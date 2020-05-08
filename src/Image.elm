module Image exposing
    ( Image
    , building
    , house
    , toBackground
    , toElement
    , worldMap
    )

import Element exposing (Attribute, Element)
import Element.Background as Background


type Image
    = Image { src : String, description : String }


toElement : List (Attribute msg) -> Image -> Element msg
toElement attributes (Image { src, description }) =
    Element.image attributes
        { src = src
        , description = description
        }


toBackground : Image -> Attribute msg
toBackground (Image { src }) =
    Background.image src


house : Image
house =
    createImage "House.jpg" "Landing Photo"


building : Image
building =
    createImage "Building.jpg" "Market Photo"


worldMap : Image
worldMap =
    createImage "WorldMap.png" "World Map Mission Photo"


createImage : String -> String -> Image
createImage filename description =
    Image <| { src = "/image/" ++ filename, description = description }
