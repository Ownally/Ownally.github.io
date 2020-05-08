module Main exposing (main)

import Browser
import Browser.Events
import Element exposing (Attribute, Color, Device, Element)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font exposing (Font)
import Html exposing (Html)
import Image exposing (Image)



-- MAIN


main : Program Flag Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    Device



-- MESSAGE


type Msg
    = ChangeWindow Int Int



-- INIT


type alias Flag =
    { width : Int
    , height : Int
    }


init : Flag -> ( Model, Cmd Msg )
init flag =
    ( Element.classifyDevice flag, Cmd.none )



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ChangeWindow width height ->
            ( Element.classifyDevice <| Flag width height, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Browser.Events.onResize ChangeWindow



-- VIEW


styledLayout : Element Msg -> Html Msg
styledLayout =
    Element.layout
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]


view : Model -> Html Msg
view model =
    styledLayout <| viewByDevice model


attributeLayout : List (Attribute Msg)
attributeLayout =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


viewByDevice : Device -> Element Msg
viewByDevice { class, orientation } =
    let
        column : List (Element Msg) -> Element Msg
        column =
            Element.column attributeByDevice
    in
    case ( class, orientation ) of
        ( Element.Phone, Element.Portrait ) ->
            column childrenPhonePortrait

        ( Element.Tablet, Element.Portrait ) ->
            Element.none

        --column childrenTabletPortrait
        ( Element.Desktop, Element.Portrait ) ->
            Element.none

        --column childrenDesktopPortrait
        ( Element.BigDesktop, Element.Portrait ) ->
            Element.none

        --column childrenBigDesktopPortrait
        ( Element.Phone, Element.Landscape ) ->
            Element.none

        --column childrenPhoneLandscape
        ( Element.Tablet, Element.Landscape ) ->
            Element.none

        --column childrenTabletLandscape
        ( Element.Desktop, Element.Landscape ) ->
            Element.none

        --column childrenDesktopLandscape
        ( Element.BigDesktop, Element.Landscape ) ->
            Element.none



--column childrenBigDesktopLandscape


attributeByDevice : List (Attribute Msg)
attributeByDevice =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


childrenPhonePortrait : List (Element Msg)
childrenPhonePortrait =
    [ viewHeaderPhonePortrait
    , viewLandingPhonePortrait
    , viewProblemPhonePortrait
    , viewMarketPhonePortrait
    , viewMissionPhonePortrait
    , viewProductPhonePortrait
    , viewFeaturePhonePortrait

    --, viewHirePhonePortrait
    --, viewContractPhonePortrait
    ]



{-
   childrenTabletPortrait : List (Element Msg)
   childrenTabletPortrait =
       [ viewHeaderTabletPortrait
       , viewLandingTabletPortrait
       , viewProblemTabletPortrait
       , viewMarketTabletPortrait
       , viewMissionTabletPortrait
       , viewProductTabletPortrait
       , viewFeatureTabletPortrait
       , viewHireTabletPortrait
       , viewContractTabletPortrait
       ]


   childrenDesktopPortrait : List (Element Msg)
   childrenDesktopPortrait =
       [ viewHeaderDesktopPortrait
       , viewLandingDesktopPortrait
       , viewProblemDesktopPortrait
       , viewMarketDesktopPortrait
       , viewMissionDesktopPortrait
       , viewProductDesktopPortrait
       , viewFeatureDesktopPortrait
       , viewHireDesktopPortrait
       , viewContractDesktopPortrait
       ]


   childrenBigDesktopPortrait : List (Element Msg)
   childrenBigDesktopPortrait =
       [ viewHeaderBigDesktopPortrait
       , viewLandingBigDesktopPortrait
       , viewProblemBigDesktopPortrait
       , viewMarketBigDesktopPortrait
       , viewMissionBigDesktopPortrait
       , viewProductBigDesktopPortrait
       , viewFeatureBigDesktopPortrait
       , viewHireBigDesktopPortrait
       , viewContractBigDesktopPortrait
       ]


   childrenPhoneLandscape : List (Element Msg)
   childrenPhoneLandscape =
       [ viewHeaderPhoneLandscape
       , viewLandingPhoneLandscape
       , viewProblemPhoneLandscape
       , viewMarketPhoneLandscape
       , viewMissionPhoneLandscape
       , viewProductPhoneLandscape
       , viewFeaturePhoneLandscape
       , viewHirePhoneLandscape
       , viewContractPhoneLandscape
       ]


   childrenTabletLandscape : List (Element Msg)
   childrenTabletLandscape =
       [ viewHeaderTabletLandscape
       , viewLandingTabletLandscape
       , viewProblemTabletLandscape
       , viewMarketTabletLandscape
       , viewMissionTabletLandscape
       , viewProductTabletLandscape
       , viewFeatureTabletLandscape
       , viewHireTabletLandscape
       , viewContractTabletLandscape
       ]


   childrenDesktopLandscape : List (Element Msg)
   childrenDesktopLandscape =
       [ viewHeaderDesktopLandscape
       , viewLandingDesktopLandscape
       , viewProblemDesktopLandscape
       , viewMarketDesktopLandscape
       , viewMissionDesktopLandscape
       , viewProductDesktopLandscape
       , viewFeatureDesktopLandscape
       , viewHireDesktopLandscape
       , viewContractDesktopLandscape
       ]


   childrenBigDesktopLandscape : List (Element Msg)
   childrenBigDesktopLandscape =
       [ viewHeaderBigDesktopLandscape
       , viewLandingBigDesktopLandscape
       , viewProblemBigDesktopLandscape
       , viewMarketBigDesktopLandscape
       , viewMissionBigDesktopLandscape
       , viewProductBigDesktopLandscape
       , viewFeatureBigDesktopLandscape
       , viewHireBigDesktopLandscape
       , viewContractBigDesktopLandscape
       ]
-}
-- HEADER


