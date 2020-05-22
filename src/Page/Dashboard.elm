module Page.Dashboard exposing
    ( Model
    , Msg
    , initialModel
    , update
    , viewBigDesktopLandscape
    , viewBigDesktopPortrait
    , viewDesktopLandscape
    , viewDesktopPortrait
    , viewPhoneLandscape
    , viewPhonePortrait
    , viewTabletLandscape
    , viewTabletPortrait
    )

import Chart
import Element exposing (Attribute, Color, Element)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input exposing (Label)
import Window exposing (Window)


type alias Model =
    { shares : Int
    , bidInput : Maybe Int
    , askInput : Maybe Int
    }


totalShares : Int
totalShares =
    100000


bid : Int
bid =
    1242


ask : Int
ask =
    1312


rent : Int
rent =
    2000000


rentIncome : Int
rentIncome =
    1500000


initialModel : Model
initialModel =
    { shares = 20000
    , bidInput = Nothing
    , askInput = Nothing
    }


type Msg
    = ChangeBidInput String
    | ChangeAskInput String
    | Bid
    | Ask


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeBidInput string ->
            case string of
                "" ->
                    ( { model | bidInput = Nothing }, Cmd.none )

                _ ->
                    let
                        maybeInteger : Maybe Int
                        maybeInteger =
                            String.toInt string
                    in
                    case maybeInteger of
                        Just integer ->
                            if integer > 0 then
                                ( { model | bidInput = Just integer }, Cmd.none )

                            else
                                ( model, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

        ChangeAskInput string ->
            case string of
                "" ->
                    ( { model | askInput = Nothing }, Cmd.none )

                _ ->
                    let
                        maybeInteger : Maybe Int
                        maybeInteger =
                            String.toInt string
                    in
                    case maybeInteger of
                        Just integer ->
                            if integer > 0 then
                                ( { model | askInput = Just integer }, Cmd.none )

                            else
                                ( model, Cmd.none )

                        Nothing ->
                            ( model, Cmd.none )

        Bid ->
            case model.bidInput of
                Just integer ->
                    if integer <= model.shares then
                        ( { model | shares = model.shares - integer, bidInput = Nothing }, Cmd.none )

                    else
                        ( model, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )

        Ask ->
            case model.askInput of
                Just integer ->
                    if integer + model.shares <= totalShares then
                        ( { model | shares = model.shares + integer, askInput = Nothing }, Cmd.none )

                    else
                        ( model, Cmd.none )

                Nothing ->
                    ( model, Cmd.none )


viewPhonePortrait : Window -> Model -> Element Msg
viewPhonePortrait =
    view


viewTabletPortrait : Window -> Model -> Element Msg
viewTabletPortrait =
    view


viewDesktopPortrait : Window -> Model -> Element Msg
viewDesktopPortrait =
    view


viewBigDesktopPortrait : Window -> Model -> Element Msg
viewBigDesktopPortrait =
    view


viewPhoneLandscape : Window -> Model -> Element Msg
viewPhoneLandscape =
    view


viewTabletLandscape : Window -> Model -> Element Msg
viewTabletLandscape =
    view


viewDesktopLandscape : Window -> Model -> Element Msg
viewDesktopLandscape =
    view


viewBigDesktopLandscape : Window -> Model -> Element Msg
viewBigDesktopLandscape =
    view


view : Window -> Model -> Element Msg
view window { shares, bidInput, askInput } =
    Element.column (attribute window)
        [ viewInformation shares
        , viewPie shares
        , viewMarket bidInput askInput
        ]


attribute : Window -> List (Attribute Msg)
attribute window =
    [ Element.width Element.fill
    , Window.toAttribute window
    , Element.paddingXY 144 144
    , Element.spacing 36
    , Background.color darkWhite
    ]


viewInformation : Int -> Element Msg
viewInformation shares =
    Element.row attributeInformation
        [ viewEquity shares
        , viewRent shares
        ]


attributeInformation : List (Attribute Msg)
attributeInformation =
    List.concat
        [ fillWidth
        , [ Element.spacing 36
          , Element.alignTop
          ]
        ]


viewEquity : Int -> Element Msg
viewEquity shares =
    Element.row attributeEquity
        [ viewShares shares
        , viewEquityNext shares
        ]


attributeEquity : List (Attribute Msg)
attributeEquity =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 36 36
          , Element.spacing 36
          , Background.color white
          ]
        ]


