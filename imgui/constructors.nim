import flags, types

###############################################################
# imgui.h
###############################################################

{.push importcpp.}

proc constructImVec2*(): ImVec2 {.constructor.}
proc constructImVec2*(x: cfloat; y: cfloat): ImVec2 {.constructor.}

proc constructImVec4*(): ImVec4 {.constructor.}
proc constructImVec4*(x: cfloat; y: cfloat; z: cfloat; w: cfloat): ImVec4 {.constructor.}

proc constructImVector*[T](): ImVector[T] {.constructor.}
proc constructImVector*[T](src: ImVector[T]): ImVector[T] {.constructor.}

proc constructImGuiStyle*(): ImGuiStyle {.constructor.}

proc constructImGuiIO*(): ImGuiIO {.constructor.}

proc constructImGuiInputTextCallbackData*(): ImGuiInputTextCallbackData {.constructor.}

proc constructImGuiPayload*(): ImGuiPayload {.constructor.}

proc constructImGuiTableColumnSortSpecs*(): ImGuiTableColumnSortSpecs {.constructor.}

proc constructImGuiTableSortSpecs*(): ImGuiTableSortSpecs {.constructor.}

proc constructImGuiOnceUponAFrame*(): ImGuiOnceUponAFrame {.constructor.}

proc constructImGuiTextFilter*(default_filter: cstring = ""): ImGuiTextFilter {.constructor.}

proc constructImGuiTextFilterImGuiTextRange*(): ImGuiTextFilterImGuiTextRange {.constructor.}
proc constructImGuiTextFilterImGuiTextRange*(b: cstring; e: cstring): ImGuiTextFilterImGuiTextRange {.constructor.}

proc constructImGuiTextBuffer*(): ImGuiTextBuffer {.constructor.}

proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_i: cint): ImGuiStorageImGuiStoragePair {.constructor.}
proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_f: cfloat): ImGuiStorageImGuiStoragePair {.constructor.}
proc constructImGuiStorageImGuiStoragePair*(key: ImGuiID; val_p: pointer): ImGuiStorageImGuiStoragePair {.constructor.}

proc constructImGuiListClipper*(): ImGuiListClipper {.constructor.}

proc constructImColor*(): ImColor {.constructor.}
proc constructImColor*(r: cint; g: cint; b: cint; a: cint = 255): ImColor {.constructor.}
proc constructImColor*(rgba: ImU32): ImColor {.constructor.}
proc constructImColor*(r: cfloat; g: cfloat; b: cfloat; a: cfloat = 1.0f): ImColor {.constructor.}
proc constructImColor*(col: ImVec4): ImColor {.constructor.}

proc constructImDrawCmd*(): ImDrawCmd {.constructor.}

proc constructImDrawListSplitter*(): ImDrawListSplitter {.constructor.}

proc constructImDrawList*(shared_data: ptr ImDrawListSharedData): ImDrawList {.constructor.}

proc constructImDrawData*(): ImDrawData {.constructor.}

proc constructImFontConfig*(): ImFontConfig {.constructor.}

proc constructImFontGlyphRangesBuilder*(): ImFontGlyphRangesBuilder {.constructor.}

proc constructImFontAtlasCustomRect*(): ImFontAtlasCustomRect {.constructor.}

proc constructImFontAtlas*(): ImFontAtlas {.constructor.}

proc constructImFont*(): ImFont {.constructor.}

proc constructImGuiViewport*(): ImGuiViewport {.constructor.}

{.pop.}

###############################################################
# imgui_internal.h
###############################################################

{.push importcpp.}

proc constructImVec1*(): ImVec1 {.constructor.}
proc constructImVec1*(x: cfloat): ImVec1 {.constructor.}

proc constructImVec2ih*(): ImVec2ih {.constructor.}
proc constructImVec2ih*(x: cshort; y: cshort): ImVec2ih {.constructor.}
proc constructImVec2ih*(rhs: ImVec2): ImVec2ih {.constructor.}

proc constructImRect*(): ImRect {.constructor.}
proc constructImRect*(min: ImVec2; max: ImVec2): ImRect {.constructor.}
proc constructImRect*(v: ImVec4): ImRect {.constructor.}
proc constructImRect*(x1: cfloat; y1: cfloat; x2: cfloat; y2: cfloat): ImRect {.constructor.}

proc constructImBitArray*[BITCOUNT: static[cint]](): ImBitArray[BITCOUNT] {.constructor.}

proc constructImSpan*[T](): ImSpan[T] {.constructor.}
proc constructImSpan*[T](data: ptr T; size: cint): ImSpan[T] {.constructor.}
proc constructImSpan*[T](data: ptr T; data_end: ptr T): ImSpan[T] {.constructor.}

proc constructImSpanAllocator*[CHUNKS: static[cint]](): ImSpanAllocator[CHUNKS] {.constructor.}

proc constructImPool*[T](): ImPool[T] {.constructor.}

proc constructImDrawListSharedData*(): ImDrawListSharedData {.constructor.}

proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: cint): ImGuiStyleMod {.constructor.}
proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: cfloat): ImGuiStyleMod {.constructor.}
proc constructImGuiStyleMod*(idx: ImGuiStyleVar; v: ImVec2): ImGuiStyleMod {.constructor.}

proc constructImGuiMenuColumns*(): ImGuiMenuColumns {.constructor.}

proc constructImGuiInputTextState*(): ImGuiInputTextState {.constructor.}

proc constructImGuiPopupData*(): ImGuiPopupData {.constructor.}

proc constructImGuiNavItemData*(): ImGuiNavItemData {.constructor.}

proc constructImGuiNextWindowData*(): ImGuiNextWindowData {.constructor.}

proc constructImGuiNextItemData*(): ImGuiNextItemData {.constructor.}

proc constructImGuiPtrOrIndex*(`ptr`: pointer): ImGuiPtrOrIndex {.constructor.}
proc constructImGuiPtrOrIndex*(index: cint): ImGuiPtrOrIndex {.constructor.}

proc constructImGuiOldColumnData*(): ImGuiOldColumnData {.constructor.}
proc constructImGuiOldColumns*(): ImGuiOldColumns {.constructor.}

proc constructImGuiViewportP*(): ImGuiViewportP {.constructor.}

proc constructImGuiWindowSettings*(): ImGuiWindowSettings {.constructor.}

proc constructImGuiSettingsHandler*(): ImGuiSettingsHandler {.constructor.}

proc constructImGuiMetricsConfig*(): ImGuiMetricsConfig {.constructor.}

proc constructImGuiStackSizes*(): ImGuiStackSizes {.constructor.}

proc constructImGuiContextHook*(): ImGuiContextHook {.constructor.}

proc constructImGuiContext*(shared_font_atlas: ptr ImFontAtlas): ImGuiContext {.constructor.}

proc constructImGuiWindow*(context: ptr ImGuiContext; name: cstring): ImGuiWindow {.constructor.}

proc constructImGuiLastItemDataBackup*(): ImGuiLastItemDataBackup {.constructor.}

proc constructImGuiTabItem*(): ImGuiTabItem {.constructor.}
proc constructImGuiTabBar*(): ImGuiTabBar {.constructor.}

proc constructImGuiTableColumn*(): ImGuiTableColumn {.constructor.}

proc constructImGuiTable*(): ImGuiTable {.constructor.}

proc constructImGuiTableTempData*(): ImGuiTableTempData {.constructor.}

proc constructImGuiTableColumnSettings*(): ImGuiTableColumnSettings {.constructor.}

proc constructImGuiTableSettings*(): ImGuiTableSettings {.constructor.}

{.pop.}