viewHeaderPhonePortrait : Element Msg
viewHeaderPhonePortrait =
    viewHeader sizePhone


viewHeaderTabletPortrait : Element Msg
viewHeaderTabletPortrait =
    viewHeader sizeTablet


viewHeaderDesktopPortrait : Element Msg
viewHeaderDesktopPortrait =
    viewHeader sizeDesktop


viewHeaderBigDesktopPortrait : Element Msg
viewHeaderBigDesktopPortrait =
    viewHeader sizeBigDesktop


viewHeaderPhoneLandscape : Element Msg
viewHeaderPhoneLandscape =
    viewHeader sizePhone


viewHeaderTabletLandscape : Element Msg
viewHeaderTabletLandscape =
    viewHeader sizeTablet


viewHeaderDesktopLandscape : Element Msg
viewHeaderDesktopLandscape =
    viewHeader sizeDesktop


viewHeaderBigDesktopLandscape : Element Msg
viewHeaderBigDesktopLandscape =
    viewHeader sizeBigDesktop


type alias Size =
    { padding : Int
    , fontSize : Int
    }


sizePhone : Size
sizePhone =
    { padding = 12
    , fontSize = 24
    }


sizeTablet : Size
sizeTablet =
    { padding = 15
    , fontSize = 42
    }


sizeDesktop : Size
sizeDesktop =
    { padding = 18
    , fontSize = 48
    }


sizeBigDesktop : Size
sizeBigDesktop =
    { padding = 21
    , fontSize = 54
    }


styledHeader : Size -> Element Msg -> Element Msg
styledHeader { padding, fontSize } =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.padding padding
        , Background.color lightBlack
        , Font.color white
        , Font.size fontSize
        , Font.family rubik
        , Font.alignLeft
        , Font.bold
        ]


viewHeader : Size -> Element Msg
viewHeader size =
    styledHeader size <| Element.text "Ownally"



-- LANDING


viewLandingPhonePortrait : Element Msg
viewLandingPhonePortrait =
    Element.column attributeLandingPhonePortrait
        [ viewTitlePhonePortrait
        , viewSubtitlePhonePortrait
        , viewInfoPhonePortrait
        ]


attributeLandingPhonePortrait : List (Attribute Msg)
attributeLandingPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.paddingXY 48 288
    , Element.spacing 12
    , Image.toBackground Image.house
    , Element.behindContent viewtransparentBlack
    ]


styledtransparentBlack : Element Msg -> Element Msg
styledtransparentBlack =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color transparentBlack
        ]


viewtransparentBlack : Element Msg
viewtransparentBlack =
    styledtransparentBlack Element.none


viewTitlePhonePortrait : Element Msg
viewTitlePhonePortrait =
    Element.row attributeTitlePhonePortrait
        [ viewOwnallyPhonePortrait
        , viewTmPhonePortrait
        ]


attributeTitlePhonePortrait : List (Attribute Msg)
attributeTitlePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


styledOwnallyPhonePortrait : Element Msg -> Element Msg
styledOwnallyPhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.centerX
        , Font.color white
        , Font.size 60
        , Font.family rubik
        , Font.bold
        ]