viewEquityNext : Int -> Element Msg
viewEquityNext shares =
    Element.column attritubeEquityNext
        [ viewTotalShares
        , viewPercentage shares
        ]


attritubeEquityNext : List (Attribute Msg)
attritubeEquityNext =
    List.concat
        [ fillWidth
        , [ Element.spacing 12
          , Background.color white
          , Element.centerY
          ]
        ]


viewShares : Int -> Element Msg
viewShares shares =
    Element.column attributeShares
        [ viewSharesTitle
        , viewSharesNumber shares
        ]


attributeShares : List (Attribute Msg)
attributeShares =
    [ Element.width <| Element.fillPortion 2
    , Element.height Element.shrink
    , Element.spacing 6
    , Element.centerY
    ]


viewSharesTitle : Element Msg
viewSharesTitle =
    Element.el attributeSharesTitle <| Element.text "Your equity shares"


attributeSharesTitle : List (Attribute Msg)
attributeSharesTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewSharesNumber : Int -> Element Msg
viewSharesNumber shares =
    Element.el attributeSharesNumber <| Element.text <| String.fromInt shares ++ " shares"


attributeSharesNumber : List (Attribute Msg)
attributeSharesNumber =
    [ Font.color lightBlack
    , Font.size 48
    , Font.alignLeft
    , Font.heavy
    ]


viewTotalShares : Element Msg
viewTotalShares =
    Element.column attributeTotalShares
        [ viewTotalSharesTitle
        , viewTotalSharesNumber
        ]


attributeTotalShares : List (Attribute Msg)
attributeTotalShares =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewTotalSharesTitle : Element Msg
viewTotalSharesTitle =
    Element.el attributeTotalSharesTitle <| Element.text "Total equity shares"


attributeTotalSharesTitle : List (Attribute Msg)
attributeTotalSharesTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewTotalSharesNumber : Element Msg
viewTotalSharesNumber =
    Element.el attributeTotalSharesNumber <| Element.text <| String.fromInt totalShares ++ " shares"


attributeTotalSharesNumber : List (Attribute Msg)
attributeTotalSharesNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewPercentage : Int -> Element Msg
viewPercentage shares =
    Element.column attributePercentage
        [ viewPercentageTitle
        , viewPercentageNumber shares
        ]


attributePercentage : List (Attribute Msg)
attributePercentage =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewPercentageTitle : Element Msg
viewPercentageTitle =
    Element.el attributePercentageTitle <| Element.text "You own"


attributePercentageTitle : List (Attribute Msg)
attributePercentageTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewPercentageNumber : Int -> Element Msg
viewPercentageNumber shares =
    Element.el attributePercentageNumber <| Element.text <| String.fromInt (shares * 100 // totalShares) ++ "% of all shares"


attributePercentageNumber : List (Attribute Msg)
attributePercentageNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewRent : Int -> Element Msg
viewRent shares =
    Element.row attributeRent
        [ viewPayment shares
        , viewRentNext shares
        ]


attributeRent : List (Attribute Msg)
attributeRent =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 36 36
          , Element.spacing 36
          , Background.color white
          ]
        ]


viewRentNext : Int -> Element Msg
viewRentNext shares =
    Element.column attributeRentNext
        [ viewMonthlyRent
        , viewRentalIncome shares
        ]


attributeRentNext : List (Attribute Msg)
attributeRentNext =
    List.concat
        [ fillWidth
        , [ Element.spacing 12
          , Background.color white
          , Element.centerY
          ]
        ]


viewPayment : Int -> Element Msg
viewPayment shares =
    Element.column attributePayment
        [ viewPaymentTitle
        , viewPaymentNumber shares
        ]


attributePayment : List (Attribute Msg)
attributePayment =
    [ Element.width <| Element.fillPortion 2
    , Element.height Element.shrink
    , Element.spacing 6
    , Element.centerY
    ]


