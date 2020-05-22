module Page.Home exposing
    ( viewBigDesktopLandscape
    , viewBigDesktopPortrait
    , viewDesktopLandscape
    , viewDesktopPortrait
    , viewPhoneLandscape
    , viewPhonePortrait
    , viewTabletLandscape
    , viewTabletPortrait
    )

import Element exposing (Attribute, Color, Element)
import Element.Background as Background
import Element.Font as Font
import GoogleMap
import Image exposing (Image)
import Window exposing (Window)



-- VIEW


viewPhonePortrait : Window -> Element msg
viewPhonePortrait =
    view


viewTabletPortrait : Window -> Element msg
viewTabletPortrait =
    view


viewDesktopPortrait : Window -> Element msg
viewDesktopPortrait =
    view


viewBigDesktopPortrait : Window -> Element msg
viewBigDesktopPortrait =
    view


viewPhoneLandscape : Window -> Element msg
viewPhoneLandscape =
    view


viewTabletLandscape : Window -> Element msg
viewTabletLandscape =
    view


viewDesktopLandscape : Window -> Element msg
viewDesktopLandscape =
    view


viewBigDesktopLandscape : Window -> Element msg
viewBigDesktopLandscape =
    view


view : Window -> Element msg
view window =
    Element.column
        [ Element.width Element.fill ]
        [ viewLanding window
        , viewHow
        , viewBenefit
        , viewContact
        , viewFooter
        ]



-- LANDING


viewLanding : Window -> Element msg
viewLanding window =
    Element.column
        [ Element.width Element.fill
        , Window.toAttribute window
        , Element.paddingXY 144 72
        , Element.spacing 36
        , Image.toBackground Image.house
        , Element.behindContent viewFadeWhite
        ]
        [ viewHeadline
        , viewSubHeadline
        ]


viewFadeWhite : Element msg
viewFadeWhite =
    Element.el attributeFadeWhite Element.none


attributeFadeWhite : List (Attribute msg)
attributeFadeWhite =
    [ Element.width Element.fill
    , Element.height Element.fill
    , Background.gradient
        { angle = pi / 2
        , steps = [ white, transparent ]
        }
    ]



-- HEADLINE


viewHeadline : Element msg
viewHeadline =
    Element.paragraph attributeHeadline
        [ Element.text "Own your home at your terms" ]


attributeHeadline : List (Attribute msg)
attributeHeadline =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Element.centerY
          ]
        , [ Font.color lightBlack
          , Font.size 72
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- SUBHEADLINE


viewSubHeadline : Element msg
viewSubHeadline =
    Element.paragraph attributeSubHeadline
        [ Element.text "Lower monthly payments + No loans and interest" ]


attributeSubHeadline : List (Attribute msg)
attributeSubHeadline =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Element.centerY
          ]
        , [ Font.color lightBlack
          , Font.size 36
          , Font.alignLeft
          ]
        ]



-- HOW


viewHow : Element msg
viewHow =
    Element.row attributeHow
        [ viewEquity
        , viewRental
        , viewTrade
        ]


attributeHow : List (Attribute msg)
attributeHow =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Background.color white ]
        ]


viewEquity : Element msg
viewEquity =
    viewBox Image.pieChart "Sell fractional equities of your property to Ownally and investors, so you have the funds to purchase your property without loans."


viewRental : Element msg
viewRental =
    viewBox Image.rentalContract "Only pay fractional rent for the proportional equities you don't own. More equities you own, lesser the rent."


viewTrade : Element msg
viewTrade =
    viewBox Image.tradeGrowth "Freely trade equities with Ownally and investors anytime you want. Slowly build your wealth without debt."


viewBox : Image -> String -> Element msg
viewBox image string =
    Element.column attributeBox
        [ viewImageIcon image
        , viewStep string
        ]


attributeBox : List (Attribute msg)
attributeBox =
    List.concat
        [ fillWidth
        , [ Element.padding 48
          , Element.spacing 48
          , Element.alignTop
          ]
        ]


viewImageIcon : Image -> Element msg
viewImageIcon =
    Image.toElement attributeImageIcon


attributeImageIcon : List (Attribute msg)
attributeImageIcon =
    [ Element.width <| Element.px 150
    , Element.height <| Element.px 150
    , Element.centerX
    ]