viewOwnallyPhonePortrait : Element Msg
viewOwnallyPhonePortrait =
    styledOwnallyPhonePortrait <| Element.text "Ownally"


styledTmPhonePortrait : Element Msg -> Element Msg
styledTmPhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.centerX
        , Element.alignTop
        , Font.color white
        , Font.size 12
        , Font.family rubik
        , Font.bold
        ]


viewTmPhonePortrait : Element Msg
viewTmPhonePortrait =
    styledTmPhonePortrait <| Element.text "TM"


styledSubtitlePhonePortrait : Element Msg -> Element Msg
styledSubtitlePhonePortrait =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Font.color white
        , Font.size 24
        , Font.family rubik
        , Font.center
        , Font.bold
        ]


viewSubtitlePhonePortrait : Element Msg
viewSubtitlePhonePortrait =
    styledSubtitlePhonePortrait <| Element.text "You can own finally!"


styledInfoPhonePortrait : List (Element Msg) -> Element Msg
styledInfoPhonePortrait =
    Element.paragraph
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Font.color white
        , Font.size 18
        , Font.family rubik
        , Font.center
        ]


viewInfoPhonePortrait : Element Msg
viewInfoPhonePortrait =
    styledInfoPhonePortrait <| List.singleton <| Element.text "Artificial Intelligence and Financial Technology for Transforming Real Estate Acquisition"


styledProblemPhonePortrait : List (Element Msg) -> Element Msg
styledProblemPhonePortrait =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.padding 48
        , Element.spacing 48
        ]


viewProblemPhonePortrait : Element Msg
viewProblemPhonePortrait =
    styledProblemPhonePortrait
        [ viewProblemPopulationPhonePortrait
        , viewProblemTimePhonePortrait
        ]


styledProblemPopulationPhonePortrait : List (Element Msg) -> Element Msg
styledProblemPopulationPhonePortrait =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.spacing 12
        ]


viewProblemPopulationPhonePortrait : Element Msg
viewProblemPopulationPhonePortrait =
    styledProblemPopulationPhonePortrait
        [ viewNumberPopulationPhonePortrait
        , viewFilipinoPopulationPhonePortrait
        , viewProblemFootnoteOnePhonePortrait
        ]


styledNumberPopulationPhonePortrait : List (Element Msg) -> Element Msg
styledNumberPopulationPhonePortrait =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]


viewNumberPopulationPhonePortrait : Element Msg
viewNumberPopulationPhonePortrait =
    styledNumberPopulationPhonePortrait
        [ viewThreeMillionPhonePortrait
        , viewOnePhonePortrait
        ]


styledThreeMillionPhonePortrait : Element Msg -> Element Msg
styledThreeMillionPhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.alignLeft
        , Font.color lightBlack
        , Font.size 36
        , Font.family rubik
        , Font.bold
        ]


viewThreeMillionPhonePortrait : Element Msg
viewThreeMillionPhonePortrait =
    styledThreeMillionPhonePortrait <| Element.text "Three Million"


styledOnePhonePortrait : Element Msg -> Element Msg
styledOnePhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.alignLeft
        , Element.alignTop
        , Font.color lightBlack
        , Font.size 12
        , Font.family rubik
        , Font.bold
        ]


viewOnePhonePortrait : Element Msg
viewOnePhonePortrait =
    styledOnePhonePortrait <| Element.text "1"


styledFilipinoPopulationPhonePortrait : List (Element Msg) -> Element Msg
styledFilipinoPopulationPhonePortrait =
    Element.paragraph
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.alignLeft
        , Element.paddingEach { edges | right = 48 }
        , Font.color lightBlack
        , Font.size 18
        , Font.family rubik
        ]


viewFilipinoPopulationPhonePortrait : Element Msg
viewFilipinoPopulationPhonePortrait =
    styledFilipinoPopulationPhonePortrait <| List.singleton <| Element.text "Filipinos in the National Capital Region do not have property titles or have difficulty in acquiring their own homes."


styledProblemFootnoteOnePhonePortrait : Element Msg -> Element Msg
styledProblemFootnoteOnePhonePortrait =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Font.color lightBlack
        , Font.size 12
        , Font.alignLeft
        , Font.family rubik
        ]


viewProblemFootnoteOnePhonePortrait : Element Msg
viewProblemFootnoteOnePhonePortrait =
    styledProblemFootnoteOnePhonePortrait <| Element.text "1 Philippine Statistics Authority (PSA)"


