import std/[macros, intsets]

macro implementFlags(flagName, flagSetName, flags): untyped =
  var flagEnum = nnkEnumTy.newTree(newEmptyNode())
  for flag in flags:
    if flag.kind == nnkAsgn:
      flagEnum.add(nnkEnumFieldDef.newTree(
        flag[0],
        flag[1],
      ))
    else:
      flagEnum.add(flag)

  quote do:
    type
      `flagSetName`* = distinct cint
      `flagName`* {.pure.} = `flagEnum`

    proc toSet*(flags: openArray[`flagName`]): IntSet =
      result = initIntSet()
      for flag in flags:
        result.incl flag.int

    proc toFlags*(flagSet: IntSet): `flagSetName` =
      for flag in flagSet:
        result = (result.int or flag.int).`flagSetName`

    converter toFlags*(flag: `flagName`): `flagSetName` =
      flag.`flagSetName`

implementFlags(ImGuiItemFlag, ImGuiItemFlags):
  NoTabStop = 1 shl 0
  ButtonRepeat = 1 shl 1
  Disabled = 1 shl 2
  NoNav = 1 shl 3
  NoNavDefaultFocus = 1 shl 4
  SelectableDontClosePopup = 1 shl 5
  MixedValue = 1 shl 6
  ReadOnly = 1 shl 7

implementFlags(ImGuiItemAddFlag, ImGuiItemAddFlags):
  Focusable = 1 shl 0

implementFlags(ImGuiItemStatusFlag, ImGuiItemStatusFlags):
  HoveredRect = 1 shl 0
  HasDisplayRect = 1 shl 1
  Edited = 1 shl 2
  ToggledSelection = 1 shl 3
  ToggledOpen = 1 shl 4
  HasDeactivated = 1 shl 5
  Deactivated = 1 shl 6
  HoveredWindow = 1 shl 7
  FocusedByCode = 1 shl 8
  FocusedByTabbing = 1 shl 9

implementFlags(ImGuiSelectableFlag, ImGuiSelectableFlags):
  DontClosePopups = 1 shl 0
  SpanAllColumns = 1 shl 1
  AllowDoubleClick = 1 shl 2
  Disabled = 1 shl 3
  AllowItemOverlap = 1 shl 4
  NoHoldingActiveID = 1 shl 20
  SelectOnClick = 1 shl 21
  SelectOnRelease = 1 shl 22
  SpanAvailWidth = 1 shl 23
  DrawHoveredWhenHeld = 1 shl 24
  SetNavIdOnHover = 1 shl 25
  NoPadWithHalfSpacing = 1 shl 26

implementFlags(ImGuiSeparatorFlag, ImGuiSeparatorFlags):
  Horizontal = 1 shl 0
  Vertical = 1 shl 1
  SpanAllColumns = 1 shl 2

implementFlags(ImGuiTextFlag, ImGuiTextFlags):
  NoWidthForLargeClippedText = 1 shl 0

implementFlags(ImGuiTooltipFlag, ImGuiTooltipFlags):
  OverridePreviousTooltip = 1 shl 0

implementFlags(ImGuiNavHighlightFlag, ImGuiNavHighlightFlags):
  TypeDefault = 1 shl 0
  TypeThin = 1 shl 1
  AlwaysDraw = 1 shl 2
  NoRounding = 1 shl 3

implementFlags(ImGuiNavDirSourceFlag, ImGuiNavDirSourceFlags):
  Keyboard = 1 shl 0
  PadDPad = 1 shl 1
  PadLStick = 1 shl 2

implementFlags(ImGuiNavMoveFlag, ImGuiNavMoveFlags):
  LoopX = 1 shl 0
  LoopY = 1 shl 1
  WrapX = 1 shl 2
  WrapY = 1 shl 3
  AllowCurrentNavId = 1 shl 4
  AlsoScoreVisibleSet = 1 shl 5
  ScrollToEdge = 1 shl 6

implementFlags(ImGuiNextWindowDataFlag, ImGuiNextWindowDataFlags):
  HasPos = 1 shl 0
  HasSize = 1 shl 1
  HasContentSize = 1 shl 2
  HasCollapsed = 1 shl 3
  HasSizeConstraint = 1 shl 4
  HasFocus = 1 shl 5
  HasBgAlpha = 1 shl 6
  HasScroll = 1 shl 7