viewStep : String -> Element msg
viewStep string =
    Element.paragraph attributeStep
        [ Element.text string ]


attributeStep : List (Attribute msg)
attributeStep =
    List.concat
        [ fillWidth
        , [ Font.color lightBlack
          , Font.size 24
          , Font.justify
          ]
        ]



-- BENEFIT


viewBenefit : Element msg
viewBenefit =
    Element.column attributeBenefit
        [ viewLesser
        , viewInvest
        , viewBigData
        , viewEmergency
        ]


attributeBenefit : List (Attribute msg)
attributeBenefit =
    fillWidth


viewLesser : Element msg
viewLesser =
    viewWithPic Image.buildings "Customizable monthly payments for you"


viewInvest : Element msg
viewInvest =
    viewBlack "Own your property"


viewBigData : Element msg
viewBigData =
    viewWithPic Image.technology "Determination of prices using Big Data and AI"


viewEmergency : Element msg
viewEmergency =
    viewBlack "Seamless conversion of equity to cash in times of need"


viewWithPic : Image -> String -> Element msg
viewWithPic image string =
    Element.paragraph (attributeWithPic image)
        [ Element.text string ]


attributeWithPic : Image -> List (Attribute msg)
attributeWithPic image =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Image.toBackground image
          , Element.behindContent viewFadeBlack
          , Font.color white
          , Font.size 48
          , Font.alignRight
          , Font.bold
          ]
        ]


viewFadeBlack : Element msg
viewFadeBlack =
    Element.el attributeFadeBlack Element.none


attributeFadeBlack : List (Attribute msg)
attributeFadeBlack =
    List.concat
        [ fillWindow
        , [ Background.gradient
                { angle = pi / 2
                , steps = [ transparent, lightBlack ]
                }
          ]
        ]


viewBlack : String -> Element msg
viewBlack string =
    Element.paragraph attributeBlack
        [ Element.text string ]


attributeBlack : List (Attribute msg)
attributeBlack =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Background.color lightBlack
          , Font.color white
          , Font.size 48
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- CONTACT


viewContact : Element msg
viewContact =
    Element.column
        [ Element.width Element.fill
        , Element.paddingXY 144 72
        , Element.spacing 36
        ]
        [ viewContactUs
        , viewContactDetails
        ]


viewContactUs : Element msg
viewContactUs =
    Element.el
        [ Font.color lightBlack
        , Font.size 36
        , Font.heavy
        ]
        (Element.text "Contact Us")


viewContactDetails : Element msg
viewContactDetails =
    Element.row
        [ Element.width Element.fill
        , Element.spacing 36
        ]
        [ viewSingaporeMap
        , viewAddresses
        , viewPhilippines
        ]


viewSingaporeMap : Element msg
viewSingaporeMap =
    GoogleMap.toElement GoogleMap.singapore 600 450 []


viewPhilippines : Element msg
viewPhilippines =
    GoogleMap.toElement GoogleMap.philippines 600 450 []


viewAddresses : Element msg
viewAddresses =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.fill
        ]
        [ viewSingaporeDetails
        , viewPhilippinesDetails
        ]



-- DETAILS


viewSingaporeDetails : Element msg
viewSingaporeDetails =
    viewDetails Top
        [ viewSingaporeAddress
        , viewEmailLeft
        ]


viewPhilippinesDetails : Element msg
viewPhilippinesDetails =
    viewDetails Bottom
        [ viewPhillippineAddress
        , viewEmailRight
        , viewPhone
        ]


viewDetails : VerticalAlignment -> List (Element msg) -> Element msg
viewDetails alignment =
    Element.column
        [ Element.width Element.fill
        , Element.spacing 12
        , fromVerticalAlignmentToAttribute alignment
        ]



-- ADDRESS


viewSingaporeAddress : Element msg
viewSingaporeAddress =
    viewAddress
        { alignment = Left
        , fontAlignment = AlignLeft
        , address = "07-07, TripleOne Somerset, 111 Somerset Road, Singapore 238164"
        }


viewPhillippineAddress : Element msg
viewPhillippineAddress =
    viewAddress
        { alignment = Right
        , fontAlignment = AlignRight
        , address = "Penthouse 1, One Corporate Center, Dona Julia Vargas Ave cor Meralco Ave, Ortigas Center, Pasig, Philippines 1605"
        }


