module Main exposing (main)

-- IMPORT

import Browser
import Element exposing (Attribute, Color, Device, Element, row)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Page.Dashboard as Dashboard
import Page.Home as Home
import Window exposing (Window)



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
    { window : Window
    , page : Page
    }


type Page
    = Home
    | Dashboard Dashboard.Model



--| Dashboard
-- INIT


type alias Flag =
    { width : Int
    , height : Int
    }


init : Flag -> ( Model, Cmd Msg )
init =
    Window.init initialize


initialize : Window -> ( Model, Cmd Msg )
initialize window =
    ( Model window Home, Cmd.none )



-- Msg


type Msg
    = ChangeWindow Window
    | GoHome
    | GoDashboard
    | OnDashboard Dashboard.Msg



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg ({ page } as model) =
    case ( msg, page ) of
        ( ChangeWindow window, _ ) ->
            ( { model | window = window }, Cmd.none )

        ( GoHome, Home ) ->
            ( model, Cmd.none )

        ( GoHome, _ ) ->
            ( { model | page = Home }, Cmd.none )

        ( GoDashboard, Dashboard _ ) ->
            ( model, Cmd.none )

        ( GoDashboard, _ ) ->
            ( { model | page = Dashboard Dashboard.initialModel }, Cmd.none )

        ( OnDashboard dashboardMsg, Dashboard dashboardModel ) ->
            let
                next : ( Dashboard.Model, Cmd Dashboard.Msg )
                next =
                    Dashboard.update dashboardMsg dashboardModel
            in
            ( { model | page = Dashboard <| Tuple.first next }, Cmd.map OnDashboard <| Tuple.second next )

        _ ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Window.onResize ChangeWindow



-- VIEW


view : Model -> Html Msg
view { window, page } =
    let
        device : Device
        device =
            Window.classifyDevice window

        layoutHome : Element Msg -> (Window -> Element Msg) -> Html Msg
        layoutHome header currentPage =
            Element.layout (attribute header) <| currentPage window

        layoutDashboard : Element Msg -> (Window -> Dashboard.Model -> Element Dashboard.Msg) -> Dashboard.Model -> Html Msg
        layoutDashboard header currentPage dashboardModel =
            Element.layout (attribute header) <| Element.map OnDashboard <| currentPage window dashboardModel
    in
    case ( page, device.class, device.orientation ) of
        ( Home, Element.Phone, Element.Portrait ) ->
            layoutHome viewHeaderHomePhonePortrait Home.viewPhonePortrait

        ( Home, Element.Tablet, Element.Portrait ) ->
            layoutHome viewHeaderHomeTabletPortrait Home.viewTabletPortrait

        ( Home, Element.Desktop, Element.Portrait ) ->
            layoutHome viewHeaderHomeDesktopPortrait Home.viewDesktopPortrait

        ( Home, Element.BigDesktop, Element.Portrait ) ->
            layoutHome viewHeaderHomeBigDesktopPortrait Home.viewBigDesktopPortrait

        ( Home, Element.Phone, Element.Landscape ) ->
            layoutHome viewHeaderHomePhoneLandscape Home.viewPhoneLandscape

        ( Home, Element.Tablet, Element.Landscape ) ->
            layoutHome viewHeaderHomeTabletLandscape Home.viewTabletLandscape

        ( Home, Element.Desktop, Element.Landscape ) ->
            layoutHome viewHeaderHomeDesktopLandscape Home.viewDesktopLandscape

        ( Home, Element.BigDesktop, Element.Landscape ) ->
            layoutHome viewHeaderHomeBigDesktopLandscape Home.viewBigDesktopLandscape

        ( Dashboard dashboardModel, Element.Phone, Element.Portrait ) ->
            layoutDashboard viewHeaderDashboardPhonePortrait Dashboard.viewPhonePortrait dashboardModel

        ( Dashboard dashboardModel, Element.Tablet, Element.Portrait ) ->
            layoutDashboard viewHeaderDashboardTabletPortrait Dashboard.viewTabletPortrait dashboardModel

        ( Dashboard dashboardModel, Element.Desktop, Element.Portrait ) ->
            layoutDashboard viewHeaderDashboardDesktopPortrait Dashboard.viewDesktopPortrait dashboardModel

        ( Dashboard dashboardModel, Element.BigDesktop, Element.Portrait ) ->
            layoutDashboard viewHeaderDashboardBigDesktopPortrait Dashboard.viewBigDesktopPortrait dashboardModel

        ( Dashboard dashboardModel, Element.Phone, Element.Landscape ) ->
            layoutDashboard viewHeaderDashboardPhoneLandscape Dashboard.viewPhoneLandscape dashboardModel

        ( Dashboard dashboardModel, Element.Tablet, Element.Landscape ) ->
            layoutDashboard viewHeaderDashboardTabletLandscape Dashboard.viewTabletLandscape dashboardModel

        ( Dashboard dashboardModel, Element.Desktop, Element.Landscape ) ->
            layoutDashboard viewHeaderDashboardDesktopLandscape Dashboard.viewDesktopLandscape dashboardModel

        ( Dashboard dashboardModel, Element.BigDesktop, Element.Landscape ) ->
            layoutDashboard viewHeaderDashboardBigDesktopLandscape Dashboard.viewBigDesktopLandscape dashboardModel