styledProblemTimePhonePortrait : List (Element Msg) -> Element Msg
styledProblemTimePhonePortrait =
    Element.column
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.spacing 12
        ]


viewProblemTimePhonePortrait : Element Msg
viewProblemTimePhonePortrait =
    styledProblemTimePhonePortrait
        [ viewTenYearsPhonePortrait
        , viewFilipinoYearsPhonePortrait
        , viewProblemFootnoteTwoPhonePortrait
        ]


styledTenYearsPhonePortrait : List (Element Msg) -> Element Msg
styledTenYearsPhonePortrait =
    Element.row
        [ Element.width Element.fill
        , Element.height Element.shrink
        ]


viewTenYearsPhonePortrait : Element Msg
viewTenYearsPhonePortrait =
    styledTenYearsPhonePortrait
        [ viewTenPlusYearsPhonePortrait
        , viewTwoPhonePortrait
        ]


styledTenPlusYearsPhonePortrait : Element Msg -> Element Msg
styledTenPlusYearsPhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.alignRight
        , Font.color lightBlack
        , Font.size 36
        , Font.family rubik
        , Font.bold
        ]


viewTenPlusYearsPhonePortrait : Element Msg
viewTenPlusYearsPhonePortrait =
    styledTenPlusYearsPhonePortrait <| Element.text "10+ Years"


styledTwoPhonePortrait : Element Msg -> Element Msg
styledTwoPhonePortrait =
    Element.el
        [ Element.width Element.shrink
        , Element.height Element.shrink
        , Element.alignRight
        , Element.alignTop
        , Font.color lightBlack
        , Font.size 12
        , Font.family rubik
        , Font.bold
        ]


viewTwoPhonePortrait : Element Msg
viewTwoPhonePortrait =
    styledTwoPhonePortrait <| Element.text "2"


styledFilipinoYearsPhonePortrait : List (Element Msg) -> Element Msg
styledFilipinoYearsPhonePortrait =
    Element.paragraph
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Element.paddingEach { edges | left = 48 }
        , Font.color lightBlack
        , Font.size 18
        , Font.alignRight
        , Font.family rubik
        ]


viewFilipinoYearsPhonePortrait : Element Msg
viewFilipinoYearsPhonePortrait =
    styledFilipinoYearsPhonePortrait <| List.singleton <| Element.text "The number of years majority of Filipinos have to wait and save funds before acquiring their own home."


styledProblemFootnoteTwoPhonePortrait : Element Msg -> Element Msg
styledProblemFootnoteTwoPhonePortrait =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.shrink
        , Font.color lightBlack
        , Font.size 12
        , Font.alignRight
        , Font.family rubik
        ]


viewProblemFootnoteTwoPhonePortrait : Element Msg
viewProblemFootnoteTwoPhonePortrait =
    styledProblemFootnoteTwoPhonePortrait <| Element.text "2 Philippine Daily Inquirer 2019"


viewMarketPhonePortrait : Element Msg
viewMarketPhonePortrait =
    Element.column attributeMarketPhonePortrait
        [ viewMarketTitlePhonePortrait
        , viewMarketSizePhonePortrait
        , viewMarketHistoryPhonePortrait
        , viewMarketPredictionPhonePortrait
        , viewMarketFootnotePhonePortrait
        ]


attributeMarketPhonePortrait : List (Attribute Msg)
attributeMarketPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.padding 48
    , Element.spacing 48
    , Image.toBackground Image.building
    , Element.behindContent viewTransparentWhite
    ]


viewTransparentWhite : Element Msg
viewTransparentWhite =
    Element.el
        [ Element.width Element.fill
        , Element.height Element.fill
        , Background.color transparentWhite
        ]
    <|
        Element.none


viewMarketTitlePhonePortrait : Element Msg
viewMarketTitlePhonePortrait =
    Element.paragraph attributeMarketTitlePhonePortrait <| List.singleton <| Element.text "Real Estate Industry in the Philippines"


attributeMarketTitlePhonePortrait : List (Attribute Msg)
attributeMarketTitlePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 36
    , Font.center
    , Font.family rubik
    , Font.bold
    ]


viewMarketSizePhonePortrait : Element Msg
viewMarketSizePhonePortrait =
    Element.column attributeMarketSizePhonePortrait
        [ viewMarketTrillionPhonePortrait
        , viewMarketResidentialPhonePortrait
        ]


attributeMarketSizePhonePortrait : List (Attribute Msg)
attributeMarketSizePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 12
    ]