viewPaymentTitle : Element Msg
viewPaymentTitle =
    Element.el attributePaymentTitle <| Element.text "Your monthly payment"


attributePaymentTitle : List (Attribute Msg)
attributePaymentTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewPaymentNumber : Int -> Element Msg
viewPaymentNumber shares =
    Element.el attributePaymentNumber <| Element.text <| toMoney <| rent - (rentIncome * shares // totalShares)


attributePaymentNumber : List (Attribute Msg)
attributePaymentNumber =
    [ Font.color lightBlack
    , Font.size 48
    , Font.alignLeft
    , Font.heavy
    ]


viewMonthlyRent : Element Msg
viewMonthlyRent =
    Element.column attributeMonthlyRent
        [ viewMonthlyRentTitle
        , viewMonthlyRentNumber
        ]


attributeMonthlyRent : List (Attribute Msg)
attributeMonthlyRent =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewMonthlyRentTitle : Element Msg
viewMonthlyRentTitle =
    Element.el attributeMonthlyRentTitle <| Element.text "Your monthly rent"


attributeMonthlyRentTitle : List (Attribute Msg)
attributeMonthlyRentTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewMonthlyRentNumber : Element Msg
viewMonthlyRentNumber =
    Element.el attributeMonthlyRentNumber <| Element.text <| toMoney rent


attributeMonthlyRentNumber : List (Attribute Msg)
attributeMonthlyRentNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewRentalIncome : Int -> Element Msg
viewRentalIncome shares =
    Element.column attributeRentalIncome
        [ viewRentalIncomeTitle
        , viewRentalIncomeNumber shares
        ]


attributeRentalIncome : List (Attribute Msg)
attributeRentalIncome =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewRentalIncomeTitle : Element Msg
viewRentalIncomeTitle =
    Element.el attributeRentalIncomeTitle <| Element.text "Your monthly rental income"


attributeRentalIncomeTitle : List (Attribute Msg)
attributeRentalIncomeTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewRentalIncomeNumber : Int -> Element Msg
viewRentalIncomeNumber shares =
    Element.el attributeRentalIncomeNumber <| Element.text <| toMoney <| rentIncome * shares // totalShares


attributeRentalIncomeNumber : List (Attribute Msg)
attributeRentalIncomeNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewPie : Int -> Element Msg
viewPie shares =
    Element.el attributePie <| viewPieChart shares


attributePie : List (Attribute Msg)
attributePie =
    List.concat
        [ fillWidth
        , [ Element.centerX
          , Element.centerY
          , Background.color white
          ]
        ]


viewPieChart : Int -> Element Msg
viewPieChart shares =
    Chart.pie
        [ ( toFloat shares / toFloat totalShares, "Your shares" )
        , ( toFloat (totalShares - shares) / toFloat totalShares, "Ownally" )
        ]
        |> Chart.dimensions 800 400
        |> Chart.colours [ "blue", "skyBlue" ]
        |> Chart.updateStyles "container" [ ( "background-color", "white" ) ]
        |> Chart.updateStyles "chart-container" [ ( "margin", "auto" ) ]
        |> Chart.toHtml
        |> Element.html


viewMarket : Maybe Int -> Maybe Int -> Element Msg
viewMarket bidInput askInput =
    Element.row attributeMarket
        [ viewBid bidInput
        , viewAsk askInput
        ]


attributeMarket : List (Attribute Msg)
attributeMarket =
    List.concat
        [ fillWidth
        , [ Element.spacing 36
          , Element.alignBottom
          ]
        ]


viewBid : Maybe Int -> Element Msg
viewBid bidInput =
    Element.row attributeBid
        [ viewSell
        , viewBidNext bidInput
        ]


attributeBid : List (Attribute Msg)
attributeBid =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 36 36
          , Element.spacing 36
          , Background.color white
          ]
        ]


viewBidNext : Maybe Int -> Element Msg
viewBidNext bidInput =
    Element.column attributeBidNext
        [ viewBidInput bidInput
        , viewBidTotal bidInput
        , viewBidButton
        ]


attributeBidNext : List (Attribute Msg)
attributeBidNext =
    List.concat
        [ fillWidth
        , [ Element.spacing 12
          , Background.color white
          , Element.centerY
          ]
        ]