implementFlags(ImGuiNextItemDataFlag, ImGuiNextItemDataFlags):
  HasWidth = 1 shl 0
  HasOpen = 1 shl 1

implementFlags(ImGuiOldColumnFlag, ImGuiOldColumnFlags):
  NoBorder = 1 shl 0
  NoResize = 1 shl 1
  NoPreserveWidths = 1 shl 2
  NoForceWithinWindow = 1 shl 3
  GrowParentContentsSize = 1 shl 4

implementFlags(ImGuiWindowFlag, ImGuiWindowFlags):
  NoTitleBar = 1 shl 0
  NoResize = 1 shl 1
  NoMove = 1 shl 2
  NoScrollbar = 1 shl 3
  NoScrollWithMouse = 1 shl 4
  NoCollapse = 1 shl 5
  NoDecoration = ImGuiWindowFlag.NoTitleBar.int or
                 ImGuiWindowFlag.NoResize.int or
                 ImGuiWindowFlag.NoScrollbar.int or
                 ImGuiWindowFlag.NoCollapse.int
  AlwaysAutoResize = 1 shl 6
  NoBackground = 1 shl 7
  NoSavedSettings = 1 shl 8
  NoMouseInputs = 1 shl 9
  MenuBar = 1 shl 10
  HorizontalScrollbar = 1 shl 11
  NoFocusOnAppearing = 1 shl 12
  NoBringToFrontOnFocus = 1 shl 13
  AlwaysVerticalScrollbar = 1 shl 14
  AlwaysHorizontalScrollbar = 1 shl 15
  AlwaysUseWindowPadding = 1 shl 16
  NoNavInputs = 1 shl 18
  NoNavFocus = 1 shl 19
  NoNav = ImGuiWindowFlag.NoNavInputs.int or
          ImGuiWindowFlag.NoNavFocus.int
  NoInputs = ImGuiWindowFlag.NoMouseInputs.int or
             ImGuiWindowFlag.NoNavInputs.int or
             ImGuiWindowFlag.NoNavFocus.int
  UnsavedDocument = 1 shl 20
  NavFlattened = 1 shl 23
  ChildWindow = 1 shl 24
  Tooltip = 1 shl 25
  Popup = 1 shl 26
  Modal = 1 shl 27
  ChildMenu = 1 shl 28

implementFlags(ImGuiInputTextFlag, ImGuiInputTextFlags):
  CharsDecimal = 1 shl 0
  CharsHexadecimal = 1 shl 1
  CharsUppercase = 1 shl 2
  CharsNoBlank = 1 shl 3
  AutoSelectAll = 1 shl 4
  EnterReturnsTrue = 1 shl 5
  CallbackCompletion = 1 shl 6
  CallbackHistory = 1 shl 7
  CallbackAlways = 1 shl 8
  CallbackCharFilter = 1 shl 9
  AllowTabInput = 1 shl 10
  CtrlEnterForNewLine = 1 shl 11
  NoHorizontalScroll = 1 shl 12
  AlwaysOverwrite = 1 shl 13
  ReadOnly = 1 shl 14
  Password = 1 shl 15
  NoUndoRedo = 1 shl 16
  CharsScientific = 1 shl 17
  CallbackResize = 1 shl 18
  CallbackEdit = 1 shl 19
  Multiline = 1 shl 26
  NoMarkEdited = 1 shl 27
  MergedItem = 1 shl 28

implementFlags(ImGuiTreeNodeFlag, ImGuiTreeNodeFlags):
  Selected = 1 shl 0
  Framed = 1 shl 1
  AllowItemOverlap = 1 shl 2
  NoTreePushOnOpen = 1 shl 3
  CollapsingHeader = ImGuiTreeNodeFlag.Framed.int or
                     ImGuiTreeNodeFlag.NoTreePushOnOpen.int
  NoAutoOpenOnLog = 1 shl 4
  DefaultOpen = 1 shl 5
  OpenOnDoubleClick = 1 shl 6
  OpenOnArrow = 1 shl 7
  Leaf = 1 shl 8
  Bullet = 1 shl 9
  FramePadding = 1 shl 10
  SpanAvailWidth = 1 shl 11
  SpanFullWidth = 1 shl 12
  NavLeftJumpsBackHere = 1 shl 13
  ClipLabelForTrailingButton = 1 shl 20