viewMarketTrillionPhonePortrait : Element Msg
viewMarketTrillionPhonePortrait =
    Element.paragraph attributeMarketTrillionPhonePortrait <| List.singleton <| Element.text "PHP 3.5 Trillion industry potential in the National Capital Region (NCR) Alone"


attributeMarketTrillionPhonePortrait : List (Attribute Msg)
attributeMarketTrillionPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 24
    , Font.family rubik
    , Font.alignLeft
    , Font.bold
    ]


viewMarketResidentialPhonePortrait : Element Msg
viewMarketResidentialPhonePortrait =
    Element.paragraph attributeMarketResidentialPhonePortrait <| List.singleton <| Element.text "An additional 91,500 residential units is forecasted by the end of 2022, growing at a rate of 25% from 2019, or 8% year on year - many of which are inaccessible to many Filipinos."


attributeMarketResidentialPhonePortrait : List (Attribute Msg)
attributeMarketResidentialPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 18
    , Font.family rubik
    , Font.alignLeft
    ]


viewMarketHistoryPhonePortrait : Element Msg
viewMarketHistoryPhonePortrait =
    Element.column attributeMarketHistoryPhonePortrait
        [ viewMarketGrowthPhonePortrait
        , viewMarketIncreasePhonePortrait
        ]


attributeMarketHistoryPhonePortrait : List (Attribute Msg)
attributeMarketHistoryPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 12
    ]


viewMarketGrowthPhonePortrait : Element Msg
viewMarketGrowthPhonePortrait =
    Element.paragraph attributeMarketGrowthPhonePortrait <| List.singleton <| Element.text "Strong historical growth of real estate after crises"


attributeMarketGrowthPhonePortrait : List (Attribute Msg)
attributeMarketGrowthPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 24
    , Font.family rubik
    , Font.alignLeft
    , Font.bold
    ]


viewMarketIncreasePhonePortrait : Element Msg
viewMarketIncreasePhonePortrait =
    Element.paragraph attributeMarketIncreasePhonePortrait <| List.singleton <| Element.text "Property values in NCR have increased at a rate of around 65% to 121% from 2011 to 2016 - a good investment vehicle out of reach for many Filipinos."


attributeMarketIncreasePhonePortrait : List (Attribute Msg)
attributeMarketIncreasePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 18
    , Font.family rubik
    , Font.alignLeft
    ]


viewMarketPredictionPhonePortrait : Element Msg
viewMarketPredictionPhonePortrait =
    Element.column attributeMarketPredictionPhonePortrait
        [ viewMarketGdpPhonePortrait
        , viewMarketInfrastructurePhonePortrait
        ]


attributeMarketPredictionPhonePortrait : List (Attribute Msg)
attributeMarketPredictionPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 12
    ]


viewMarketGdpPhonePortrait : Element Msg
viewMarketGdpPhonePortrait =
    Element.paragraph attributeMarketGdpPhonePortrait <| List.singleton <| Element.text "7% of GDP in 2022 from 3% in 2015"


attributeMarketGdpPhonePortrait : List (Attribute Msg)
attributeMarketGdpPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 24
    , Font.family rubik
    , Font.alignLeft
    , Font.bold
    ]


viewMarketInfrastructurePhonePortrait : Element Msg
viewMarketInfrastructurePhonePortrait =
    Element.paragraph attributeMarketInfrastructurePhonePortrait <| List.singleton <| Element.text "It is expected to be spent on infrastructore projects, boosting the national real estate industry."


attributeMarketInfrastructurePhonePortrait : List (Attribute Msg)
attributeMarketInfrastructurePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 18
    , Font.family rubik
    , Font.alignLeft
    ]


viewMarketFootnotePhonePortrait : Element Msg
viewMarketFootnotePhonePortrait =
    Element.column attributeMarketFootnotePhonePortrait
        [ viewMarketFootnoteOnePhonePortrait
        , viewMarketFootnoteTwoPhonePortrait
        , viewMarketFootnoteThreePhonePortrait
        , viewMarketFootnoteFourPhonePortrait
        ]


attributeMarketFootnotePhonePortrait : List (Attribute Msg)
attributeMarketFootnotePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 3
    ]


viewMarketFootnoteOnePhonePortrait : Element Msg
viewMarketFootnoteOnePhonePortrait =
    elementMarketFootnotePhonePortrait "1 JLL Phlippines 2019"