viewSell : Element Msg
viewSell =
    Element.column attributeSell
        [ viewSellTitle
        , viewSellNumber
        , viewSellPer
        ]


attributeSell : List (Attribute Msg)
attributeSell =
    [ Element.width <| Element.fillPortion 2
    , Element.height Element.shrink
    , Element.centerY
    , Element.spacing 6
    ]


viewSellTitle : Element Msg
viewSellTitle =
    Element.el attributeSellTitle <| Element.text "Sell your equity at"


attributeSellTitle : List (Attribute Msg)
attributeSellTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewSellNumber : Element Msg
viewSellNumber =
    Element.el attributeSellNumber <| Element.text <| toMoney bid


attributeSellNumber : List (Attribute Msg)
attributeSellNumber =
    [ Font.color lightBlack
    , Font.size 48
    , Font.alignLeft
    , Font.heavy
    ]


viewSellPer : Element Msg
viewSellPer =
    Element.el attributeSellPer <| Element.text "per share"


attributeSellPer : List (Attribute Msg)
attributeSellPer =
    [ Font.color lightBlack
    , Font.size 24
    , Font.alignLeft
    , Font.heavy
    ]


viewBidInput : Maybe Int -> Element Msg
viewBidInput bidInput =
    Input.text attributeBidInput
        { onChange = ChangeBidInput
        , text = maybeText bidInput
        , placeholder = Nothing
        , label = viewBidInputTitle
        }


attributeBidInput : List (Attribute Msg)
attributeBidInput =
    List.concat
        [ fillWidth
        , [ Element.padding 6
          , Font.color lightBlack
          , Font.size 18
          , Font.alignLeft
          ]
        ]


viewBidInputTitle : Label Msg
viewBidInputTitle =
    Input.labelAbove attributeBidInputTitle <| Element.text "Number of shares"


attributeBidInputTitle : List (Attribute Msg)
attributeBidInputTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewBidTotal : Maybe Int -> Element Msg
viewBidTotal bidInput =
    Element.column attributeBidTotal
        [ viewBidTotalTitle
        , viewBidTotalNumber bidInput
        ]


attributeBidTotal : List (Attribute Msg)
attributeBidTotal =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewBidTotalTitle : Element Msg
viewBidTotalTitle =
    Element.el attributeBidTotalTitle <| Element.text "Total amount received"


attributeBidTotalTitle : List (Attribute Msg)
attributeBidTotalTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewBidTotalNumber : Maybe Int -> Element Msg
viewBidTotalNumber bidInput =
    case bidInput of
        Just input ->
            Element.el attributeBidTotalNumber <| Element.text <| toMoney <| input * bid

        Nothing ->
            Element.el attributeBidTotalNumber <| Element.text "0"


attributeBidTotalNumber : List (Attribute Msg)
attributeBidTotalNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewBidButton : Element Msg
viewBidButton =
    Input.button attributeBidButton
        { onPress = Just Bid
        , label = Element.text "Sell Equity"
        }


attributeBidButton : List (Attribute Msg)
attributeBidButton =
    List.concat
        [ shrinkContent
        , [ Element.padding 6
          , Background.color lightBlack
          , Font.color white
          , Font.size 18
          , Font.alignLeft
          , Font.bold
          ]
        ]


viewAsk : Maybe Int -> Element Msg
viewAsk askInput =
    Element.row attributeAsk
        [ viewBuy
        , viewAskNext askInput
        ]


attributeAsk : List (Attribute Msg)
attributeAsk =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 36 36
          , Element.spacing 36
          , Background.color white
          ]
        ]


viewAskNext : Maybe Int -> Element Msg
viewAskNext askInput =
    Element.column attributeAskNext
        [ viewAskInput askInput
        , viewAskTotal askInput
        , viewAskButton
        ]


attributeAskNext : List (Attribute Msg)
attributeAskNext =
    List.concat
        [ fillWidth
        , [ Element.spacing 12
          , Background.color white
          , Element.centerY
          ]
        ]


viewBuy : Element Msg
viewBuy =
    Element.column attributeBuy
        [ viewBuyTitle
        , viewBuyNumber
        , viewBuyPer
        ]