implementFlags(ImGuiPopupFlag, ImGuiPopupFlags):
  MouseButtonLeft = 0
  MouseButtonRight = 1
  MouseButtonMiddle = 2
  NoOpenOverExistingPopup = 1 shl 5
  NoOpenOverItems = 1 shl 6
  AnyPopupId = 1 shl 7
  AnyPopupLevel = 1 shl 8
  AnyPopup = ImGuiPopupFlag.AnyPopupId.int or
             ImGuiPopupFlag.AnyPopupLevel.int

implementFlags(ImGuiComboFlag, ImGuiComboFlags):
  PopupAlignLeft = 1 shl 0
  HeightSmall = 1 shl 1
  HeightRegular = 1 shl 2
  HeightLarge = 1 shl 3
  HeightLargest = 1 shl 4
  NoArrowButton = 1 shl 5
  NoPreview = 1 shl 6

implementFlags(ImGuiTabBarFlag, ImGuiTabBarFlags):
  Reorderable = 1 shl 0
  AutoSelectNewTabs = 1 shl 1
  TabListPopupButton = 1 shl 2
  NoCloseWithMiddleMouseButton = 1 shl 3
  NoTabListScrollingButtons = 1 shl 4
  NoTooltip = 1 shl 5
  FittingPolicyResizeDown = 1 shl 6
  FittingPolicyScroll = 1 shl 7
  DockNode = 1 shl 20
  IsFocused = 1 shl 21
  SaveSettings = 1 shl 22

implementFlags(ImGuiTabItemFlag, ImGuiTabItemFlags):
  UnsavedDocument = 1 shl 0
  SetSelected = 1 shl 1
  NoCloseWithMiddleMouseButton = 1 shl 2
  NoPushId = 1 shl 3
  NoTooltip = 1 shl 4
  NoReorder = 1 shl 5
  Leading = 1 shl 6
  Trailing = 1 shl 7
  NoCloseButton = 1 shl 20
  Button = 1 shl 21

implementFlags(ImGuiTableFlag, ImGuiTableFlags):
  Resizable = 1 shl 0
  Reorderable = 1 shl 1
  Hideable = 1 shl 2
  Sortable = 1 shl 3
  NoSavedSettings = 1 shl 4
  ContextMenuInBody = 1 shl 5
  RowBg = 1 shl 6
  BordersInnerH = 1 shl 7
  BordersOuterH = 1 shl 8
  BordersH = ImGuiTableFlag.BordersInnerH.int or
             ImGuiTableFlag.BordersOuterH.int
  BordersInnerV = 1 shl 9
  BordersInner = ImGuiTableFlag.BordersInnerV.int or
                 ImGuiTableFlag.BordersInnerH.int
  BordersOuterV = 1 shl 10
  BordersOuter = ImGuiTableFlag.BordersOuterV.int or
                 ImGuiTableFlag.BordersOuterH.int
  BordersV = ImGuiTableFlag.BordersInnerV.int or
             ImGuiTableFlag.BordersOuterV.int
  Borders = ImGuiTableFlag.BordersInner.int or
            ImGuiTableFlag.BordersOuter.int
  NoBordersInBody = 1 shl 11
  NoBordersInBodyUntilResize = 1 shl 12
  SizingFixedFit = 1 shl 13
  SizingFixedSame = 2 shl 13
  SizingStretchProp = 3 shl 13
  SizingStretchSame = 4 shl 13
  NoHostExtendX = 1 shl 16
  NoHostExtendY = 1 shl 17
  NoKeepColumnsVisible = 1 shl 18
  PreciseWidths = 1 shl 19
  NoClip = 1 shl 20
  PadOuterX = 1 shl 21
  NoPadOuterX = 1 shl 22
  NoPadInnerX = 1 shl 23
  ScrollX = 1 shl 24
  ScrollY = 1 shl 25
  SortMulti = 1 shl 26
  SortTristate = 1 shl 27