viewMarketFootnoteTwoPhonePortrait : Element Msg
viewMarketFootnoteTwoPhonePortrait =
    elementMarketFootnotePhonePortrait "2 Lamudi 2020"


viewMarketFootnoteThreePhonePortrait : Element Msg
viewMarketFootnoteThreePhonePortrait =
    elementMarketFootnotePhonePortrait "3 LeeChiu Property Consultants 2017"


viewMarketFootnoteFourPhonePortrait : Element Msg
viewMarketFootnoteFourPhonePortrait =
    elementMarketFootnotePhonePortrait "4 Department of Budget and Management (DBM) 2019"


elementMarketFootnotePhonePortrait : String -> Element Msg
elementMarketFootnotePhonePortrait string =
    Element.paragraph attributeMarketFootnoteOnePhonePortrait <| List.singleton <| Element.text string


attributeMarketFootnoteOnePhonePortrait : List (Attribute Msg)
attributeMarketFootnoteOnePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.fill
    , Font.color lightBlack
    , Font.size 12
    , Font.alignLeft
    , Font.family rubik
    ]


viewMissionPhonePortrait : Element Msg
viewMissionPhonePortrait =
    Element.column attributeMissionPhonePortrait
        [ viewWorldMapPhonePortrait
        , viewOurMissionPhonePortrait
        ]


attributeMissionPhonePortrait : List (Attribute Msg)
attributeMissionPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.padding 48
    , Element.spacing 48
    , Background.color lightBlack
    ]


viewWorldMapPhonePortrait : Element Msg
viewWorldMapPhonePortrait =
    Image.toElement attributeWorldMapPhonePortrait Image.worldMap


attributeWorldMapPhonePortrait : List (Attribute Msg)
attributeWorldMapPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    ]


viewOurMissionPhonePortrait : Element Msg
viewOurMissionPhonePortrait =
    Element.column atrributeOurMissionPhonePortrait
        [ viewMissionTitlePhonePortrait
        , viewMissionParagraphPhonePortrait
        ]


atrributeOurMissionPhonePortrait : List (Attribute Msg)
atrributeOurMissionPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 12
    ]


viewMissionTitlePhonePortrait : Element Msg
viewMissionTitlePhonePortrait =
    Element.paragraph attributeMissionTitlePhonePortrait <| List.singleton <| Element.text "Our Mission"


attributeMissionTitlePhonePortrait : List (Attribute Msg)
attributeMissionTitlePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color white
    , Font.size 36
    , Font.family rubik
    , Font.alignLeft
    ]


viewMissionParagraphPhonePortrait : Element Msg
viewMissionParagraphPhonePortrait =
    Element.paragraph attributeMissionParagraphPhonePortrait
        [ Element.text "Leveraging the use of Artificial Intelligence, Smart Contract Technology, Real Estate and Legal Know-How, and Financial Engineering, we provide the platform enabling people in the Philippines, Southeast Asia and East Asia to finally own their dream homes - "
        , viewMissionBoldPhonePortrait
        ]


attributeMissionParagraphPhonePortrait : List (Attribute Msg)
attributeMissionParagraphPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color white
    , Font.size 18
    , Font.family rubik
    ]


viewMissionBoldPhonePortrait : Element Msg
viewMissionBoldPhonePortrait =
    Element.el additionalAttributeBold <| Element.text "easier, more affordable, and earlier in their lives, with zero in loans or debt."


additionalAttributeBold : List (Attribute Msg)
additionalAttributeBold =
    List.singleton Font.heavy


viewProductPhonePortrait : Element Msg
viewProductPhonePortrait =
    Element.column attributeProductPhonePortrait
        [ viewProductSubtitlePhonePortrait
        , viewBuyerPhonePortrait
        , viewBigDataPhonePortrait
        , viewCompanyPhonePortrait
        , viewSmartContractPhonePortrait
        , viewThirdPartyPhonePortrait
        ]


attributeProductPhonePortrait : List (Attribute Msg)
attributeProductPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.padding 48
    , Element.spacing 48
    ]


viewProductSubtitlePhonePortrait : Element Msg
viewProductSubtitlePhonePortrait =
    Element.paragraph attributeProductSubtitlePhonePortrait <| List.singleton <| Element.text "Opening up opportunities for a new wave of property buyers and passive investors"


attributeProductSubtitlePhonePortrait : List (Attribute Msg)
attributeProductSubtitlePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 24
    , Font.family rubik
    , Font.center
    , Font.bold
    ]


viewBuyerPhonePortrait : Element Msg
viewBuyerPhonePortrait =
    elementBoxPortrait "Buyer Chooses any Property"


