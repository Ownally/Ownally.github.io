module Main exposing (main)

-- IMPORT

import Browser
import Browser.Events
import Element exposing (Attribute, Color, Device, Element)
import Element.Background as Background
import Element.Font as Font exposing (Font)
import Html exposing (Html)
import Image exposing (Image)



-- MAIN


main : Program Window Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { window : Window
    , device : Device
    }



-- INIT


type alias Window =
    { width : Int
    , height : Int
    }


init : Window -> ( Model, Cmd Msg )
init window =
    ( Model window <| Element.classifyDevice window, Cmd.none )



-- MSG


type Msg
    = ChangeWindow Int Int



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        ChangeWindow width height ->
            let
                window : Window
                window =
                    Window width height
            in
            ( Model window <| Element.classifyDevice window, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onResize ChangeWindow



-- VIEW


view : Model -> Html Msg
view { window, device } =
    case ( device.class, device.orientation ) of
        ( Element.Phone, Element.Portrait ) ->
            viewLayout window

        ( Element.Tablet, Element.Portrait ) ->
            viewLayout window

        ( Element.Desktop, Element.Portrait ) ->
            viewLayout window

        ( Element.BigDesktop, Element.Portrait ) ->
            viewLayout window

        ( Element.Phone, Element.Landscape ) ->
            viewLayout window

        ( Element.Tablet, Element.Landscape ) ->
            viewLayout window

        ( Element.Desktop, Element.Landscape ) ->
            viewLayout window

        ( Element.BigDesktop, Element.Landscape ) ->
            viewLayout window


viewLayout : Window -> Html Msg
viewLayout window =
    Element.layout attributeLayout <| viewBody window


attributeLayout : List (Attribute Msg)
attributeLayout =
    List.concat
        [ fillWindow
        , [ Element.inFront viewHeader ]
        ]



-- HEADER


viewHeader : Element Msg
viewHeader =
    Element.el attributeHeader <| Element.text "Ownally"


attributeHeader : List (Attribute Msg)
attributeHeader =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 144 18 ]
        , [ Background.color lightBlack ]
        , [ Font.color white
          , Font.size 36
          , Font.family rubik
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- BODY


viewBody : Window -> Element Msg
viewBody window =
    Element.column attributeBody
        [ viewLanding window
        , viewHow
        , viewBenefit
        ]


attributeBody : List (Attribute Msg)
attributeBody =
    fillWidth



-- LANDING


viewLanding : Window -> Element Msg
viewLanding window =
    Element.column (attributeLanding window)
        [ viewHeadline
        , viewSubHeadline
        ]


attributeLanding : Window -> List (Attribute Msg)
attributeLanding { width, height } =
    [ Element.width Element.fill
    , Element.height <| Element.px height
    , Element.paddingXY 144 72
    , Element.spacing 36
    , Image.toBackground Image.house
    , Element.behindContent viewFadeWhite
    ]


viewFadeWhite : Element Msg
viewFadeWhite =
    Element.el attributeFadeWhite Element.none


attributeFadeWhite : List (Attribute Msg)
attributeFadeWhite =
    List.concat
        [ fillWindow
        , [ Background.gradient
                { angle = pi / 2
                , steps = [ white, transparent ]
                }
          ]
        ]



-- HEADLINE


viewHeadline : Element Msg
viewHeadline =
    Element.paragraph attributeHeadline
        [ Element.text "Own your home at your terms" ]


attributeHeadline : List (Attribute Msg)
attributeHeadline =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Element.centerY
          ]
        , [ Font.color lightBlack
          , Font.size 72
          , Font.family rubik
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- SUBHEADLINE


viewSubHeadline : Element Msg
viewSubHeadline =
    Element.paragraph attributeSubHeadline
        [ Element.text "Lower monthly payments + No loans and interest + Trade for cash anytime" ]


attributeSubHeadline : List (Attribute Msg)
attributeSubHeadline =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Element.centerY
          ]
        , [ Font.color lightBlack
          , Font.size 36
          , Font.family rubik
          , Font.alignLeft
          ]
        ]



-- HOW


viewHow : Element Msg
viewHow =
    Element.row attributeHow
        [ viewEquity
        , viewRental
        , viewTrade
        ]


attributeHow : List (Attribute Msg)
attributeHow =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Background.color white ]
        ]