implementFlags(ImGuiTableColumnFlag, ImGuiTableColumnFlags):
  DefaultHide = 1 shl 0
  DefaultSort = 1 shl 1
  WidthStretch = 1 shl 2
  WidthFixed = 1 shl 3
  NoResize = 1 shl 4
  NoReorder = 1 shl 5
  NoHide = 1 shl 6
  NoClip = 1 shl 7
  NoSort = 1 shl 8
  NoSortAscending = 1 shl 9
  NoSortDescending = 1 shl 10
  NoHeaderWidth = 1 shl 11
  PreferSortAscending = 1 shl 12
  PreferSortDescending = 1 shl 13
  IndentEnable = 1 shl 14
  IndentDisable = 1 shl 15
  IsEnabled = 1 shl 20
  IsVisible = 1 shl 21
  IsSorted = 1 shl 22
  IsHovered = 1 shl 23
  NoDirectResize = 1 shl 30

implementFlags(ImGuiTableRowFlag, ImGuiTableRowFlags):
  Headers = 1 shl 0

implementFlags(ImGuiFocusedFlag, ImGuiFocusedFlags):
  ChildWindows = 1 shl 0
  RootWindow = 1 shl 1
  RootAndChildWindows = ImGuiFocusedFlag.RootWindow.int or
                        ImGuiFocusedFlag.ChildWindows.int
  AnyWindow = 1 shl 2

implementFlags(ImGuiHoveredFlag, ImGuiHoveredFlags):
  ChildWindows = 1 shl 0
  RootWindow = 1 shl 1
  RootAndChildWindows = ImGuiHoveredFlag.RootWindow.int or
                        ImGuiHoveredFlag.ChildWindows.int
  AnyWindow = 1 shl 2
  AllowWhenBlockedByPopup = 1 shl 3
  AllowWhenBlockedByActiveItem = 1 shl 5
  AllowWhenOverlapped = 1 shl 6
  RectOnly = ImGuiHoveredFlag.AllowWhenBlockedByPopup.int or
             ImGuiHoveredFlag.AllowWhenBlockedByActiveItem.int or
             ImGuiHoveredFlag.AllowWhenOverlapped.int
  AllowWhenDisabled = 1 shl 7

implementFlags(ImGuiDragDropFlag, ImGuiDragDropFlags):
  SourceNoPreviewTooltip = 1 shl 0
  SourceNoDisableHover = 1 shl 1
  SourceNoHoldToOpenOthers = 1 shl 2
  SourceAllowNullID = 1 shl 3
  SourceExtern = 1 shl 4
  SourceAutoExpirePayload = 1 shl 5
  AcceptBeforeDelivery = 1 shl 10
  AcceptNoDrawDefaultRect = 1 shl 11
  AcceptPeekOnly = ImGuiDragDropFlag.AcceptBeforeDelivery.int or
                   ImGuiDragDropFlag.AcceptNoDrawDefaultRect.int
  AcceptNoPreviewTooltip = 1 shl 12

implementFlags(ImGuiKeyModFlag, ImGuiKeyModFlags):
  Ctrl = 1 shl 0
  Shift = 1 shl 1
  Alt = 1 shl 2
  Super = 1 shl 3

implementFlags(ImGuiConfigFlag, ImGuiConfigFlags):
  NavEnableKeyboard = 1 shl 0
  NavEnableGamepad = 1 shl 1
  NavEnableSetMousePos = 1 shl 2
  NavNoCaptureKeyboard = 1 shl 3
  NoMouse = 1 shl 4
  NoMouseCursorChange = 1 shl 5
  IsSRGB = 1 shl 20
  IsTouchScreen = 1 shl 21

implementFlags(ImGuiBackendFlag, ImGuiBackendFlags):
  HasGamepad = 1 shl 0
  HasMouseCursors = 1 shl 1
  HasSetMousePos = 1 shl 2
  RendererHasVtxOffset = 1 shl 3