viewCompanyPhonePortrait : Element Msg
viewCompanyPhonePortrait =
    elementBoxPortrait "Ownally as Primary Partner Co-Investor"


viewThirdPartyPhonePortrait : Element Msg
viewThirdPartyPhonePortrait =
    elementBoxPortrait "Third-Party Home Equity Investor"


elementBoxPortrait : String -> Element Msg
elementBoxPortrait string =
    Element.el attributeBoxPhonePortrait <| elementTextBoxPhonePortrait string


attributeBoxPhonePortrait : List (Attribute Msg)
attributeBoxPhonePortrait =
    [ Element.width Element.fill
    , Element.height <| Element.px 96
    , Element.paddingXY 48 0
    , Background.color lightBlack
    , Border.roundEach { rounded | topLeft = 20, topRight = 20 }
    ]


elementTextBoxPhonePortrait : String -> Element Msg
elementTextBoxPhonePortrait string =
    Element.paragraph atrributeTextBoxPhonePortrait <| List.singleton <| Element.text string


atrributeTextBoxPhonePortrait : List (Attribute Msg)
atrributeTextBoxPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.centerY
    , Font.color white
    , Font.size 24
    , Font.family rubik
    , Font.center
    , Font.bold
    ]


viewBigDataPhonePortrait : Element Msg
viewBigDataPhonePortrait =
    elementNextPhonePortrait "Artificial Intelligence R&V Modeling-enabled Acquisition"


viewSmartContractPhonePortrait : Element Msg
viewSmartContractPhonePortrait =
    elementNextPhonePortrait "Smart Contract-enabled Fintech Network Platform"


elementNextPhonePortrait : String -> Element Msg
elementNextPhonePortrait string =
    Element.paragraph atrributeNextPhonePortrait <| List.singleton <| Element.text string


atrributeNextPhonePortrait : List (Attribute Msg)
atrributeNextPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color lightBlack
    , Font.size 18
    , Font.family rubik
    , Font.center
    ]


viewFeaturePhonePortrait : Element Msg
viewFeaturePhonePortrait =
    Element.column attributeFeaturePhonePortrait
        [ viewFeatureBuyerPhonePortrait
        , viewFeatureCompanyPhonePortrait
        , viewFeatureThirdPartyPhonePortrait
        ]


attributeFeaturePhonePortrait : List (Attribute Msg)
attributeFeaturePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.padding 48
    , Element.spacing 48
    , Background.color lightBlack
    ]


viewFeatureBuyerPhonePortrait : Element Msg
viewFeatureBuyerPhonePortrait =
    elementFeatureAdvantagePhonePortrait "Property Buyer" featureBuyerList


viewFeatureCompanyPhonePortrait : Element Msg
viewFeatureCompanyPhonePortrait =
    elementFeatureAdvantagePhonePortrait "Ownally" featureCompanyList


viewFeatureThirdPartyPhonePortrait : Element Msg
viewFeatureThirdPartyPhonePortrait =
    elementFeatureAdvantagePhonePortrait "Equity Investor" featureThirdPartyList


type alias Highlighted =
    { red : String
    , non : String
    }


featureBuyer1 : Highlighted
featureBuyer1 =
    { red = "ZERO "
    , non = "debt or loan for the property buyer"
    }


featureBuyer2 : Highlighted
featureBuyer2 =
    { red = "MORE "
    , non = "affordable rates for property buyer than home loans or traditional financing"
    }


featureBuyer3 : Highlighted
featureBuyer3 =
    { red = "NO "
    , non = "collaterals needed"
    }


featureBuyer4 : Highlighted
featureBuyer4 =
    { red = "DAY-ONE "
    , non = "home ownership after appliction process"
    }


featureBuyer5 : Highlighted
featureBuyer5 =
    { red = "EASIER "
    , non = "monthly payments"
    }


featureBuyerList : List Highlighted
featureBuyerList =
    [ featureBuyer1
    , featureBuyer2
    , featureBuyer3
    , featureBuyer4
    , featureBuyer5
    ]


featureCompany1 : Highlighted
featureCompany1 =
    notHighlighted "Equity futures charter based on financial enginerring"


featureCompany2 : Highlighted
featureCompany2 =
    notHighlighted "Real-time property appraisal and monitoring for property value appreciation"


featureCompany3 : Highlighted
featureCompany3 =
    notHighlighted "Home insurance inclusion"