attribute : Element Msg -> List (Attribute Msg)
attribute header =
    List.concat
        [ fillWindow
        , [ Element.inFront header ]
        ]



-- HEADER


viewHeaderHomePhonePortrait : Element Msg
viewHeaderHomePhonePortrait =
    viewHeaderHome


viewHeaderHomeTabletPortrait : Element Msg
viewHeaderHomeTabletPortrait =
    viewHeaderHome


viewHeaderHomeDesktopPortrait : Element Msg
viewHeaderHomeDesktopPortrait =
    viewHeaderHome


viewHeaderHomeBigDesktopPortrait : Element Msg
viewHeaderHomeBigDesktopPortrait =
    viewHeaderHome


viewHeaderHomePhoneLandscape : Element Msg
viewHeaderHomePhoneLandscape =
    viewHeaderHome


viewHeaderHomeTabletLandscape : Element Msg
viewHeaderHomeTabletLandscape =
    viewHeaderHome


viewHeaderHomeDesktopLandscape : Element Msg
viewHeaderHomeDesktopLandscape =
    viewHeaderHome


viewHeaderHomeBigDesktopLandscape : Element Msg
viewHeaderHomeBigDesktopLandscape =
    viewHeaderHome


viewHeaderHome : Element Msg
viewHeaderHome =
    row attributeHeaderHome
        [ viewTitle
        , viewButtonDashboard
        ]


attributeHeaderHome : List (Attribute Msg)
attributeHeaderHome =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 144 18
          , Background.color lightBlack
          ]
        ]


viewTitle : Element Msg
viewTitle =
    Input.button attributeTitle
        { onPress = Nothing
        , label = Element.text "Ownally"
        }


attributeTitle : List (Attribute Msg)
attributeTitle =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Font.color white
          , Font.size 36
          , Font.alignLeft
          , Font.bold
          ]
        ]


viewButtonDashboard : Element Msg
viewButtonDashboard =
    Input.button attributeButtonDashboard
        { onPress = Just GoDashboard
        , label = Element.text "Dashboard"
        }


attributeButtonDashboard : List (Attribute Msg)
attributeButtonDashboard =
    List.concat
        [ shrinkContent
        , [ Element.alignRight
          , Element.centerY
          , Font.color white
          , Font.size 24
          , Font.alignLeft
          ]
        ]


viewHeaderDashboardPhonePortrait : Element Msg
viewHeaderDashboardPhonePortrait =
    viewHeaderDashboard


viewHeaderDashboardTabletPortrait : Element Msg
viewHeaderDashboardTabletPortrait =
    viewHeaderDashboard


viewHeaderDashboardDesktopPortrait : Element Msg
viewHeaderDashboardDesktopPortrait =
    viewHeaderDashboard


viewHeaderDashboardBigDesktopPortrait : Element Msg
viewHeaderDashboardBigDesktopPortrait =
    viewHeaderDashboard


viewHeaderDashboardPhoneLandscape : Element Msg
viewHeaderDashboardPhoneLandscape =
    viewHeaderDashboard


viewHeaderDashboardTabletLandscape : Element Msg
viewHeaderDashboardTabletLandscape =
    viewHeaderDashboard


viewHeaderDashboardDesktopLandscape : Element Msg
viewHeaderDashboardDesktopLandscape =
    viewHeaderDashboard


viewHeaderDashboardBigDesktopLandscape : Element Msg
viewHeaderDashboardBigDesktopLandscape =
    viewHeaderDashboard


viewHeaderDashboard : Element Msg
viewHeaderDashboard =
    Element.row attributeHeaderDashboard
        [ viewDashboardTitle ]


attributeHeaderDashboard : List (Attribute Msg)
attributeHeaderDashboard =
    List.concat
        [ fillWidth
        , [ Element.paddingXY 144 18
          , Background.color lightBlack
          ]
        ]


viewDashboardTitle : Element Msg
viewDashboardTitle =
    Input.button attributeDashboardTitle
        { onPress = Just GoHome
        , label = Element.text "Ownally"
        }


attributeDashboardTitle : List (Attribute Msg)
attributeDashboardTitle =
    List.concat
        [ shrinkContent
        , [ Element.alignLeft
          , Font.color white
          , Font.size 36
          , Font.alignLeft
          , Font.bold
          ]
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