viewEquity : Element Msg
viewEquity =
    viewBox Image.pieChart "Sell fractional equities of your property to Ownally and investors, so you have the funds to purchase your property without loans."


viewRental : Element Msg
viewRental =
    viewBox Image.rentalContract "Only pay fractional rent for the proportional equities you don't own. More equities you own, lesser the rent."


viewTrade : Element Msg
viewTrade =
    viewBox Image.tradeGrowth "Freely trade equities with Ownally and investors anytime you want. Slowly build your wealth without debt."


viewBox : Image -> String -> Element Msg
viewBox image string =
    Element.column attributeBox
        [ viewImageIcon image
        , viewStep string
        ]


attributeBox : List (Attribute Msg)
attributeBox =
    List.concat
        [ fillWidth
        , [ Element.padding 48
          , Element.spacing 48
          ]
        ]


viewImageIcon : Image -> Element Msg
viewImageIcon =
    Image.toElement attributeImageIcon


attributeImageIcon : List (Attribute Msg)
attributeImageIcon =
    [ Element.width <| Element.px 150
    , Element.height <| Element.px 150
    , Element.centerX
    ]


viewStep : String -> Element Msg
viewStep string =
    Element.paragraph attributeStep
        [ Element.text string ]


attributeStep : List (Attribute Msg)
attributeStep =
    List.concat
        [ fillWidth
        , [ Font.color lightBlack
          , Font.size 24
          , Font.family rubik
          , Font.justify
          ]
        ]



-- BENEFIT


viewBenefit : Element Msg
viewBenefit =
    Element.column attributeBenefit
        [ viewLesser
        , viewInvest
        , viewBigData
        , viewEmergency
        ]


attributeBenefit : List (Attribute Msg)
attributeBenefit =
    fillWidth


viewLesser : Element Msg
viewLesser =
    Element.paragraph attributeLesser
        [ Element.text "Lower your monthly payments to fit you" ]


attributeLesser : List (Attribute Msg)
attributeLesser =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Image.toBackground Image.buildings
          , Element.behindContent viewFadeBlack
          , Font.color white
          , Font.size 48
          , Font.family rubik
          , Font.alignRight
          , Font.bold
          ]
        ]


viewFadeBlack : Element Msg
viewFadeBlack =
    Element.el attributeFadeBlack Element.none


attributeFadeBlack : List (Attribute Msg)
attributeFadeBlack =
    List.concat
        [ fillWindow
        , [ Background.gradient
                { angle = pi / 2
                , steps = [ transparent, lightBlack ]
                }
          ]
        ]


viewInvest : Element Msg
viewInvest =
    Element.paragraph attributeInvest
        [ Element.text "Sharing the appreciation and depreciation of your property" ]


attributeInvest : List (Attribute Msg)
attributeInvest =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Background.color lightBlack
          , Font.color white
          , Font.size 48
          , Font.family rubik
          , Font.alignLeft
          , Font.bold
          ]
        ]


viewBigData : Element Msg
viewBigData =
    Element.paragraph attributeBigData
        [ Element.text "Using Big Data and AI to get the right price" ]


attributeBigData : List (Attribute Msg)
attributeBigData =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Image.toBackground Image.technology
          , Element.behindContent viewFadeBlack
          , Font.color white
          , Font.size 48
          , Font.family rubik
          , Font.alignRight
          , Font.bold
          ]
        ]


viewEmergency : Element Msg
viewEmergency =
    Element.paragraph attributeEmergency
        [ Element.text "Easily trade equities for cash in black swan emergencies" ]


attributeEmergency : List (Attribute Msg)
attributeEmergency =
    List.concat
        [ fillWidth
        , bodyPadding
        , [ Background.color lightBlack
          , Font.color white
          , Font.size 48
          , Font.family rubik
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- SIZE


fillWindow : List (Attribute Msg)
fillWindow =
    [ Element.width Element.fill
    , Element.height Element.fill
    ]


fillWidth : List (Attribute Msg)
fillWidth =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


shrinkContent : List (Attribute Msg)
shrinkContent =
    [ Element.width Element.shrink
    , Element.height Element.shrink
    ]



-- PADDING AND SPACING


bodyPadding : List (Attribute Msg)
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



-- FONT FAMILY


rubik : List Font
rubik =
    [ Font.typeface "Rubik"
    , Font.sansSerif
    ]
