import
  std/[macros, strutils],
  flags, types

macro makeConstructors(n: untyped): untyped =
  for procedure in n:
    var nameStr = procedure.name.strVal
    nameStr.removePrefix("construct")

    procedure.addPragma(ident "constructor")

    procedure.addPragma(
      nnkExprColonExpr.newTree(
        ident "importcpp",
        newStrLitNode(nameStr & "(@)"),
      ),
    )
  n

###############################################################
# imgui.h
###############################################################

makeConstructors:
  proc constructImVec2*(): ImVec2
  proc constructImVec2*(x: cfloat; y: cfloat): ImVec2

  proc constructImVec4*(): ImVec4
  proc constructImVec4*(x: cfloat; y: cfloat; z: cfloat; w: cfloat): ImVec4

  proc constructImVector*[T](): ImVector[T]
  proc constructImVector*[T](src: ImVector[T]): ImVector[T]

  proc constructImGuiStyle*(): ImGuiStyle

  proc constructImGuiIO*(): ImGuiIO

  proc constructImGuiInputTextCallbackData*(): ImGuiInputTextCallbackData

  proc constructImGuiPayload*(): ImGuiPayload

  proc constructImGuiTableColumnSortSpecs*(): ImGuiTableColumnSortSpecs

  proc constructImGuiTableSortSpecs*(): ImGuiTableSortSpecs

  proc constructImGuiOnceUponAFrame*(): ImGuiOnceUponAFrame

  proc constructImGuiTextFilter*(default_filter: cstring = ""): ImGuiTextFilter

  proc constructImGuiTextFilterImGuiTextRange*(): ImGuiTextFilterImGuiTextRange
  proc constructImGuiTextFilterImGuiTextRange*(b: cstring; e: cstring): ImGuiTextFilterImGuiTextRange

  proc constructImGuiTextBuffer*(): ImGuiTextBuffer

  proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_i: cint): ImGuiStorageImGuiStoragePair
  proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_f: cfloat): ImGuiStorageImGuiStoragePair
  proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_p: pointer): ImGuiStorageImGuiStoragePair

  proc constructImGuiListClipper*(): ImGuiListClipper

  proc constructImColor*(): ImColor
  proc constructImColor*(r: cint; g: cint; b: cint; a: cint = 255): ImColor
  proc constructImColor*(rgba: ImU32): ImColor
  proc constructImColor*(r: cfloat; g: cfloat; b: cfloat; a: cfloat = 1.0f): ImColor
  proc constructImColor*(col: ImVec4): ImColor

  proc constructImDrawCmd*(): ImDrawCmd

  proc constructImDrawListSplitter*(): ImDrawListSplitter

  proc constructImDrawList*(shared_data: ptr ImDrawListSharedData): ImDrawList

  proc constructImDrawData*(): ImDrawData

  proc constructImFontConfig*(): ImFontConfig

  proc constructImFontGlyphRangesBuilder*(): ImFontGlyphRangesBuilder

  proc constructImFontAtlasCustomRect*(): ImFontAtlasCustomRect

  proc constructImFontAtlas*(): ImFontAtlas

  proc constructImFont*(): ImFont

  proc constructImGuiViewport*(): ImGuiViewport

###############################################################
# imgui_internal.h
###############################################################

makeConstructors:
  proc constructImVec1*(): ImVec1
  proc constructImVec1*(x: cfloat): ImVec1

  proc constructImVec2ih*(): ImVec2ih
  proc constructImVec2ih*(x: cshort; y: cshort): ImVec2ih
  proc constructImVec2ih*(rhs: ImVec2): ImVec2ih

  proc constructImRect*(): ImRect
  proc constructImRect*(min: ImVec2; max: ImVec2): ImRect
  proc constructImRect*(v: ImVec4): ImRect
  proc constructImRect*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat): ImRect

  proc constructImBitArray*[BITCOUNT: static[cint]](): ImBitArray[BITCOUNT]

  proc constructImSpan*[T](): ImSpan[T]
  proc constructImSpan*[T](data: ptr T; size: cint): ImSpan[T]
  proc constructImSpan*[T](data: ptr T; data_end: ptr T): ImSpan[T]

  proc constructImSpanAllocator*[CHUNKS: static[cint]](): ImSpanAllocator[CHUNKS]

  proc constructImPool*[T](): ImPool[T]

  proc constructImDrawListSharedData*(): ImDrawListSharedData

  proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: cint): ImGuiStyleMod
  proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: cfloat): ImGuiStyleMod
  proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: ImVec2): ImGuiStyleMod

  proc constructImGuiMenuColumns*(): ImGuiMenuColumns

  proc constructImGuiInputTextState*(): ImGuiInputTextState

  proc constructImGuiPopupData*(): ImGuiPopupData

  proc constructImGuiNavItemData*(): ImGuiNavItemData

  proc constructImGuiNextWindowData*(): ImGuiNextWindowData

  proc constructImGuiNextItemData*(): ImGuiNextItemData

  proc constructImGuiPtrOrIndex*(`ptr`: pointer): ImGuiPtrOrIndex
  proc constructImGuiPtrOrIndex*(index: cint): ImGuiPtrOrIndex

  proc constructImGuiOldColumnData*(): ImGuiOldColumnData
  proc constructImGuiOldColumns*(): ImGuiOldColumns

  proc constructImGuiViewportP*(): ImGuiViewportP

  proc constructImGuiWindowSettings*(): ImGuiWindowSettings

  proc constructImGuiSettingsHandler*(): ImGuiSettingsHandler

  proc constructImGuiMetricsConfig*(): ImGuiMetricsConfig

  proc constructImGuiStackSizes*(): ImGuiStackSizes

  proc constructImGuiContextHook*(): ImGuiContextHook

  proc constructImGuiContext*(shared_font_atlas: ptr ImFontAtlas): ImGuiContext

  proc constructImGuiWindow*(context: ptr ImGuiContext; name: cstring): ImGuiWindow

  proc constructImGuiLastItemDataBackup*(): ImGuiLastItemDataBackup

  proc constructImGuiTabItem*(): ImGuiTabItem
  proc constructImGuiTabBar*(): ImGuiTabBar

  proc constructImGuiTableColumn*(): ImGuiTableColumn

  proc constructImGuiTable*(): ImGuiTable

  proc constructImGuiTableTempData*(): ImGuiTableTempData

  proc constructImGuiTableColumnSettings*(): ImGuiTableColumnSettings

  proc constructImGuiTableSettings*(): ImGuiTableSettings