attributeBuy : List (Attribute Msg)
attributeBuy =
    [ Element.width <| Element.fillPortion 2
    , Element.height Element.shrink
    , Element.centerY
    , Element.spacing 6
    ]


viewBuyTitle : Element Msg
viewBuyTitle =
    Element.el attributeBuyTitle <| Element.text "Buy more equity at"


attributeBuyTitle : List (Attribute Msg)
attributeBuyTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewBuyNumber : Element Msg
viewBuyNumber =
    Element.el attributeBuyNumber <| Element.text <| toMoney ask


attributeBuyNumber : List (Attribute Msg)
attributeBuyNumber =
    [ Font.color lightBlack
    , Font.size 48
    , Font.alignLeft
    , Font.heavy
    ]


viewBuyPer : Element Msg
viewBuyPer =
    Element.el attributeBuyPer <| Element.text "per share"


attributeBuyPer : List (Attribute Msg)
attributeBuyPer =
    [ Font.color lightBlack
    , Font.size 24
    , Font.alignLeft
    , Font.heavy
    ]


viewAskInput : Maybe Int -> Element Msg
viewAskInput askInput =
    Input.text attributeAskInput
        { onChange = ChangeAskInput
        , text = maybeText askInput
        , placeholder = Nothing
        , label = viewAskInputTitle
        }


attributeAskInput : List (Attribute Msg)
attributeAskInput =
    List.concat
        [ fillWidth
        , [ Element.padding 6
          , Font.color lightBlack
          , Font.size 18
          , Font.alignLeft
          ]
        ]


viewAskInputTitle : Label Msg
viewAskInputTitle =
    Input.labelAbove attributeAskInputTitle <| Element.text "Number of shares"


attributeAskInputTitle : List (Attribute Msg)
attributeAskInputTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewAskTotal : Maybe Int -> Element Msg
viewAskTotal askInput =
    Element.column attributeAskTotal
        [ viewAskTotalTitle
        , viewAskTotalNumber askInput
        ]


attributeAskTotal : List (Attribute Msg)
attributeAskTotal =
    List.concat
        [ shrinkContent
        , [ Element.spacing 6 ]
        ]


viewAskTotalTitle : Element Msg
viewAskTotalTitle =
    Element.el attributeAskTotalTitle <| Element.text "Total amount payment"


attributeAskTotalTitle : List (Attribute Msg)
attributeAskTotalTitle =
    [ Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    ]


viewAskTotalNumber : Maybe Int -> Element Msg
viewAskTotalNumber askInput =
    case askInput of
        Just input ->
            Element.el attributeAskTotalNumber <| Element.text <| toMoney <| input * ask

        Nothing ->
            Element.el attributeAskTotalNumber <| Element.text "0"


attributeAskTotalNumber : List (Attribute Msg)
attributeAskTotalNumber =
    [ Font.color lightBlack
    , Font.size 18
    , Font.alignLeft
    , Font.bold
    ]


viewAskButton : Element Msg
viewAskButton =
    Input.button attributeAskButton
        { onPress = Just Ask
        , label = Element.text "Buy Equity"
        }


attributeAskButton : List (Attribute Msg)
attributeAskButton =
    List.concat
        [ shrinkContent
        , [ Element.padding 6
          , Background.color lightBlack
          , Font.color white
          , Font.size 18
          , Font.alignLeft
          , Font.bold
          ]
        ]



-- HELPER


toMoney : Int -> String
toMoney integer =
    let
        string : String
        string =
            String.fromInt integer

        left : String
        left =
            String.dropRight 2 string

        right : String
        right =
            String.right 2 string
    in
    "P" ++ left ++ "." ++ right


maybeText : Maybe Int -> String
maybeText bidInput =
    case bidInput of
        Just input ->
            String.fromInt input

        Nothing ->
            ""



-- COLOR


white : Color
white =
    Element.fromRgb255
        { red = 255
        , green = 255
        , blue = 255
        , alpha = 1
        }


darkWhite : Color
darkWhite =
    Element.fromRgb255
        { red = 245
        , green = 245
        , blue = 245
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



-- SIZE


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