featureCompanyList : List Highlighted
featureCompanyList =
    [ featureCompany1
    , featureCompany2
    , featureCompany3
    ]


featureThirdParty1 : Highlighted
featureThirdParty1 =
    notHighlighted "Tech-enabled and equity proportionate return based on derived valuation"


featureThirdParty2 : Highlighted
featureThirdParty2 =
    notHighlighted "Appreciating fractional home equity subscription"


featureThirdParty3 : Highlighted
featureThirdParty3 =
    notHighlighted "Price mediation and discovery"


featureThirdParty4 : Highlighted
featureThirdParty4 =
    notHighlighted "Portfolio management"


featureThirdPartyList : List Highlighted
featureThirdPartyList =
    [ featureThirdParty1
    , featureThirdParty2
    , featureThirdParty3
    , featureThirdParty4
    ]


notHighlighted : String -> Highlighted
notHighlighted string =
    { red = ""
    , non = string
    }


elementFeatureAdvantagePhonePortrait : String -> List Highlighted -> Element Msg
elementFeatureAdvantagePhonePortrait string list =
    Element.column atrributeFeatureAdvantagePhonePortrait
        [ elementProTitlePhonePortrait string
        , elementProPhonePortrait list
        ]


atrributeFeatureAdvantagePhonePortrait : List (Attribute Msg)
atrributeFeatureAdvantagePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 24
    ]


elementProTitlePhonePortrait : String -> Element Msg
elementProTitlePhonePortrait string =
    Element.paragraph attributeProTitlePhonePortrait <| List.singleton <| Element.text string


attributeProTitlePhonePortrait : List (Attribute Msg)
attributeProTitlePhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color white
    , Font.size 36
    , Font.family rubik
    , Font.alignRight
    , Font.bold
    ]


elementProPhonePortrait : List Highlighted -> Element Msg
elementProPhonePortrait list =
    Element.column attributeProPhonePortrait <| List.map elementListPhonePortrait list


attributeProPhonePortrait : List (Attribute Msg)
attributeProPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Element.spacing 12
    ]


elementListPhonePortrait : Highlighted -> Element Msg
elementListPhonePortrait { red, non } =
    Element.paragraph attributeListPhonePortrait
        [ viewHighlightedPhonePortrait red
        , Element.text non
        ]


attributeListPhonePortrait : List (Attribute Msg)
attributeListPhonePortrait =
    [ Element.width Element.fill
    , Element.height Element.shrink
    , Font.color white
    , Font.size 18
    , Font.family rubik
    , Font.alignRight
    ]


viewHighlightedPhonePortrait : String -> Element Msg
viewHighlightedPhonePortrait string =
    Element.el additionalAttributeRed <| Element.text string


additionalAttributeRed : List (Attribute Msg)
additionalAttributeRed =
    List.singleton <| Font.color maroon



{-
   viewHirePhonePortrait : Element Msg
   viewHirePhonePortrait =
       Element.column attributeHirePhonePortrait
           [ viewLookingPhonePortrait
           , viewCVPhonePortrait
           , viewCTOPhonePortrait
           , viewCMOPhonePortrait
           , viewCOOPhonePortrait
           ]

   attributeHirePhonePortrait : Element Msg
   attributeHirePhonePortrait =
       [ Element.width Element.fill
       , Element.height Element.shrink
       , Element.padding 48
       , Element.spacing 48
       ]

-}
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


maroon : Color
maroon =
    Element.fromRgb255
        { red = 128
        , green = 0
        , blue = 0
        , alpha = 1
        }


transparentBlack : Color
transparentBlack =
    Element.fromRgb255
        { red = 0
        , green = 0
        , blue = 0
        , alpha = 0.7
        }


transparentWhite : Color
transparentWhite =
    Element.fromRgb255
        { red = 255
        , green = 255
        , blue = 255
        , alpha = 0.7
        }



-- FONT


rubik : List Font
rubik =
    [ Font.typeface "Rubik"
    , Font.sansSerif
    ]



-- PADDING


type alias Edges =
    { top : Int
    , right : Int
    , bottom : Int
    , left : Int
    }


edges : Edges
edges =
    { top = 0
    , right = 0
    , bottom = 0
    , left = 0
    }



-- ROUNDED


type alias Rounded =
    { topLeft : Int
    , topRight : Int
    , bottomLeft : Int
    , bottomRight : Int
    }


rounded : Rounded
rounded =
    { topLeft = 0
    , topRight = 0
    , bottomLeft = 0
    , bottomRight = 0
    }
