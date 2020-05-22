module GoogleMap exposing (philippines, singapore, toElement)

import Element exposing (Attribute, Element)
import Html
import Html.Attributes


type GoogleMap
    = GoogleMap String


singapore : GoogleMap
singapore =
    GoogleMap "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3988.7911120840604!2d103.83510651475393!3d1.3001684990517104!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31da1990e8a47437%3A0x8e44914bfeb4fe5f!2s111%20Somerset%20Rd%2C%20TripleOne%20Somerset%2C%20Singapore%20238164!5e0!3m2!1sen!2sph!4v1589982559385!5m2!1sen!2sph"


philippines : GoogleMap
philippines =
    GoogleMap "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3861.2614767809887!2d121.06105471548544!3d14.58417093981291!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3397c81146cc8027%3A0x8f5075cefa059dca!2sLOFT%20Coworking%20Philippines!5e0!3m2!1sen!2sph!4v1589987888763!5m2!1sen!2sph"


toElement : GoogleMap -> Int -> Int -> List (Attribute msg) -> Element msg
toElement (GoogleMap src) width height attributes =
    Html.iframe
        [ Html.Attributes.src src
        , Html.Attributes.width width
        , Html.Attributes.height height
        , Html.Attributes.style "border" "0"
        ]
        []
        |> Element.html
        |> Element.el attributes