implementFlags(ImGuiButtonFlag, ImGuiButtonFlags):
  MouseButtonLeft = 1 shl 0
  MouseButtonRight = 1 shl 1
  MouseButtonMiddle = 1 shl 2
  PressedOnClick = 1 shl 4
  PressedOnClickRelease = 1 shl 5
  PressedOnClickReleaseAnywhere = 1 shl 6
  PressedOnRelease = 1 shl 7
  PressedOnDoubleClick = 1 shl 8
  PressedOnDragDropHold = 1 shl 9
  Repeat = 1 shl 10
  FlattenChildren = 1 shl 11
  AllowItemOverlap = 1 shl 12
  DontClosePopups = 1 shl 13
  Disabled = 1 shl 14
  AlignTextBaseLine = 1 shl 15
  NoKeyModifiers = 1 shl 16
  NoHoldingActiveId = 1 shl 17
  NoNavFocus = 1 shl 18
  NoHoveredOnFocus = 1 shl 19

implementFlags(ImGuiColorEditFlag, ImGuiColorEditFlags):
  NoAlpha = 1 shl 1
  NoPicker = 1 shl 2
  NoOptions = 1 shl 3
  NoSmallPreview = 1 shl 4
  NoInputs = 1 shl 5
  NoTooltip = 1 shl 6
  NoLabel = 1 shl 7
  NoSidePreview = 1 shl 8
  NoDragDrop = 1 shl 9
  NoBorder = 1 shl 10
  AlphaBar = 1 shl 16
  AlphaPreview = 1 shl 17
  AlphaPreviewHalf = 1 shl 18
  HDR = 1 shl 19
  DisplayRGB = 1 shl 20
  DisplayHSV = 1 shl 21
  DisplayHex = 1 shl 22
  Uint8 = 1 shl 23
  Float = 1 shl 24
  PickerHueBar = 1 shl 25
  PickerHueWheel = 1 shl 26
  InputRGB = 1 shl 27
  InputHSV = 1 shl 28

implementFlags(ImGuiSliderFlag, ImGuiSliderFlags):
  AlwaysClamp = 1 shl 4
  Logarithmic = 1 shl 5
  NoRoundToFormat = 1 shl 6
  NoInput = 1 shl 7
  Vertical = 1 shl 20
  ReadOnly = 1 shl 21

implementFlags(ImGuiCondFlag, ImGuiCond):
  Always = 1 shl 0
  Once = 1 shl 1
  FirstUseEver = 1 shl 2
  Appearing = 1 shl 3

implementFlags(ImDrawFlag, ImDrawFlags):
  Closed = 1 shl 0
  RoundCornersTopLeft = 1 shl 4
  RoundCornersTopRight = 1 shl 5
  RoundCornersTop = ImDrawFlag.RoundCornersTopLeft.int or
                    ImDrawFlag.RoundCornersTopRight.int
  RoundCornersBottomLeft = 1 shl 6
  RoundCornersLeft = ImDrawFlag.RoundCornersBottomLeft.int or
                     ImDrawFlag.RoundCornersTopLeft.int
  RoundCornersBottomRight = 1 shl 7
  RoundCornersRight = ImDrawFlag.RoundCornersBottomRight.int or
                      ImDrawFlag.RoundCornersTopRight.int
  RoundCornersBottom = ImDrawFlag.RoundCornersBottomLeft.int or
                       ImDrawFlag.RoundCornersBottomRight.int
  RoundCornersAll = ImDrawFlag.RoundCornersTopLeft.int or
                    ImDrawFlag.RoundCornersTopRight.int or
                    ImDrawFlag.RoundCornersBottomLeft.int or
                    ImDrawFlag.RoundCornersBottomRight.int
  RoundCornersNone = 1 shl 8

implementFlags(ImDrawListFlag, ImDrawListFlags):
  AntiAliasedLines = 1 shl 0
  AntiAliasedLinesUseTex = 1 shl 1
  AntiAliasedFill = 1 shl 2
  AllowVtxOffset = 1 shl 3

implementFlags(ImGuiViewportFlag, ImGuiViewportFlags):
  IsPlatformWindow = 1 shl 0
  IsPlatformMonitor = 1 shl 1
  OwnedByApp = 1 shl 2

implementFlags(ImFontAtlasFlag, ImFontAtlasFlags):
  NoPowerOfTwoHeight = 1 shl 0
  NoMouseCursors = 1 shl 1
  NoBakedLines = 1 shl 2