import enums, flags

{.pragma: imguiType, importcpp, header: "imgui.h".}
{.pragma: imguiInternalType, importcpp, header: "imgui.h".}
{.pragma: imstbTextEditType, importcpp, header: "imstb_textedit.h".}

const
  FLT_MIN* = 1.175494350822288e-38
  FLT_MAX* = 3.402823e38
  IM_UNICODE_CODEPOINT_INVALID* = 0xFFFD
  IM_DRAWLIST_TEX_LINES_WIDTH_MAX* = 63
  IM_DRAWLIST_ARCFAST_TABLE_SIZE* = 48
  IM_DRAWLIST_ARCFAST_SAMPLE_MAX* = IM_DRAWLIST_ARCFAST_TABLE_SIZE
  STB_TEXTEDIT_UNDOSTATECOUNT* = 99
  STB_TEXTEDIT_UNDOCHARCOUNT* = 999

when defined(IMGUI_USE_WCHAR32):
  const
    IM_UNICODE_CODEPOINT_MAX* = 0x10FFFF
else:
  const
    IM_UNICODE_CODEPOINT_MAX* = 0xFFFF

type
  ###############################################################
  # imstb_textedit.h
  ###############################################################

  STB_TEXTEDIT_CHARTYPE* {.imstbTextEditType.} = cint
  STB_TEXTEDIT_POSITIONTYPE* {.imstbTextEditType.} = cint

  StbUndoRecord* {.imstbTextEditType.} = object
    where*: STB_TEXTEDIT_POSITIONTYPE
    insert_length*: STB_TEXTEDIT_POSITIONTYPE
    delete_length*: STB_TEXTEDIT_POSITIONTYPE
    char_storage*: cint

  StbUndoState* {.imstbTextEditType.} = object
    undo_rec*: array[STB_TEXTEDIT_UNDOSTATECOUNT, StbUndoRecord]
    undo_char*: array[STB_TEXTEDIT_UNDOCHARCOUNT, STB_TEXTEDIT_CHARTYPE]
    undo_point*: cshort
    redo_point*: cshort
    undo_char_point*: cint
    redo_char_point*: cint

  STB_TexteditState* {.imstbTextEditType.} = object
    cursor*: cint
    select_start*: cint
    select_end*: cint
    insert_mode*: cuchar
    row_count_per_page*: cint
    cursor_at_end_of_line*: cuchar
    initialized*: cuchar
    has_preferred_x*: cuchar
    single_line*: cuchar
    padding1*: cuchar
    padding2*: cuchar
    padding3*: cuchar
    preferred_x*: cfloat
    undostate*: StbUndoState

  ###############################################################
  # imgui.h
  ###############################################################

  ImTextureID* {.imguiType.} = pointer
  ImGuiID* {.imguiType.} = cuint
  ImGuiMemAllocFunc* {.imguiType.} = proc(sz: csize_t; user_data: pointer): pointer
  ImGuiMemFreeFunc* {.imguiType.} = proc(`ptr`: pointer; user_data: pointer)
  ImWchar16* {.imguiType.} = cushort
  ImWchar32* {.imguiType.} = cuint
  ImWchar* {.imguiType.} = ImWchar32
  ImS8* {.imguiType.} = cchar
  ImU8* {.imguiType.} = cuchar
  ImS16* {.imguiType.} = cshort
  ImU16* {.imguiType.} = cushort
  ImS32* {.imguiType.} = cint
  ImU32* {.imguiType.} = cuint
  ImS64* {.imguiType.} = int64
  ImU64* {.imguiType.} = uint64

  ImVec2* {.imguiType.} = object
    x*: cfloat
    y*: cfloat

  ImVec4* {.imguiType.} = object
    x*: cfloat
    y*: cfloat
    z*: cfloat
    w*: cfloat

  ImVector*[T] {.imguiType.} = object
    Size*: cint
    Capacity*: cint
    Data*: ptr T

  ImVectorvalue_type*[T] {.imguiType.} = T
  ImVectoriterator* {.imguiType.} = ptr ImVectorvalue_type
  ImVectorconst_iterator* {.imguiType.} = ptr ImVectorvalue_type

  ImGuiStyle* {.imguiType.} = object
    Alpha*: cfloat
    WindowPadding*: ImVec2
    WindowRounding*: cfloat
    WindowBorderSize*: cfloat
    WindowMinSize*: ImVec2
    WindowTitleAlign*: ImVec2
    WindowMenuButtonPosition*: ImGuiDir
    ChildRounding*: cfloat
    ChildBorderSize*: cfloat
    PopupRounding*: cfloat
    PopupBorderSize*: cfloat
    FramePadding*: ImVec2
    FrameRounding*: cfloat
    FrameBorderSize*: cfloat
    ItemSpacing*: ImVec2
    ItemInnerSpacing*: ImVec2
    CellPadding*: ImVec2
    TouchExtraPadding*: ImVec2
    IndentSpacing*: cfloat
    ColumnsMinSpacing*: cfloat
    ScrollbarSize*: cfloat
    ScrollbarRounding*: cfloat
    GrabMinSize*: cfloat
    GrabRounding*: cfloat
    LogSliderDeadzone*: cfloat
    TabRounding*: cfloat
    TabBorderSize*: cfloat
    TabMinWidthForCloseButton*: cfloat
    ColorButtonPosition*: ImGuiDir
    ButtonTextAlign*: ImVec2
    SelectableTextAlign*: ImVec2
    DisplayWindowPadding*: ImVec2
    DisplaySafeAreaPadding*: ImVec2
    MouseCursorScale*: cfloat
    AntiAliasedLines*: bool
    AntiAliasedLinesUseTex*: bool
    AntiAliasedFill*: bool
    CurveTessellationTol*: cfloat
    CircleTessellationMaxError*: cfloat
    Colors*: array[ImGuiCol, ImVec4]

  ImFontConfig* {.imguiType.} = object
    FontData*: pointer
    FontDataSize*: cint
    FontDataOwnedByAtlas*: bool
    FontNo*: cint
    SizePixels*: cfloat
    OversampleH*: cint
    OversampleV*: cint
    PixelSnapH*: bool
    GlyphExtraSpacing*: ImVec2
    GlyphOffset*: ImVec2
    GlyphRanges*: ptr ImWchar
    GlyphMinAdvanceX*: cfloat
    GlyphMaxAdvanceX*: cfloat
    MergeMode*: bool
    FontBuilderFlags*: cuint
    RasterizerMultiply*: cfloat
    EllipsisChar*: ImWchar
    Name*: array[40, char]
    DstFont*: ptr ImFont

  ImFontGlyph* {.imguiType.} = object
    Colored* {.bitsize: 1.}: cuint
    Visible* {.bitsize: 1.}: cuint
    Codepoint* {.bitsize: 30.}: cuint
    AdvanceX*: cfloat
    X0*: cfloat
    Y0*: cfloat
    X1*: cfloat
    Y1*: cfloat
    U0*: cfloat
    V0*: cfloat
    U1*: cfloat
    V1*: cfloat

  ImFont* {.imguiType.} = object
    IndexAdvanceX*: ImVector[cfloat]
    FallbackAdvanceX*: cfloat
    FontSize*: cfloat
    IndexLookup*: ImVector[ImWchar]
    Glyphs*: ImVector[ImFontGlyph]
    FallbackGlyph*: ptr ImFontGlyph
    ContainerAtlas*: ptr ImFontAtlas
    ConfigData*: ptr ImFontConfig
    ConfigDataCount*: cshort
    FallbackChar*: ImWchar
    EllipsisChar*: ImWchar
    DirtyLookupTables*: bool
    Scale*: cfloat
    Ascent*: cfloat
    Descent*: cfloat
    MetricsTotalSurface*: cint
    Used4kPagesMap*: array[(IM_UNICODE_CODEPOINT_MAX + 1) div 4096 div 8, ImU8]

  ImFontAtlasCustomRect* {.imguiType.} = object
    Width*: cushort
    Height*: cushort
    X*: cushort
    Y*: cushort
    GlyphID*: cuint
    GlyphAdvanceX*: cfloat
    GlyphOffset*: ImVec2
    Font*: ptr ImFont

  ImFontAtlas* {.imguiType.} = object
    Flags*: ImFontAtlasFlags
    TexID*: ImTextureID
    TexDesiredWidth*: cint
    TexGlyphPadding*: cint
    Locked*: bool
    TexPixelsUseColors*: bool
    TexPixelsAlpha8*: ptr cuchar
    TexPixelsRGBA32*: ptr cuint
    TexWidth*: cint
    TexHeight*: cint
    TexUvScale*: ImVec2
    TexUvWhitePixel*: ImVec2
    Fonts*: ImVector[ptr ImFont]
    CustomRects*: ImVector[ImFontAtlasCustomRect]
    ConfigData*: ImVector[ImFontConfig]
    TexUvLines*: array[IM_DRAWLIST_TEX_LINES_WIDTH_MAX + 1, ImVec4]
    FontBuilderIO*: ptr ImFontBuilderIO
    FontBuilderFlags*: cuint
    PackIdMouseCursors*: cint
    PackIdLines*: cint

  ImGuiIO* {.imguiType.} = object
    ConfigFlags*: ImGuiConfigFlags
    BackendFlags*: ImGuiBackendFlags
    DisplaySize*: ImVec2
    DeltaTime*: cfloat
    IniSavingRate*: cfloat
    IniFilename*: cstring
    LogFilename*: cstring
    MouseDoubleClickTime*: cfloat
    MouseDoubleClickMaxDist*: cfloat
    MouseDragThreshold*: cfloat
    KeyMap*: array[ImGuiKey, cint]
    KeyRepeatDelay*: cfloat
    KeyRepeatRate*: cfloat
    UserData*: pointer
    Fonts*: ptr ImFontAtlas
    FontGlobalScale*: cfloat
    FontAllowUserScaling*: bool
    FontDefault*: ptr ImFont
    DisplayFramebufferScale*: ImVec2
    MouseDrawCursor*: bool
    ConfigMacOSXBehaviors*: bool
    ConfigInputTextCursorBlink*: bool
    ConfigDragClickToInputText*: bool
    ConfigWindowsResizeFromEdges*: bool
    ConfigWindowsMoveFromTitleBarOnly*: bool
    ConfigMemoryCompactTimer*: cfloat
    BackendPlatformName*: cstring
    BackendRendererName*: cstring
    BackendPlatformUserData*: pointer
    BackendRendererUserData*: pointer
    BackendLanguageUserData*: pointer
    GetClipboardTextFn*: proc(user_data: pointer): cstring
    SetClipboardTextFn*: proc(user_data: pointer; text: cstring)
    ClipboardUserData*: pointer
    ImeSetInputScreenPosFn*: proc(x: cint; y: cint)
    ImeWindowHandle*: pointer
    MousePos*: ImVec2
    MouseDown*: array[5, bool]
    MouseWheel*: cfloat
    MouseWheelH*: cfloat
    KeyCtrl*: bool
    KeyShift*: bool
    KeyAlt*: bool
    KeySuper*: bool
    KeysDown*: array[512, bool]
    NavInputs*: array[ImGuiNavInput, cfloat]
    WantCaptureMouse*: bool
    WantCaptureKeyboard*: bool
    WantTextInput*: bool
    WantSetMousePos*: bool
    WantSaveIniSettings*: bool
    NavActive*: bool
    NavVisible*: bool
    Framerate*: cfloat
    MetricsRenderVertices*: cint
    MetricsRenderIndices*: cint
    MetricsRenderWindows*: cint
    MetricsActiveWindows*: cint
    MetricsActiveAllocations*: cint
    MouseDelta*: ImVec2
    KeyMods*: ImGuiKeyModFlags
    MousePosPrev*: ImVec2
    MouseClickedPos*: array[5, ImVec2]
    MouseClickedTime*: array[5, cdouble]
    MouseClicked*: array[5, bool]
    MouseDoubleClicked*: array[5, bool]
    MouseReleased*: array[5, bool]
    MouseDownOwned*: array[5, bool]
    MouseDownWasDoubleClick*: array[5, bool]
    MouseDownDuration*: array[5, cfloat]
    MouseDownDurationPrev*: array[5, cfloat]
    MouseDragMaxDistanceAbs*: array[5, ImVec2]
    MouseDragMaxDistanceSqr*: array[5, cfloat]
    KeysDownDuration*: array[512, cfloat]
    KeysDownDurationPrev*: array[512, cfloat]
    NavInputsDownDuration*: array[ImGuiNavInput, cfloat]
    NavInputsDownDurationPrev*: array[ImGuiNavInput, cfloat]
    PenPressure*: cfloat
    InputQueueSurrogate*: ImWchar16
    InputQueueCharacters*: ImVector[ImWchar]

  ImGuiInputTextCallbackData* {.imguiType.} = object
    EventFlag*: ImGuiInputTextFlags
    Flags*: ImGuiInputTextFlags
    UserData*: pointer
    EventChar*: ImWchar
    EventKey*: ImGuiKey
    Buf*: cstring
    BufTextLen*: cint
    BufSize*: cint
    BufDirty*: bool
    CursorPos*: cint
    SelectionStart*: cint
    SelectionEnd*: cint

  ImGuiSizeCallbackData* {.imguiType.} = object
    UserData*: pointer
    Pos*: ImVec2
    CurrentSize*: ImVec2
    DesiredSize*: ImVec2

  ImGuiInputTextCallback* {.imguiType.} = proc(data: ptr ImGuiInputTextCallbackData): cint
  ImGuiSizeCallback* {.imguiType.} = proc(data: ptr ImGuiSizeCallbackData)

  ImGuiPayload* {.imguiType.} = object
    Data*: pointer
    DataSize*: cint
    SourceId*: ImGuiID
    SourceParentId*: ImGuiID
    DataFrameCount*: cint
    DataType*: array[32 + 1, char]
    Preview*: bool
    Delivery*: bool

  ImGuiTableColumnSortSpecs* {.imguiType.} = object
    ColumnUserID*: ImGuiID
    ColumnIndex*: ImS16
    SortOrder*: ImS16
    SortDirection* {.bitsize: 8.}: ImGuiSortDirection

  ImGuiTableSortSpecs* {.imguiType.} = object
    Specs*: ptr ImGuiTableColumnSortSpecs
    SpecsCount*: cint
    SpecsDirty*: bool

  ImGuiOnceUponAFrame* {.imguiType.} = object
    RefFrame*: cint

  ImGuiTextFilter* {.imguiType.} = object
    InputBuf*: array[256, char]
    Filters*: ImVector[ImGuiTextFilterImGuiTextRange]
    CountGrep*: cint

  ImGuiTextFilterImGuiTextRange* {.imguiType.} = object
    b*: cstring
    e*: cstring

  ImGuiTextBuffer* {.imguiType.} = object
    Buf*: ImVector[char]

  ImGuiStorage* {.imguiType.} = object
    Data*: ImVector[ImGuiStorageImGuiStoragePair]

  ImGuiStorageImGuiStoragePair* {.imguiType.} = object
    key*: ImGuiID

  INNER_C_UNION_imgui_1046* {.imguiType, union.} = object
    val_i*: cint
    val_f*: cfloat
    val_p*: pointer

  ImGuiListClipper* {.imguiType.} = object
    DisplayStart*: cint
    DisplayEnd*: cint
    ItemsCount*: cint
    StepNo*: cint
    ItemsFrozen*: cint
    ItemsHeight*: cfloat
    StartPosY*: cfloat

  ImColor* {.imguiType.} = object
    Value*: ImVec4

  ImDrawCallback* = proc(parent_list: ptr ImDrawList; cmd: ptr ImDrawCmd)
  ImDrawCmd* {.imguiType.} = object
    ClipRect*: ImVec4
    TextureId*: ImTextureID
    VtxOffset*: cuint
    IdxOffset*: cuint
    ElemCount*: cuint
    UserCallback*: ImDrawCallback
    UserCallbackData*: pointer

  ImDrawIdx* {.imguiType.} = cushort
  ImDrawVert* {.imguiType.} = object
    pos*: ImVec2
    uv*: ImVec2
    col*: ImU32

  ImDrawCmdHeader* {.imguiType.} = object
    ClipRect*: ImVec4
    TextureId*: ImTextureID
    VtxOffset*: cuint

  ImDrawChannel* {.imguiType.} = object
    CmdBuffer* {.importc: "_CmdBuffer".}: ImVector[ImDrawCmd]
    IdxBuffer* {.importc: "_IdxBuffer".}: ImVector[ImDrawIdx]

  ImDrawListSplitter* {.imguiType.} = object
    Current* {.importc: "_Current".}: cint
    Count* {.importc: "_Count".}: cint
    Channels* {.importc: "_Channels".}: ImVector[ImDrawChannel]

  ImDrawData* {.imguiType.} = object
    Valid*: bool
    CmdListsCount*: cint
    TotalIdxCount*: cint
    TotalVtxCount*: cint
    CmdLists*: ptr ptr ImDrawList
    DisplayPos*: ImVec2
    DisplaySize*: ImVec2
    FramebufferScale*: ImVec2

  ImDrawList* {.imguiType.} = object
    CmdBuffer*: ImVector[ImDrawCmd]
    IdxBuffer*: ImVector[ImDrawIdx]
    VtxBuffer*: ImVector[ImDrawVert]
    Flags*: ImDrawListFlags
    VtxCurrentIdx* {.importc: "_VtxCurrentIdx".}: cuint
    Data* {.importc: "_Data".}: ptr ImDrawListSharedData
    OwnerName* {.importc: "_OwnerName".}: cstring
    VtxWritePtr* {.importc: "_VtxWritePtr".}: ptr ImDrawVert
    IdxWritePtr* {.importc: "_IdxWritePtr".}: ptr ImDrawIdx
    ClipRectStack* {.importc: "_ClipRectStack".}: ImVector[ImVec4]
    TextureIdStack* {.importc: "_TextureIdStack".}: ImVector[ImTextureID]
    Path* {.importc: "_Path".}: ImVector[ImVec2]
    CmdHeader* {.importc: "_CmdHeader".}: ImDrawCmdHeader
    Splitter* {.importc: "_Splitter".}: ImDrawListSplitter
    FringeScale* {.importc: "_FringeScale".}: cfloat

  ImFontGlyphRangesBuilder* {.imguiType.} = object
    UsedChars*: ImVector[ImU32]

  ImGuiViewport* {.imguiType.} = object of RootObj
    Flags*: ImGuiViewportFlags
    Pos*: ImVec2
    Size*: ImVec2
    WorkPos*: ImVec2
    WorkSize*: ImVec2

  ###############################################################
  # imgui_internal.h
  ###############################################################

  ImGuiErrorLogCallback* {.imguiInternalType.} = proc(user_data: pointer; fmt: cstring) {.varargs.}
  ImFileHandle* {.imguiInternalType.} = pointer

  ImVec1* {.imguiInternalType.} = object
    x*: cfloat

  ImVec2ih* {.imguiInternalType.} = object
    x*: cshort
    y*: cshort

  ImBitVector* {.imguiInternalType.} = object
    Storage*: ImVector[ImU32]

  ImRect* {.imguiInternalType.} = object
    Min*: ImVec2
    Max*: ImVec2

  ImBitArray*[BITCOUNT: static[cint]] {.imguiInternalType.} = object
    Storage*: array[(BITCOUNT + 31) shr 5, ImU32]

  ImSpan*[T] {.imguiInternalType.} = object
    Data*: ptr T
    DataEnd*: ptr T

  ImDrawListSharedData* {.imguiInternalType.} = object
    TexUvWhitePixel*: ImVec2
    Font*: ptr ImFont
    FontSize*: cfloat
    CurveTessellationTol*: cfloat
    CircleSegmentMaxError*: cfloat
    ClipRectFullscreen*: ImVec4
    InitialFlags*: ImDrawListFlags
    ArcFastVtx*: array[IM_DRAWLIST_ARCFAST_TABLE_SIZE, ImVec2]
    ArcFastRadiusCutoff*: cfloat
    CircleSegmentCounts*: array[64, ImU8]
    TexUvLines*: ptr ImVec4

  ImDrawDataBuilder* {.imguiInternalType.} = object
    Layers*: array[2, ImVector[ptr ImDrawList]]

  ImSpanAllocator*[CHUNKS: static[cint]] {.imguiInternalType.} = object
    BasePtr*: cstring
    CurrOff*: cint
    CurrIdx*: cint
    Offsets*: array[CHUNKS, cint]
    Sizes*: array[CHUNKS, cint]

  ImPoolIdx* {.imguiInternalType.} = cint
  ImPool*[T] {.imguiInternalType.} = object
    Buf*: ImVector[T]
    Map*: ImGuiStorage
    FreeIdx*: ImPoolIdx

  ImGuiDataTypeTempStorage* {.imguiInternalType.} = object
    Data*: array[8, ImU8]

  ImGuiDataTypeInfo* {.imguiInternalType.} = object
    Size*: csize_t
    Name*: cstring
    PrintFmt*: cstring
    ScanFmt*: cstring

  ImGuiColorMod* {.imguiInternalType.} = object
    Col*: ImGuiCol
    BackupValue*: ImVec4

  ImGuiStyleMod* {.imguiInternalType.} = object
    VarIdx*: ImGuiStyleVar

  INNER_C_UNION_imgui_internal_337* {.imguiInternalType, union.} = object
    BackupInt*: array[2, cint]
    BackupFloat*: array[2, cfloat]

  ImGuiGroupData* {.imguiInternalType.} = object
    WindowID*: ImGuiID
    BackupCursorPos*: ImVec2
    BackupCursorMaxPos*: ImVec2
    BackupIndent*: ImVec1
    BackupGroupOffset*: ImVec1
    BackupCurrLineSize*: ImVec2
    BackupCurrLineTextBaseOffset*: cfloat
    BackupActiveIdIsAlive*: ImGuiID
    BackupActiveIdPreviousFrameIsAlive*: bool
    BackupHoveredIdIsAlive*: bool
    EmitItem*: bool

  ImGuiMenuColumns* {.imguiInternalType.} = object
    Spacing*: cfloat
    Width*: cfloat
    NextWidth*: cfloat
    Pos*: array[3, cfloat]
    NextWidths*: array[3, cfloat]

  ImGuiInputTextState* {.imguiInternalType.} = object
    ID*: ImGuiID
    CurLenW*: cint
    CurLenA*: cint
    TextW*: ImVector[ImWchar]
    TextA*: ImVector[char]
    InitialTextA*: ImVector[char]
    TextAIsValid*: bool
    BufCapacityA*: cint
    ScrollX*: cfloat
    Stb*: STB_TexteditState
    CursorAnim*: cfloat
    CursorFollow*: bool
    SelectedAllMouseLock*: bool
    Edited*: bool
    Flags*: ImGuiInputTextFlags
    UserCallback*: ImGuiInputTextCallback
    UserCallbackData*: pointer

  ImGuiPopupData* {.imguiInternalType.} = object
    PopupId*: ImGuiID
    Window*: ptr ImGuiWindow
    SourceWindow*: ptr ImGuiWindow
    OpenFrameCount*: cint
    OpenParentId*: ImGuiID
    OpenPopupPos*: ImVec2
    OpenMousePos*: ImVec2

  ImChunkStream*[T] {.imguiInternalType.} = object
    Buf*: ImVector[char]

  ImGuiNavItemData* {.imguiInternalType.} = object
    Window*: ptr ImGuiWindow
    ID*: ImGuiID
    FocusScopeId*: ImGuiID
    RectRel*: ImRect
    DistBox*: cfloat
    DistCenter*: cfloat
    DistAxial*: cfloat

  ImGuiNextWindowData* {.imguiInternalType.} = object
    Flags*: ImGuiNextWindowDataFlags
    PosCond*: ImGuiCond
    SizeCond*: ImGuiCond
    CollapsedCond*: ImGuiCond
    PosVal*: ImVec2
    PosPivotVal*: ImVec2
    SizeVal*: ImVec2
    ContentSizeVal*: ImVec2
    ScrollVal*: ImVec2
    CollapsedVal*: bool
    SizeConstraintRect*: ImRect
    SizeCallback*: ImGuiSizeCallback
    SizeCallbackUserData*: pointer
    BgAlphaVal*: cfloat
    MenuBarOffsetMinVal*: ImVec2

  ImGuiNextItemData* {.imguiInternalType.} = object
    Flags*: ImGuiNextItemDataFlags
    Width*: cfloat
    FocusScopeId*: ImGuiID
    OpenCond*: ImGuiCond
    OpenVal*: bool

  ImGuiShrinkWidthItem* {.imguiInternalType.} = object
    Index*: cint
    Width*: cfloat

  ImGuiPtrOrIndex* {.imguiInternalType.} = object
    Ptr*: pointer
    Index*: cint

  ImGuiOldColumnData* {.imguiInternalType.} = object
    OffsetNorm*: cfloat
    OffsetNormBeforeResize*: cfloat
    Flags*: ImGuiOldColumnFlags
    ClipRect*: ImRect

  ImGuiOldColumns* {.imguiInternalType.} = object
    ID*: ImGuiID
    Flags*: ImGuiOldColumnFlags
    IsFirstFrame*: bool
    IsBeingResized*: bool
    Current*: cint
    Count*: cint
    OffMinX*: cfloat
    OffMaxX*: cfloat
    LineMinY*: cfloat
    LineMaxY*: cfloat
    HostCursorPosY*: cfloat
    HostCursorMaxPosX*: cfloat
    HostInitialClipRect*: ImRect
    HostBackupClipRect*: ImRect
    HostBackupParentWorkRect*: ImRect
    Columns*: ImVector[ImGuiOldColumnData]
    Splitter*: ImDrawListSplitter

  ImGuiViewportP* {.imguiInternalType.} = object of ImGuiViewport
    DrawListsLastFrame*: array[2, cint]
    DrawLists*: array[2, ptr ImDrawList]
    DrawDataP*: ImDrawData
    DrawDataBuilder*: ImDrawDataBuilder
    WorkOffsetMin*: ImVec2
    WorkOffsetMax*: ImVec2
    BuildWorkOffsetMin*: ImVec2
    BuildWorkOffsetMax*: ImVec2

  ImGuiWindowSettings* {.imguiInternalType.} = object
    ID*: ImGuiID
    Pos*: ImVec2ih
    Size*: ImVec2ih
    Collapsed*: bool
    WantApply*: bool

  ImGuiSettingsHandler* {.imguiInternalType.} = object
    TypeName*: cstring
    TypeHash*: ImGuiID
    ClearAllFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler)
    ReadInitFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler)
    ReadOpenFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler;
                     name: cstring): pointer
    ReadLineFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler;
                     entry: pointer; line: cstring)
    ApplyAllFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler)
    WriteAllFn*: proc(ctx: ptr ImGuiContext; handler: ptr ImGuiSettingsHandler;
                     out_buf: ptr ImGuiTextBuffer)
    UserData*: pointer

  ImGuiMetricsConfig* {.imguiInternalType.} = object
    ShowWindowsRects*: bool
    ShowWindowsBeginOrder*: bool
    ShowTablesRects*: bool
    ShowDrawCmdMesh*: bool
    ShowDrawCmdBoundingBoxes*: bool
    ShowWindowsRectsType*: cint
    ShowTablesRectsType*: cint

  ImGuiStackSizes* {.imguiInternalType.} = object
    SizeOfIDStack*: cshort
    SizeOfColorStack*: cshort
    SizeOfStyleVarStack*: cshort
    SizeOfFontStack*: cshort
    SizeOfFocusScopeStack*: cshort
    SizeOfGroupStack*: cshort
    SizeOfBeginPopupStack*: cshort

  ImGuiContextHookCallback* {.imguiInternalType.} = proc(ctx: ptr ImGuiContext; hook: ptr ImGuiContextHook)
  ImGuiContextHook* {.imguiInternalType.} = object
    HookId*: ImGuiID
    Type*: ImGuiContextHookType
    Owner*: ImGuiID
    Callback*: ImGuiContextHookCallback
    UserData*: pointer

  ImGuiContext* {.imguiInternalType.} = object
    Initialized*: bool
    FontAtlasOwnedByContext*: bool
    IO*: ImGuiIO
    Style*: ImGuiStyle
    Font*: ptr ImFont
    FontSize*: cfloat
    FontBaseSize*: cfloat
    DrawListSharedData*: ImDrawListSharedData
    Time*: cdouble
    FrameCount*: cint
    FrameCountEnded*: cint
    FrameCountRendered*: cint
    WithinFrameScope*: bool
    WithinFrameScopeWithImplicitWindow*: bool
    WithinEndChild*: bool
    GcCompactAll*: bool
    TestEngineHookItems*: bool
    TestEngineHookIdInfo*: ImGuiID
    TestEngine*: pointer
    Windows*: ImVector[ptr ImGuiWindow]
    WindowsFocusOrder*: ImVector[ptr ImGuiWindow]
    WindowsTempSortBuffer*: ImVector[ptr ImGuiWindow]
    CurrentWindowStack*: ImVector[ptr ImGuiWindow]
    WindowsById*: ImGuiStorage
    WindowsActiveCount*: cint
    WindowsHoverPadding*: ImVec2
    CurrentWindow*: ptr ImGuiWindow
    HoveredWindow*: ptr ImGuiWindow
    HoveredWindowUnderMovingWindow*: ptr ImGuiWindow
    MovingWindow*: ptr ImGuiWindow
    WheelingWindow*: ptr ImGuiWindow
    WheelingWindowRefMousePos*: ImVec2
    WheelingWindowTimer*: cfloat
    CurrentItemFlags*: ImGuiItemFlags
    HoveredId*: ImGuiID
    HoveredIdPreviousFrame*: ImGuiID
    HoveredIdAllowOverlap*: bool
    HoveredIdUsingMouseWheel*: bool
    HoveredIdPreviousFrameUsingMouseWheel*: bool
    HoveredIdDisabled*: bool
    HoveredIdTimer*: cfloat
    HoveredIdNotActiveTimer*: cfloat
    ActiveId*: ImGuiID
    ActiveIdIsAlive*: ImGuiID
    ActiveIdTimer*: cfloat
    ActiveIdIsJustActivated*: bool
    ActiveIdAllowOverlap*: bool
    ActiveIdNoClearOnFocusLoss*: bool
    ActiveIdHasBeenPressedBefore*: bool
    ActiveIdHasBeenEditedBefore*: bool
    ActiveIdHasBeenEditedThisFrame*: bool
    ActiveIdUsingMouseWheel*: bool
    ActiveIdUsingNavDirMask*: ImU32
    ActiveIdUsingNavInputMask*: ImU32
    ActiveIdUsingKeyInputMask*: ImU64
    ActiveIdClickOffset*: ImVec2
    ActiveIdWindow*: ptr ImGuiWindow
    ActiveIdSource*: ImGuiInputSource
    ActiveIdMouseButton*: cint
    ActiveIdPreviousFrame*: ImGuiID
    ActiveIdPreviousFrameIsAlive*: bool
    ActiveIdPreviousFrameHasBeenEditedBefore*: bool
    ActiveIdPreviousFrameWindow*: ptr ImGuiWindow
    LastActiveId*: ImGuiID
    LastActiveIdTimer*: cfloat
    NextWindowData*: ImGuiNextWindowData
    NextItemData*: ImGuiNextItemData
    ColorStack*: ImVector[ImGuiColorMod]
    StyleVarStack*: ImVector[ImGuiStyleMod]
    FontStack*: ImVector[ptr ImFont]
    FocusScopeStack*: ImVector[ImGuiID]
    ItemFlagsStack*: ImVector[ImGuiItemFlags]
    GroupStack*: ImVector[ImGuiGroupData]
    OpenPopupStack*: ImVector[ImGuiPopupData]
    BeginPopupStack*: ImVector[ImGuiPopupData]
    Viewports*: ImVector[ptr ImGuiViewportP]
    NavWindow*: ptr ImGuiWindow
    NavId*: ImGuiID
    NavFocusScopeId*: ImGuiID
    NavActivateId*: ImGuiID
    NavActivateDownId*: ImGuiID
    NavActivatePressedId*: ImGuiID
    NavInputId*: ImGuiID
    NavJustTabbedId*: ImGuiID
    NavJustMovedToId*: ImGuiID
    NavJustMovedToFocusScopeId*: ImGuiID
    NavJustMovedToKeyMods*: ImGuiKeyModFlags
    NavNextActivateId*: ImGuiID
    NavInputSource*: ImGuiInputSource
    NavScoringRect*: ImRect
    NavScoringCount*: cint
    NavLayer*: ImGuiNavLayer
    NavIdTabCounter*: cint
    NavIdIsAlive*: bool
    NavMousePosDirty*: bool
    NavDisableHighlight*: bool
    NavDisableMouseHover*: bool
    NavAnyRequest*: bool
    NavInitRequest*: bool
    NavInitRequestFromMove*: bool
    NavInitResultId*: ImGuiID
    NavInitResultRectRel*: ImRect
    NavMoveRequest*: bool
    NavMoveRequestFlags*: ImGuiNavMoveFlags
    NavMoveRequestForward*: ImGuiNavForward
    NavMoveRequestKeyMods*: ImGuiKeyModFlags
    NavMoveDir*: ImGuiDir
    NavMoveDirLast*: ImGuiDir
    NavMoveClipDir*: ImGuiDir
    NavMoveResultLocal*: ImGuiNavItemData
    NavMoveResultLocalVisibleSet*: ImGuiNavItemData
    NavMoveResultOther*: ImGuiNavItemData
    NavWrapRequestWindow*: ptr ImGuiWindow
    NavWrapRequestFlags*: ImGuiNavMoveFlags
    NavWindowingTarget*: ptr ImGuiWindow
    NavWindowingTargetAnim*: ptr ImGuiWindow
    NavWindowingListWindow*: ptr ImGuiWindow
    NavWindowingTimer*: cfloat
    NavWindowingHighlightAlpha*: cfloat
    NavWindowingToggleLayer*: bool
    TabFocusRequestCurrWindow*: ptr ImGuiWindow
    TabFocusRequestNextWindow*: ptr ImGuiWindow
    TabFocusRequestCurrCounterRegular*: cint
    TabFocusRequestCurrCounterTabStop*: cint
    TabFocusRequestNextCounterRegular*: cint
    TabFocusRequestNextCounterTabStop*: cint
    TabFocusPressed*: bool
    DimBgRatio*: cfloat
    MouseCursor*: ImGuiMouseCursor
    DragDropActive*: bool
    DragDropWithinSource*: bool
    DragDropWithinTarget*: bool
    DragDropSourceFlags*: ImGuiDragDropFlags
    DragDropSourceFrameCount*: cint
    DragDropMouseButton*: cint
    DragDropPayload*: ImGuiPayload
    DragDropTargetRect*: ImRect
    DragDropTargetId*: ImGuiID
    DragDropAcceptFlags*: ImGuiDragDropFlags
    DragDropAcceptIdCurrRectSurface*: cfloat
    DragDropAcceptIdCurr*: ImGuiID
    DragDropAcceptIdPrev*: ImGuiID
    DragDropAcceptFrameCount*: cint
    DragDropHoldJustPressedId*: ImGuiID
    DragDropPayloadBufHeap*: ImVector[cuchar]
    DragDropPayloadBufLocal*: array[16, cuchar]
    CurrentTable*: ptr ImGuiTable
    CurrentTableStackIdx*: cint
    Tables*: ImPool[ImGuiTable]
    TablesTempDataStack*: ImVector[ImGuiTableTempData]
    TablesLastTimeActive*: ImVector[cfloat]
    DrawChannelsTempMergeBuffer*: ImVector[ImDrawChannel]
    CurrentTabBar*: ptr ImGuiTabBar
    TabBars*: ImPool[ImGuiTabBar]
    CurrentTabBarStack*: ImVector[ImGuiPtrOrIndex]
    ShrinkWidthBuffer*: ImVector[ImGuiShrinkWidthItem]
    LastValidMousePos*: ImVec2
    InputTextState*: ImGuiInputTextState
    InputTextPasswordFont*: ImFont
    TempInputId*: ImGuiID
    ColorEditOptions*: ImGuiColorEditFlags
    ColorEditLastHue*: cfloat
    ColorEditLastSat*: cfloat
    ColorEditLastColor*: array[3, cfloat]
    ColorPickerRef*: ImVec4
    SliderCurrentAccum*: cfloat
    SliderCurrentAccumDirty*: bool
    DragCurrentAccumDirty*: bool
    DragCurrentAccum*: cfloat
    DragSpeedDefaultRatio*: cfloat
    ScrollbarClickDeltaToGrabCenter*: cfloat
    TooltipOverrideCount*: cint
    TooltipSlowDelay*: cfloat
    ClipboardHandlerData*: ImVector[char]
    MenusIdSubmittedThisFrame*: ImVector[ImGuiID]
    PlatformImePos*: ImVec2
    PlatformImeLastPos*: ImVec2
    PlatformLocaleDecimalPoint*: char
    SettingsLoaded*: bool
    SettingsDirtyTimer*: cfloat
    SettingsIniData*: ImGuiTextBuffer
    SettingsHandlers*: ImVector[ImGuiSettingsHandler]
    SettingsWindows*: ImChunkStream[ImGuiWindowSettings]
    SettingsTables*: ImChunkStream[ImGuiTableSettings]
    Hooks*: ImVector[ImGuiContextHook]
    HookIdNext*: ImGuiID
    LogEnabled*: bool
    LogType*: ImGuiLogType
    LogFile*: ImFileHandle
    LogBuffer*: ImGuiTextBuffer
    LogNextPrefix*: cstring
    LogNextSuffix*: cstring
    LogLinePosY*: cfloat
    LogLineFirstItem*: bool
    LogDepthRef*: cint
    LogDepthToExpand*: cint
    LogDepthToExpandDefault*: cint
    DebugItemPickerActive*: bool
    DebugItemPickerBreakId*: ImGuiID
    DebugMetricsConfig*: ImGuiMetricsConfig
    FramerateSecPerFrame*: array[120, cfloat]
    FramerateSecPerFrameIdx*: cint
    FramerateSecPerFrameCount*: cint
    FramerateSecPerFrameAccum*: cfloat
    WantCaptureMouseNextFrame*: cint
    WantCaptureKeyboardNextFrame*: cint
    WantTextInputNextFrame*: cint
    TempBuffer*: array[1024 * 3 + 1, char]

  ImGuiWindowTempData* {.imguiInternalType.} = object
    CursorPos*: ImVec2
    CursorPosPrevLine*: ImVec2
    CursorStartPos*: ImVec2
    CursorMaxPos*: ImVec2
    IdealMaxPos*: ImVec2
    CurrLineSize*: ImVec2
    PrevLineSize*: ImVec2
    CurrLineTextBaseOffset*: cfloat
    PrevLineTextBaseOffset*: cfloat
    Indent*: ImVec1
    ColumnsOffset*: ImVec1
    GroupOffset*: ImVec1
    LastItemId*: ImGuiID
    LastItemStatusFlags*: ImGuiItemStatusFlags
    LastItemRect*: ImRect
    LastItemDisplayRect*: ImRect
    NavLayerCurrent*: ImGuiNavLayer
    NavLayersActiveMask*: cshort
    NavLayersActiveMaskNext*: cshort
    NavFocusScopeIdCurrent*: ImGuiID
    NavHideHighlightOneFrame*: bool
    NavHasScroll*: bool
    MenuBarAppending*: bool
    MenuBarOffset*: ImVec2
    MenuColumns*: ImGuiMenuColumns
    TreeDepth*: cint
    TreeJumpToParentOnPopMask*: ImU32
    ChildWindows*: ImVector[ptr ImGuiWindow]
    StateStorage*: ptr ImGuiStorage
    CurrentColumns*: ptr ImGuiOldColumns
    CurrentTableIdx*: cint
    LayoutType*: ImGuiLayoutType
    ParentLayoutType*: ImGuiLayoutType
    FocusCounterRegular*: cint
    FocusCounterTabStop*: cint
    ItemWidth*: cfloat
    TextWrapPos*: cfloat
    ItemWidthStack*: ImVector[cfloat]
    TextWrapPosStack*: ImVector[cfloat]
    StackSizesOnBegin*: ImGuiStackSizes

  ImGuiWindow* {.imguiInternalType.} = object
    Name*: cstring
    ID*: ImGuiID
    Flags*: ImGuiWindowFlags
    Pos*: ImVec2
    Size*: ImVec2
    SizeFull*: ImVec2
    ContentSize*: ImVec2
    ContentSizeIdeal*: ImVec2
    ContentSizeExplicit*: ImVec2
    WindowPadding*: ImVec2
    WindowRounding*: cfloat
    WindowBorderSize*: cfloat
    NameBufLen*: cint
    MoveId*: ImGuiID
    ChildId*: ImGuiID
    Scroll*: ImVec2
    ScrollMax*: ImVec2
    ScrollTarget*: ImVec2
    ScrollTargetCenterRatio*: ImVec2
    ScrollTargetEdgeSnapDist*: ImVec2
    ScrollbarSizes*: ImVec2
    ScrollbarX*: bool
    ScrollbarY*: bool
    Active*: bool
    WasActive*: bool
    WriteAccessed*: bool
    Collapsed*: bool
    WantCollapseToggle*: bool
    SkipItems*: bool
    Appearing*: bool
    Hidden*: bool
    IsFallbackWindow*: bool
    HasCloseButton*: bool
    ResizeBorderHeld*: cchar
    BeginCount*: cshort
    BeginOrderWithinParent*: cshort
    BeginOrderWithinContext*: cshort
    FocusOrder*: cshort
    PopupId*: ImGuiID
    AutoFitFramesX*: ImS8
    AutoFitFramesY*: ImS8
    AutoFitChildAxises*: ImS8
    AutoFitOnlyGrows*: bool
    AutoPosLastDirection*: ImGuiDir
    HiddenFramesCanSkipItems*: ImS8
    HiddenFramesCannotSkipItems*: ImS8
    HiddenFramesForRenderOnly*: ImS8
    DisableInputsFrames*: ImS8
    SetWindowPosAllowFlags* {.bitsize: 8.}: ImGuiCond
    SetWindowSizeAllowFlags* {.bitsize: 8.}: ImGuiCond
    SetWindowCollapsedAllowFlags* {.bitsize: 8.}: ImGuiCond
    SetWindowPosVal*: ImVec2
    SetWindowPosPivot*: ImVec2
    IDStack*: ImVector[ImGuiID]
    DC*: ImGuiWindowTempData
    OuterRectClipped*: ImRect
    InnerRect*: ImRect
    InnerClipRect*: ImRect
    WorkRect*: ImRect
    ParentWorkRect*: ImRect
    ClipRect*: ImRect
    ContentRegionRect*: ImRect
    HitTestHoleSize*: ImVec2ih
    HitTestHoleOffset*: ImVec2ih
    LastFrameActive*: cint
    LastTimeActive*: cfloat
    ItemWidthDefault*: cfloat
    StateStorage*: ImGuiStorage
    ColumnsStorage*: ImVector[ImGuiOldColumns]
    FontWindowScale*: cfloat
    SettingsOffset*: cint
    DrawList*: ptr ImDrawList
    DrawListInst*: ImDrawList
    ParentWindow*: ptr ImGuiWindow
    RootWindow*: ptr ImGuiWindow
    RootWindowForTitleBarHighlight*: ptr ImGuiWindow
    RootWindowForNav*: ptr ImGuiWindow
    NavLastChildNavWindow*: ptr ImGuiWindow
    NavLastIds*: array[ImGuiNavLayer, ImGuiID]
    NavRectRel*: array[ImGuiNavLayer, ImRect]
    MemoryDrawListIdxCapacity*: cint
    MemoryDrawListVtxCapacity*: cint
    MemoryCompacted*: bool

  ImGuiLastItemDataBackup* {.imguiInternalType.} = object
    LastItemId*: ImGuiID
    LastItemStatusFlags*: ImGuiItemStatusFlags
    LastItemRect*: ImRect
    LastItemDisplayRect*: ImRect

  ImGuiTabItem* {.imguiInternalType.} = object
    ID*: ImGuiID
    Flags*: ImGuiTabItemFlags
    LastFrameVisible*: cint
    LastFrameSelected*: cint
    Offset*: cfloat
    Width*: cfloat
    ContentWidth*: cfloat
    NameOffset*: ImS16
    BeginOrder*: ImS16
    IndexDuringLayout*: ImS16
    WantClose*: bool

  ImGuiTabBar* {.imguiInternalType.} = object
    Tabs*: ImVector[ImGuiTabItem]
    Flags*: ImGuiTabBarFlags
    ID*: ImGuiID
    SelectedTabId*: ImGuiID
    NextSelectedTabId*: ImGuiID
    VisibleTabId*: ImGuiID
    CurrFrameVisible*: cint
    PrevFrameVisible*: cint
    BarRect*: ImRect
    CurrTabsContentsHeight*: cfloat
    PrevTabsContentsHeight*: cfloat
    WidthAllTabs*: cfloat
    WidthAllTabsIdeal*: cfloat
    ScrollingAnim*: cfloat
    ScrollingTarget*: cfloat
    ScrollingTargetDistToVisibility*: cfloat
    ScrollingSpeed*: cfloat
    ScrollingRectMinX*: cfloat
    ScrollingRectMaxX*: cfloat
    ReorderRequestTabId*: ImGuiID
    ReorderRequestOffset*: ImS16
    BeginCount*: ImS8
    WantLayout*: bool
    VisibleTabWasSubmitted*: bool
    TabsAddedNew*: bool
    TabsActiveCount*: ImS16
    LastTabItemIdx*: ImS16
    ItemSpacingY*: cfloat
    FramePadding*: ImVec2
    BackupCursorPos*: ImVec2
    TabsNames*: ImGuiTextBuffer

  ImGuiTableColumnIdx* = ImS8
  ImGuiTableDrawChannelIdx* = ImU8
  ImGuiTableColumn* {.imguiInternalType.} = object
    Flags*: ImGuiTableColumnFlags
    WidthGiven*: cfloat
    MinX*: cfloat
    MaxX*: cfloat
    WidthRequest*: cfloat
    WidthAuto*: cfloat
    StretchWeight*: cfloat
    InitStretchWeightOrWidth*: cfloat
    ClipRect*: ImRect
    UserID*: ImGuiID
    WorkMinX*: cfloat
    WorkMaxX*: cfloat
    ItemWidth*: cfloat
    ContentMaxXFrozen*: cfloat
    ContentMaxXUnfrozen*: cfloat
    ContentMaxXHeadersUsed*: cfloat
    ContentMaxXHeadersIdeal*: cfloat
    NameOffset*: ImS16
    DisplayOrder*: ImGuiTableColumnIdx
    IndexWithinEnabledSet*: ImGuiTableColumnIdx
    PrevEnabledColumn*: ImGuiTableColumnIdx
    NextEnabledColumn*: ImGuiTableColumnIdx
    SortOrder*: ImGuiTableColumnIdx
    DrawChannelCurrent*: ImGuiTableDrawChannelIdx
    DrawChannelFrozen*: ImGuiTableDrawChannelIdx
    DrawChannelUnfrozen*: ImGuiTableDrawChannelIdx
    IsEnabled*: bool
    IsEnabledNextFrame*: bool
    IsVisibleX*: bool
    IsVisibleY*: bool
    IsRequestOutput*: bool
    IsSkipItems*: bool
    IsPreserveWidthAuto*: bool
    NavLayerCurrent*: ImS8
    AutoFitQueue*: ImU8
    CannotSkipItemsQueue*: ImU8
    SortDirection* {.bitsize: 2.}: ImU8
    SortDirectionsAvailCount* {.bitsize: 2.}: ImU8
    SortDirectionsAvailMask* {.bitsize: 4.}: ImU8
    SortDirectionsAvailList*: ImU8

  ImGuiTableCellData* {.imguiInternalType.} = object
    BgColor*: ImU32
    Column*: ImGuiTableColumnIdx

  ImGuiTable* {.imguiInternalType.} = object
    ID*: ImGuiID
    Flags*: ImGuiTableFlags
    RawData*: pointer
    TempData*: ptr ImGuiTableTempData
    Columns*: ImSpan[ImGuiTableColumn]
    DisplayOrderToIndex*: ImSpan[ImGuiTableColumnIdx]
    RowCellData*: ImSpan[ImGuiTableCellData]
    EnabledMaskByDisplayOrder*: ImU64
    EnabledMaskByIndex*: ImU64
    VisibleMaskByIndex*: ImU64
    RequestOutputMaskByIndex*: ImU64
    SettingsLoadedFlags*: ImGuiTableFlags
    SettingsOffset*: cint
    LastFrameActive*: cint
    ColumnsCount*: cint
    CurrentRow*: cint
    CurrentColumn*: cint
    InstanceCurrent*: ImS16
    InstanceInteracted*: ImS16
    RowPosY1*: cfloat
    RowPosY2*: cfloat
    RowMinHeight*: cfloat
    RowTextBaseline*: cfloat
    RowIndentOffsetX*: cfloat
    RowFlags* {.bitsize: 16.}: ImGuiTableRowFlags
    LastRowFlags* {.bitsize: 16.}: ImGuiTableRowFlags
    RowBgColorCounter*: cint
    RowBgColor*: array[2, ImU32]
    BorderColorStrong*: ImU32
    BorderColorLight*: ImU32
    BorderX1*: cfloat
    BorderX2*: cfloat
    HostIndentX*: cfloat
    MinColumnWidth*: cfloat
    OuterPaddingX*: cfloat
    CellPaddingX*: cfloat
    CellPaddingY*: cfloat
    CellSpacingX1*: cfloat
    CellSpacingX2*: cfloat
    LastOuterHeight*: cfloat
    LastFirstRowHeight*: cfloat
    InnerWidth*: cfloat
    ColumnsGivenWidth*: cfloat
    ColumnsAutoFitWidth*: cfloat
    ResizedColumnNextWidth*: cfloat
    ResizeLockMinContentsX2*: cfloat
    RefScale*: cfloat
    OuterRect*: ImRect
    InnerRect*: ImRect
    WorkRect*: ImRect
    InnerClipRect*: ImRect
    BgClipRect*: ImRect
    Bg0ClipRectForDrawCmd*: ImRect
    Bg2ClipRectForDrawCmd*: ImRect
    HostClipRect*: ImRect
    HostBackupInnerClipRect*: ImRect
    OuterWindow*: ptr ImGuiWindow
    InnerWindow*: ptr ImGuiWindow
    ColumnsNames*: ImGuiTextBuffer
    DrawSplitter*: ptr ImDrawListSplitter
    SortSpecs*: ImGuiTableSortSpecs
    SortSpecsCount*: ImGuiTableColumnIdx
    ColumnsEnabledCount*: ImGuiTableColumnIdx
    ColumnsEnabledFixedCount*: ImGuiTableColumnIdx
    DeclColumnsCount*: ImGuiTableColumnIdx
    HoveredColumnBody*: ImGuiTableColumnIdx
    HoveredColumnBorder*: ImGuiTableColumnIdx
    AutoFitSingleColumn*: ImGuiTableColumnIdx
    ResizedColumn*: ImGuiTableColumnIdx
    LastResizedColumn*: ImGuiTableColumnIdx
    HeldHeaderColumn*: ImGuiTableColumnIdx
    ReorderColumn*: ImGuiTableColumnIdx
    ReorderColumnDir*: ImGuiTableColumnIdx
    LeftMostEnabledColumn*: ImGuiTableColumnIdx
    RightMostEnabledColumn*: ImGuiTableColumnIdx
    LeftMostStretchedColumn*: ImGuiTableColumnIdx
    RightMostStretchedColumn*: ImGuiTableColumnIdx
    ContextPopupColumn*: ImGuiTableColumnIdx
    FreezeRowsRequest*: ImGuiTableColumnIdx
    FreezeRowsCount*: ImGuiTableColumnIdx
    FreezeColumnsRequest*: ImGuiTableColumnIdx
    FreezeColumnsCount*: ImGuiTableColumnIdx
    RowCellDataCurrent*: ImGuiTableColumnIdx
    DummyDrawChannel*: ImGuiTableDrawChannelIdx
    Bg2DrawChannelCurrent*: ImGuiTableDrawChannelIdx
    Bg2DrawChannelUnfrozen*: ImGuiTableDrawChannelIdx
    IsLayoutLocked*: bool
    IsInsideRow*: bool
    IsInitializing*: bool
    IsSortSpecsDirty*: bool
    IsUsingHeaders*: bool
    IsContextPopupOpen*: bool
    IsSettingsRequestLoad*: bool
    IsSettingsDirty*: bool
    IsDefaultDisplayOrder*: bool
    IsResetAllRequest*: bool
    IsResetDisplayOrderRequest*: bool
    IsUnfrozenRows*: bool
    IsDefaultSizingPolicy*: bool
    MemoryCompacted*: bool
    HostSkipItems*: bool

  ImGuiTableTempData* {.imguiInternalType.} = object
    TableIndex*: cint
    LastTimeActive*: cfloat
    UserOuterSize*: ImVec2
    DrawSplitter*: ImDrawListSplitter
    SortSpecsSingle*: ImGuiTableColumnSortSpecs
    SortSpecsMulti*: ImVector[ImGuiTableColumnSortSpecs]
    HostBackupWorkRect*: ImRect
    HostBackupParentWorkRect*: ImRect
    HostBackupPrevLineSize*: ImVec2
    HostBackupCurrLineSize*: ImVec2
    HostBackupCursorMaxPos*: ImVec2
    HostBackupColumnsOffset*: ImVec1
    HostBackupItemWidth*: cfloat
    HostBackupItemWidthStackSize*: cint

  ImGuiTableSettings* {.imguiInternalType.} = object
    ID*: ImGuiID
    SaveFlags*: ImGuiTableFlags
    RefScale*: cfloat
    ColumnsCount*: ImGuiTableColumnIdx
    ColumnsCountMax*: ImGuiTableColumnIdx
    WantApply*: bool

  ImGuiTableColumnSettings* {.imguiInternalType.} = object
    WidthOrWeight*: cfloat
    UserID*: ImGuiID
    Index*: ImGuiTableColumnIdx
    DisplayOrder*: ImGuiTableColumnIdx
    SortOrder*: ImGuiTableColumnIdx
    SortDirection* {.bitsize: 2.}: ImU8
    IsEnabled* {.bitsize: 1.}: ImU8
    IsStretch* {.bitsize: 1.}: ImU8

  ImFontBuilderIO* {.imguiInternalType.} = object
    FontBuilder_Build*: proc(atlas: ptr ImFontAtlas): bool