viewAddress : { alignment : HorizontalAlignment, fontAlignment : FontAlignment, address : String } -> Element msg
viewAddress details =
    Element.paragraph
        [ fromHorizontalAlignmentToAttribute details.alignment
        , Font.color lightBlack
        , Font.size 24
        , fromFontAlignmentToAttribute details.fontAlignment
        , Font.bold
        ]
        [ Element.text details.address ]



-- EMAIL


viewEmailLeft : Element msg
viewEmailLeft =
    viewEmail Left


viewEmailRight : Element msg
viewEmailRight =
    viewEmail Right


viewEmail : HorizontalAlignment -> Element msg
viewEmail alignment =
    Element.el
        [ fromHorizontalAlignmentToAttribute alignment
        , Font.color blue
        , Font.size 24
        , Font.underline
        ]
        (Element.text "hello@ownally.com")


viewPhone : Element msg
viewPhone =
    Element.el
        [ Element.alignRight
        , Font.color lightBlack
        , Font.size 24
        ]
        (Element.text "+632 8285 9735")



-- VERTICAL ALIGNMENT


type VerticalAlignment
    = Top
    | Bottom


fromVerticalAlignmentToAttribute : VerticalAlignment -> Attribute msg
fromVerticalAlignmentToAttribute verticalAlignment =
    case verticalAlignment of
        Top ->
            Element.alignTop

        Bottom ->
            Element.alignBottom



-- HORIZONTAL ALIGNMENT


type HorizontalAlignment
    = Left
    | Right


fromHorizontalAlignmentToAttribute : HorizontalAlignment -> Attribute msg
fromHorizontalAlignmentToAttribute horizontalAlignment =
    case horizontalAlignment of
        Left ->
            Element.alignLeft

        Right ->
            Element.alignRight



-- FONT ALIGNMENT


type FontAlignment
    = AlignLeft
    | AlignRight


fromFontAlignmentToAttribute : FontAlignment -> Attribute msg
fromFontAlignmentToAttribute fontAlignment =
    case fontAlignment of
        AlignLeft ->
            Font.alignLeft

        AlignRight ->
            Font.alignRight



-- FOOTER


viewFooterPhonePortrait : Element msg
viewFooterPhonePortrait =
    viewFooter


viewFooterTabletPortrait : Element msg
viewFooterTabletPortrait =
    viewFooter


viewFooterDesktopPortrait : Element msg
viewFooterDesktopPortrait =
    viewFooter


viewFooterBigDesktopPortrait : Element msg
viewFooterBigDesktopPortrait =
    viewFooter


viewFooterPhoneLandscape : Element msg
viewFooterPhoneLandscape =
    viewFooter


viewFooterTabletLandscape : Element msg
viewFooterTabletLandscape =
    viewFooter


viewFooterDesktopLandscape : Element msg
viewFooterDesktopLandscape =
    viewFooter


viewFooterBigDesktopLandscape : Element msg
viewFooterBigDesktopLandscape =
    viewFooter


viewFooter : Element msg
viewFooter =
    Element.el attributeFooter <| Element.text "Ownally Footer"


attributeFooter : List (Attribute msg)
attributeFooter =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 144 48 ]
        , [ Background.color lightBlack ]
        , [ Font.color white
          , Font.size 36
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- SIZE


fillWindow : List (Attribute msg)
fillWindow =
    [ Element.width Element.fill
    , Element.height Element.fill
    ]


fillWidth : List (Attribute msg)
fillWidth =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


shrinkContent : List (Attribute msg)
shrinkContent =
    [ Element.width Element.shrink
    , Element.height Element.shrink
    ]



-- PADDING AND SPACING


bodyPadding : List (Attribute msg)
bodyPadding =
    [ Element.paddingXY 144 72
    , Element.spacing 36
    ]



-- COLOR


white : Color
white =
    Element.fromRgb255
        { red = 255
        , green = 255
        , blue = 255
        , alpha = 1
        }


lightBlack : Color
lightBlack =
    Element.fromRgb255
        { red = 32
        , green = 32
        , blue = 32
        , alpha = 1
        }


transparent : Color
transparent =
    Element.fromRgb255
        { red = 255
        , green = 255
        , blue = 255
        , alpha = 0
        }


blue : Color
blue =
    Element.fromRgb255
        { red = 0
        , green = 0
        , blue = 255
        , alpha = 1
        }
