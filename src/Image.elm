module Image exposing
    ( Image
    , page1
    , page2
    , page3
    , page4
    , page5
    , page6
    , page7
    , page8
    , page9
    , toElement
    )

import Element exposing (Attribute, Element)


type Image
    = Image { src : String, description : String }


toElement : List (Attribute msg) -> Image -> Element msg
toElement attributes (Image { src, description }) =
    Element.image attributes
        { src = src
        , description = description
        }


page1 : Image
page1 =
    createImage "Page1.png" "Page 1"


page2 : Image
page2 =
    createImage "Page2.png" "Page 2"


page3 : Image
page3 =
    createImage "Page3.png" "Page 3"


page4 : Image
page4 =
    createImage "Page4.png" "Page 4"


page5 : Image
page5 =
    createImage "Page5.png" "Page 5"


page6 : Image
page6 =
    createImage "Page6.png" "Page 6"

page7 : Image
page7 =
    createImage "Page7.png" "Page 7"

page8 : Image
page8 =
    createImage "Page8.png" "Page 8"

page9 : Image
page9 =
    createImage "Page9.png" "Page 9"

createImage : String -> String -> Image
createImage filename description =
    Image <| { src = "/image/" ++ filename, description = description }
