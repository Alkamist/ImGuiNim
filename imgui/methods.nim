import flags, types, helpers, constructors

###############################################################
# imgui.h
###############################################################

{.push discardable, importcpp, header: "imgui.h".}

proc `[]`*(this: ImVec2; idx: csize_t): cfloat {.noSideEffect.}
proc `[]`*(this: var ImVec2; idx: csize_t): var cfloat

proc empty*[T](this: ImVector[T]): bool {.noSideEffect.}
proc size*[T](this: ImVector[T]): cint {.noSideEffect.}
proc size_in_bytes*[T](this: ImVector[T]): cint {.noSideEffect.}
proc max_size*[T](this: ImVector[T]): cint {.noSideEffect.}
proc capacity*[T](this: ImVector[T]): cint {.noSideEffect.}
proc `[]`*[T](this: var ImVector[T]; i: cint): var T
proc `[]`*[T](this: ImVector[T]; i: cint): T {.noSideEffect.}
proc clear*[T](this: var ImVector[T])
proc begin*[T](this: var ImVector[T]): ptr T
proc begin*[T](this: ImVector[T]): ptr T {.noSideEffect.}
proc `end`*[T](this: var ImVector[T]): ptr T
proc `end`*[T](this: ImVector[T]): ptr T {.noSideEffect.}
proc front*[T](this: var ImVector[T]): var T
proc front*[T](this: ImVector[T]): T {.noSideEffect.}
proc back*[T](this: var ImVector[T]): var T
proc back*[T](this: ImVector[T]): T {.noSideEffect.}
proc swap*[T](this: var ImVector[T]; rhs: var ImVector[T])
# proc _grow_capacity*[T](this: ImVector[T]; sz: cint): cint {.noSideEffect.}
proc resize*[T](this: var ImVector[T]; new_size: cint)
proc resize*[T](this: var ImVector[T]; new_size: cint; v: T)
proc shrink*[T](this: var ImVector[T]; new_size: cint)
proc reserve*[T](this: var ImVector[T]; new_capacity: cint)
proc push_back*[T](this: var ImVector[T]; v: T)
proc pop_back*[T](this: var ImVector[T])
proc push_front*[T](this: var ImVector[T]; v: T)
proc erase*[T](this: var ImVector[T]; it: ptr T): ptr T
proc erase*[T](this: var ImVector[T]; it: ptr T; it_last: ptr T): ptr T
proc erase_unsorted*[T](this: var ImVector[T]; it: ptr T): ptr T
proc insert*[T](this: var ImVector[T]; it: ptr T; v: T): ptr T
proc contains*[T](this: ImVector[T]; v: T): bool {.noSideEffect.}
proc find*[T](this: var ImVector[T]; v: T): ptr T
proc find*[T](this: ImVector[T]; v: T): ptr T {.noSideEffect.}
proc find_erase*[T](this: var ImVector[T]; v: T): bool
proc find_erase_unsorted*[T](this: var ImVector[T]; v: T): bool
proc index_from_ptr*[T](this: ImVector[T]; it: ptr T): cint {.noSideEffect.}

proc ScaleAllSizes*(this: var ImGuiStyle; scale_factor: cfloat)

proc AddInputCharacter*(this: var ImGuiIO; c: cuint)
proc AddInputCharacterUTF16*(this: var ImGuiIO; c: ImWchar16)
proc AddInputCharactersUTF8*(this: var ImGuiIO; str: cstring)
proc ClearInputCharacters*(this: var ImGuiIO)

proc DeleteChars*(this: var ImGuiInputTextCallbackData; pos: cint; bytes_count: cint)
proc InsertChars*(this: var ImGuiInputTextCallbackData; pos: cint; text: cstring; text_end: cstring = nil)
proc SelectAll*(this: var ImGuiInputTextCallbackData)
proc ClearSelection*(this: var ImGuiInputTextCallbackData)
proc HasSelection*(this: ImGuiInputTextCallbackData): bool {.noSideEffect.}

proc Clear*(this: var ImGuiPayload)
proc IsDataType*(this: ImGuiPayload; `type`: cstring): bool {.noSideEffect.}
proc IsPreview*(this: ImGuiPayload): bool {.noSideEffect.}
proc IsDelivery*(this: ImGuiPayload): bool {.noSideEffect.}

converter `bool`*(this: ImGuiOnceUponAFrame): bool {.noSideEffect.}

proc Draw*(this: var ImGuiTextFilter; label: cstring = "Filter (inc,-exc)"; width: cfloat = 0.0f): bool
proc PassFilter*(this: ImGuiTextFilter; text: cstring; text_end: cstring = nil): bool {.noSideEffect.}
proc Build*(this: var ImGuiTextFilter)
proc Clear*(this: var ImGuiTextFilter)
proc IsActive*(this: ImGuiTextFilter): bool {.noSideEffect.}

proc empty*(this: ImGuiTextFilterImGuiTextRange): bool {.noSideEffect.}
proc split*(this: ImGuiTextFilterImGuiTextRange; separator: char; `out`: ptr ImVector[ImGuiTextFilterImGuiTextRange]) {.noSideEffect.}

proc `[]`*(this: ImGuiTextBuffer; i: cint): char {.noSideEffect.}
proc begin*(this: ImGuiTextBuffer): cstring {.noSideEffect.}
proc `end`*(this: ImGuiTextBuffer): cstring {.noSideEffect.}
proc size*(this: ImGuiTextBuffer): cint {.noSideEffect.}
proc empty*(this: ImGuiTextBuffer): bool {.noSideEffect.}
proc clear*(this: var ImGuiTextBuffer)
proc reserve*(this: var ImGuiTextBuffer; capacity: cint)
proc c_str*(this: ImGuiTextBuffer): cstring {.noSideEffect.}
proc append*(this: var ImGuiTextBuffer; str: cstring; str_end: cstring = nil)
proc appendf*(this: var ImGuiTextBuffer; fmt: cstring) {.varargs.}
# proc appendfv*(this: var ImGuiTextBuffer; fmt: cstring; args: va_list)

proc Clear*(this: var ImGuiStorage)
proc GetInt*(this: ImGuiStorage; key: ImGuiID; default_val: cint = 0): cint {.noSideEffect.}
proc SetInt*(this: var ImGuiStorage; key: ImGuiID; val: cint)
proc GetBool*(this: ImGuiStorage; key: ImGuiID; default_val: bool = false): bool {.noSideEffect.}
proc SetBool*(this: var ImGuiStorage; key: ImGuiID; val: bool)
proc GetFloat*(this: ImGuiStorage; key: ImGuiID; default_val: cfloat = 0.0f): cfloat {.noSideEffect.}
proc SetFloat*(this: var ImGuiStorage; key: ImGuiID; val: cfloat)
proc GetVoidPtr*(this: ImGuiStorage; key: ImGuiID): pointer {.noSideEffect.}
proc SetVoidPtr*(this: var ImGuiStorage; key: ImGuiID; val: pointer)
proc GetIntRef*(this: var ImGuiStorage; key: ImGuiID; default_val: cint = 0): ptr cint
proc GetBoolRef*(this: var ImGuiStorage; key: ImGuiID; default_val: bool = false): ptr bool
proc GetFloatRef*(this: var ImGuiStorage; key: ImGuiID; default_val: cfloat = 0.0f): ptr cfloat
proc GetVoidPtrRef*(this: var ImGuiStorage; key: ImGuiID; default_val: pointer = nil): ptr pointer
proc SetAllInt*(this: var ImGuiStorage; val: cint)
proc BuildSortByKey*(this: var ImGuiStorage)

proc Begin*(this: var ImGuiListClipper; items_count: cint; items_height: cfloat = -1.0f)
proc End*(this: var ImGuiListClipper)
proc Step*(this: var ImGuiListClipper): bool

converter `ImU32`*(this: ImColor): ImU32 {.noSideEffect.}
converter `ImVec4`*(this: ImColor): ImVec4 {.noSideEffect.}
proc SetHSV*(this: var ImColor; h: cfloat; s: cfloat; v: cfloat; a: cfloat = 1.0f)
proc HSV*(h: cfloat; s: cfloat; v: cfloat; a: cfloat = 1.0f): ImColor

proc GetTexID*(this: ImDrawCmd): ImTextureID {.noSideEffect.}

proc Clear*(this: var ImDrawListSplitter)
proc ClearFreeMemory*(this: var ImDrawListSplitter)
proc Split*(this: var ImDrawListSplitter; draw_list: ptr ImDrawList; count: cint)
proc Merge*(this: var ImDrawListSplitter; draw_list: ptr ImDrawList)
proc SetCurrentChannel*(this: var ImDrawListSplitter; draw_list: ptr ImDrawList; channel_idx: cint)

proc PushClipRect*(this: var ImDrawList; clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: bool = false)
proc PushClipRectFullScreen*(this: var ImDrawList)
proc PopClipRect*(this: var ImDrawList)
proc PushTextureID*(this: var ImDrawList; texture_id: ImTextureID)
proc PopTextureID*(this: var ImDrawList)
proc GetClipRectMin*(this: ImDrawList): ImVec2 {.noSideEffect.}
proc GetClipRectMax*(this: ImDrawList): ImVec2 {.noSideEffect.}
proc AddLine*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; col: ImU32; thickness: cfloat = 1.0f)
proc AddRect*(this: var ImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: cfloat = 0.0f; flags: ImDrawFlags = ImDrawFlags_None; thickness: cfloat = 1.0f)
proc AddRectFilled*(this: var ImDrawList; p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: cfloat = 0.0f; flags: ImDrawFlags = ImDrawFlags_None)
proc AddRectFilledMultiColor*(this: var ImDrawList; p_min: ImVec2; p_max: ImVec2; col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32)
proc AddQuad*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: cfloat = 1.0f)
proc AddQuadFilled*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32)
proc AddTriangle*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: cfloat = 1.0f)
proc AddTriangleFilled*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32)
proc AddCircle*(this: var ImDrawList; center: ImVec2; radius: cfloat; col: ImU32; num_segments: cint = 0; thickness: cfloat = 1.0f)
proc AddCircleFilled*(this: var ImDrawList; center: ImVec2; radius: cfloat; col: ImU32; num_segments: cint = 0)
proc AddNgon*(this: var ImDrawList; center: ImVec2; radius: cfloat; col: ImU32; num_segments: cint; thickness: cfloat = 1.0f)
proc AddNgonFilled*(this: var ImDrawList; center: ImVec2; radius: cfloat; col: ImU32; num_segments: cint)
proc AddText*(this: var ImDrawList; pos: ImVec2; col: ImU32; text_begin: cstring; text_end: cstring = nil)
proc AddText*(this: var ImDrawList; font: ptr ImFont; font_size: cfloat; pos: ImVec2; col: ImU32; text_begin: cstring; text_end: cstring = nil; wrap_width: cfloat = 0.0f; cpu_fine_clip_rect: ptr ImVec4 = nil)
proc AddPolyline*(this: var ImDrawList; points: ptr ImVec2; num_points: cint; col: ImU32; flags: ImDrawFlags; thickness: cfloat)
proc AddConvexPolyFilled*(this: var ImDrawList; points: ptr ImVec2; num_points: cint; col: ImU32)
proc AddBezierCubic*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; col: ImU32; thickness: cfloat; num_segments: cint = 0)
proc AddBezierQuadratic*(this: var ImDrawList; p1: ImVec2; p2: ImVec2; p3: ImVec2; col: ImU32; thickness: cfloat; num_segments: cint = 0)
proc AddImage*(this: var ImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2 = constructImVec2(0, 0); uv_max: ImVec2 = constructImVec2(1, 1); col: ImU32 = IM_COL32_WHITE)
proc AddImageQuad*(this: var ImDrawList; user_texture_id: ImTextureID; p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; uv1: ImVec2 = constructImVec2(0, 0); uv2: ImVec2 = constructImVec2(1, 0); uv3: ImVec2 = constructImVec2(1, 1); uv4: ImVec2 = constructImVec2(0, 1); col: ImU32 = IM_COL32_WHITE)
proc AddImageRounded*(this: var ImDrawList; user_texture_id: ImTextureID; p_min: ImVec2; p_max: ImVec2; uv_min: ImVec2; uv_max: ImVec2; col: ImU32; rounding: cfloat; flags: ImDrawFlags = ImDrawFlags_None)
proc PathClear*(this: var ImDrawList)
proc PathLineTo*(this: var ImDrawList; pos: ImVec2)
proc PathLineToMergeDuplicate*(this: var ImDrawList; pos: ImVec2)
proc PathFillConvex*(this: var ImDrawList; col: ImU32)
proc PathStroke*(this: var ImDrawList; col: ImU32; flags: ImDrawFlags = ImDrawFlags_None; thickness: cfloat = 1.0f)
proc PathArcTo*(this: var ImDrawList; center: ImVec2; radius: cfloat; a_min: cfloat; a_max: cfloat; num_segments: cint = 0)
proc PathArcToFast*(this: var ImDrawList; center: ImVec2; radius: cfloat; a_min_of_12: cint; a_max_of_12: cint)
proc PathBezierCubicCurveTo*(this: var ImDrawList; p2: ImVec2; p3: ImVec2; p4: ImVec2; num_segments: cint = 0)
proc PathBezierQuadraticCurveTo*(this: var ImDrawList; p2: ImVec2; p3: ImVec2; num_segments: cint = 0)
proc PathRect*(this: var ImDrawList; rect_min: ImVec2; rect_max: ImVec2; rounding: cfloat = 0.0f; flags: ImDrawFlags = ImDrawFlags_None)
proc AddCallback*(this: var ImDrawList; callback: ImDrawCallback; callback_data: pointer)
proc AddDrawCmd*(this: var ImDrawList)
proc CloneOutput*(this: ImDrawList): ptr ImDrawList {.noSideEffect.}
proc ChannelsSplit*(this: var ImDrawList; count: cint)
proc ChannelsMerge*(this: var ImDrawList)
proc ChannelsSetCurrent*(this: var ImDrawList; n: cint)
proc PrimReserve*(this: var ImDrawList; idx_count: cint; vtx_count: cint)
proc PrimUnreserve*(this: var ImDrawList; idx_count: cint; vtx_count: cint)
proc PrimRect*(this: var ImDrawList; a: ImVec2; b: ImVec2; col: ImU32)
proc PrimRectUV*(this: var ImDrawList; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; col: ImU32)
proc PrimQuadUV*(this: var ImDrawList; a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32)
proc PrimWriteVtx*(this: var ImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32)
proc PrimWriteIdx*(this: var ImDrawList; idx: ImDrawIdx)
proc PrimVtx*(this: var ImDrawList; pos: ImVec2; uv: ImVec2; col: ImU32)
# proc _ResetForNewFrame*(this: var ImDrawList)
# proc _ClearFreeMemory*(this: var ImDrawList)
# proc _PopUnusedDrawCmd*(this: var ImDrawList)
# proc _OnChangedClipRect*(this: var ImDrawList)
# proc _OnChangedTextureID*(this: var ImDrawList)
# proc _OnChangedVtxOffset*(this: var ImDrawList)
# proc _CalcCircleAutoSegmentCount*(this: ImDrawList; radius: cfloat): cint {.noSideEffect.}
# proc _PathArcToFastEx*(this: var ImDrawList; center: ImVec2; radius: cfloat; a_min_sample: cint; a_max_sample: cint; a_step: cint)
# proc _PathArcToN*(this: var ImDrawList; center: ImVec2; radius: cfloat; a_min: cfloat; a_max: cfloat; num_segments: cint)

proc Clear*(this: var ImDrawData)
proc DeIndexAllBuffers*(this: var ImDrawData)
proc ScaleClipRects*(this: var ImDrawData; fb_scale: ImVec2)

proc Clear*(this: var ImFontGlyphRangesBuilder)
proc GetBit*(this: ImFontGlyphRangesBuilder; n: csize_t): bool {.noSideEffect.}
proc SetBit*(this: var ImFontGlyphRangesBuilder; n: csize_t)
proc AddChar*(this: var ImFontGlyphRangesBuilder; c: ImWchar)
proc AddText*(this: var ImFontGlyphRangesBuilder; text: cstring; text_end: cstring = nil)
proc AddRanges*(this: var ImFontGlyphRangesBuilder; ranges: ptr ImWchar)
proc BuildRanges*(this: var ImFontGlyphRangesBuilder; out_ranges: ptr ImVector[ImWchar])

proc IsPacked*(this: ImFontAtlasCustomRect): bool {.noSideEffect.}

proc AddFont*(this: var ImFontAtlas; font_cfg: ptr ImFontConfig): ptr ImFont
proc AddFontDefault*(this: var ImFontAtlas; font_cfg: ptr ImFontConfig = nil): ptr ImFont
proc AddFontFromFileTTF*(this: var ImFontAtlas; filename: cstring; size_pixels: cfloat; font_cfg: ptr ImFontConfig = nil; glyph_ranges: ptr ImWchar = nil): ptr ImFont
proc AddFontFromMemoryTTF*(this: var ImFontAtlas; font_data: pointer; font_size: cint; size_pixels: cfloat; font_cfg: ptr ImFontConfig = nil; glyph_ranges: ptr ImWchar = nil): ptr ImFont
proc AddFontFromMemoryCompressedTTF*(this: var ImFontAtlas; compressed_font_data: pointer; compressed_font_size: cint; size_pixels: cfloat; font_cfg: ptr ImFontConfig = nil; glyph_ranges: ptr ImWchar = nil): ptr ImFont
proc AddFontFromMemoryCompressedBase85TTF*(this: var ImFontAtlas; compressed_font_data_base85: cstring; size_pixels: cfloat; font_cfg: ptr ImFontConfig = nil; glyph_ranges: ptr ImWchar = nil): ptr ImFont
proc ClearInputData*(this: var ImFontAtlas)
proc ClearTexData*(this: var ImFontAtlas)
proc ClearFonts*(this: var ImFontAtlas)
proc Clear*(this: var ImFontAtlas)
proc Build*(this: var ImFontAtlas): bool
proc GetTexDataAsAlpha8*(this: var ImFontAtlas; out_pixels: ptr ptr cuchar; out_width: ptr cint; out_height: ptr cint; out_bytes_per_pixel: ptr cint = nil)
proc GetTexDataAsRGBA32*(this: var ImFontAtlas; out_pixels: ptr ptr cuchar; out_width: ptr cint; out_height: ptr cint; out_bytes_per_pixel: ptr cint = nil)
proc IsBuilt*(this: ImFontAtlas): bool {.noSideEffect.}
proc SetTexID*(this: var ImFontAtlas; id: ImTextureID)
proc GetGlyphRangesDefault*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesKorean*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesJapanese*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesChineseFull*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesChineseSimplifiedCommon*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesCyrillic*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesThai*(this: var ImFontAtlas): ptr ImWchar
proc GetGlyphRangesVietnamese*(this: var ImFontAtlas): ptr ImWchar
proc AddCustomRectRegular*(this: var ImFontAtlas; width: cint; height: cint): cint
proc AddCustomRectFontGlyph*(this: var ImFontAtlas; font: ptr ImFont; id: ImWchar; width: cint; height: cint; advance_x: cfloat; offset: ImVec2 = constructImVec2(0, 0)): cint
proc GetCustomRectByIndex*(this: var ImFontAtlas; index: cint): ptr ImFontAtlasCustomRect
proc CalcCustomRectUV*(this: ImFontAtlas; rect: ptr ImFontAtlasCustomRect; out_uv_min: ptr ImVec2; out_uv_max: ptr ImVec2) {.noSideEffect.}
proc GetMouseCursorTexData*(this: var ImFontAtlas; cursor: ImGuiMouseCursor; out_offset: ptr ImVec2; out_size: ptr ImVec2; out_uv_border: array[2, ImVec2]; out_uv_fill: array[2, ImVec2]): bool

proc FindGlyph*(this: ImFont; c: ImWchar): ptr ImFontGlyph {.noSideEffect.}
proc FindGlyphNoFallback*(this: ImFont; c: ImWchar): ptr ImFontGlyph {.noSideEffect.}
proc GetCharAdvance*(this: ImFont; c: ImWchar): cfloat {.noSideEffect.}
proc IsLoaded*(this: ImFont): bool {.noSideEffect.}
proc GetDebugName*(this: ImFont): cstring {.noSideEffect.}
proc CalcTextSizeA*(this: ImFont; size: cfloat; max_width: cfloat; wrap_width: cfloat; text_begin: cstring; text_end: cstring = nil; remaining: cstringArray = nil): ImVec2 {.noSideEffect.}
proc CalcWordWrapPositionA*(this: ImFont; scale: cfloat; text: cstring; text_end: cstring; wrap_width: cfloat): cstring {.noSideEffect.}
proc RenderChar*(this: ImFont; draw_list: ptr ImDrawList; size: cfloat; pos: ImVec2; col: ImU32; c: ImWchar) {.noSideEffect.}
proc RenderText*(this: ImFont; draw_list: ptr ImDrawList; size: cfloat; pos: ImVec2; col: ImU32; clip_rect: ImVec4; text_begin: cstring; text_end: cstring; wrap_width: cfloat = 0.0f; cpu_fine_clip: bool = false) {.noSideEffect.}
proc BuildLookupTable*(this: var ImFont)
proc ClearOutputData*(this: var ImFont)
proc GrowIndex*(this: var ImFont; new_size: cint)
proc AddGlyph*(this: var ImFont; src_cfg: ptr ImFontConfig; c: ImWchar; x0: cfloat; y0: cfloat; x1: cfloat; y1: cfloat; u0: cfloat; v0: cfloat; u1: cfloat; v1: cfloat; advance_x: cfloat)
proc AddRemapChar*(this: var ImFont; dst: ImWchar; src: ImWchar; overwrite_dst: bool = true)
proc SetGlyphVisible*(this: var ImFont; c: ImWchar; visible: bool)
proc SetFallbackChar*(this: var ImFont; c: ImWchar)
proc IsGlyphRangeUnused*(this: var ImFont; c_begin: cuint; c_last: cuint): bool

proc GetCenter*(this: ImGuiViewport): ImVec2 {.noSideEffect.}
proc GetWorkCenter*(this: ImGuiViewport): ImVec2 {.noSideEffect.}

{.pop.}

###############################################################
# imgui_internal.h
###############################################################

{.push discardable, importcpp, header: "imgui_internal.h".}

proc GetCenter*(this: ImRect): ImVec2 {.noSideEffect.}
proc GetSize*(this: ImRect): ImVec2 {.noSideEffect.}
proc GetWidth*(this: ImRect): cfloat {.noSideEffect.}
proc GetHeight*(this: ImRect): cfloat {.noSideEffect.}
proc GetArea*(this: ImRect): cfloat {.noSideEffect.}
proc GetTL*(this: ImRect): ImVec2 {.noSideEffect.}
proc GetTR*(this: ImRect): ImVec2 {.noSideEffect.}
proc GetBL*(this: ImRect): ImVec2 {.noSideEffect.}
proc GetBR*(this: ImRect): ImVec2 {.noSideEffect.}
proc Contains*(this: ImRect; p: ImVec2): bool {.noSideEffect.}
proc Contains*(this: ImRect; r: ImRect): bool {.noSideEffect.}
proc Overlaps*(this: ImRect; r: ImRect): bool {.noSideEffect.}
proc Add*(this: var ImRect; p: ImVec2)
proc Add*(this: var ImRect; r: ImRect)
proc Expand*(this: var ImRect; amount: cfloat)
proc Expand*(this: var ImRect; amount: ImVec2)
proc Translate*(this: var ImRect; d: ImVec2)
proc TranslateX*(this: var ImRect; dx: cfloat)
proc TranslateY*(this: var ImRect; dy: cfloat)
proc ClipWith*(this: var ImRect; r: ImRect)
proc ClipWithFull*(this: var ImRect; r: ImRect)
proc Floor*(this: var ImRect)
proc IsInverted*(this: ImRect): bool {.noSideEffect.}
proc ToVec4*(this: ImRect): ImVec4 {.noSideEffect.}

proc ImBitArrayTestBit*(arr: ptr ImU32; n: cint): bool
proc ImBitArrayClearBit*(arr: ptr ImU32; n: cint)
proc ImBitArraySetBit*(arr: ptr ImU32; n: cint)
proc ImBitArraySetBitRange*(arr: ptr ImU32; n: cint; n2: cint)

proc ClearAllBits*[BITCOUNT: static[cint]](this: var ImBitArray[BITCOUNT])
proc SetAllBits*[BITCOUNT: static[cint]](this: var ImBitArray[BITCOUNT])
proc TestBit*[BITCOUNT: static[cint]](this: ImBitArray[BITCOUNT]; n: cint): bool {.noSideEffect.}
proc SetBit*[BITCOUNT: static[cint]](this: var ImBitArray[BITCOUNT]; n: cint)
proc ClearBit*[BITCOUNT: static[cint]](this: var ImBitArray[BITCOUNT]; n: cint)
proc SetBitRange*[BITCOUNT: static[cint]](this: var ImBitArray[BITCOUNT]; n: cint; n2: cint)

proc Create*(this: var ImBitVector; sz: cint)
proc Clear*(this: var ImBitVector)
proc TestBit*(this: ImBitVector; n: cint): bool {.noSideEffect.}
proc SetBit*(this: var ImBitVector; n: cint)
proc ClearBit*(this: var ImBitVector; n: cint)

proc set*[T](this: var ImSpan[T]; data: ptr T; size: cint)
proc set*[T](this: var ImSpan[T]; data: ptr T; data_end: ptr T)
proc size*[T](this: ImSpan[T]): cint {.noSideEffect.}
proc size_in_bytes*[T](this: ImSpan[T]): cint {.noSideEffect.}
proc `[]`*[T](this: var ImSpan[T]; i: cint): var T
proc `[]`*[T](this: ImSpan[T]; i: cint): T {.noSideEffect.}
proc begin*[T](this: var ImSpan[T]): ptr T
proc begin*[T](this: ImSpan[T]): ptr T {.noSideEffect.}
proc `end`*[T](this: var ImSpan[T]): ptr T
proc `end`*[T](this: ImSpan[T]): ptr T {.noSideEffect.}
proc index_from_ptr*[T](this: ImSpan[T]; it: ptr T): cint {.noSideEffect.}

proc Reserve*[CHUNKS: static[cint]](this: var ImSpanAllocator[CHUNKS]; n: cint; sz: csize_t; a: cint = 4)
proc GetArenaSizeInBytes*[CHUNKS: static[cint]](this: var ImSpanAllocator[CHUNKS]): cint
proc SetArenaBasePtr*[CHUNKS: static[cint]](this: var ImSpanAllocator[CHUNKS]; base_ptr: pointer)
proc GetSpanPtrBegin*[CHUNKS: static[cint]](this: var ImSpanAllocator[CHUNKS]; n: cint): pointer
proc GetSpanPtrEnd*[CHUNKS: static[cint]](this: var ImSpanAllocator[CHUNKS]; n: cint): pointer
proc GetSpan*[CHUNKS: static[cint]; T](this: var ImSpanAllocator[CHUNKS]; n: cint; span: ptr ImSpan[T])

proc GetByKey*[T](this: var ImPool[T]; key: ImGuiID): ptr T
proc GetByIndex*[T](this: var ImPool[T]; n: ImPoolIdx): ptr T
proc GetIndex*[T](this: ImPool[T]; p: ptr T): ImPoolIdx {.noSideEffect.}
proc GetOrAddByKey*[T](this: var ImPool[T]; key: ImGuiID): ptr T
proc Contains*[T](this: ImPool[T]; p: ptr T): bool {.noSideEffect.}
proc Clear*[T](this: var ImPool[T])
proc Add*[T](this: var ImPool[T]): ptr T
proc Remove*[T](this: var ImPool[T]; key: ImGuiID; p: ptr T)
proc Remove*[T](this: var ImPool[T]; key: ImGuiID; idx: ImPoolIdx)
proc Reserve*[T](this: var ImPool[T]; capacity: cint)
proc GetSize*[T](this: ImPool[T]): cint {.noSideEffect.}

proc clear*[T](this: var ImChunkStream[T])
proc empty*[T](this: ImChunkStream[T]): bool {.noSideEffect.}
proc size*[T](this: ImChunkStream[T]): cint {.noSideEffect.}
proc alloc_chunk*[T](this: var ImChunkStream[T]; sz: csize_t): ptr T
proc begin*[T](this: var ImChunkStream[T]): ptr T
proc next_chunk*[T](this: var ImChunkStream[T]; p: ptr T): ptr T
proc chunk_size*[T](this: var ImChunkStream[T]; p: ptr T): cint
proc `end`*[T](this: var ImChunkStream[T]): ptr T
proc offset_from_ptr*[T](this: var ImChunkStream[T]; p: ptr T): cint
proc ptr_from_offset*[T](this: var ImChunkStream[T]; off: cint): ptr T
proc swap*[T](this: var ImChunkStream[T]; rhs: var ImChunkStream[T])

proc SetCircleTessellationMaxError*(this: var ImDrawListSharedData; max_error: cfloat)

proc Clear*(this: var ImDrawDataBuilder)
proc ClearFreeMemory*(this: var ImDrawDataBuilder)
proc GetDrawListCount*(this: ImDrawDataBuilder): cint {.noSideEffect.}
proc FlattenIntoSingleLayer*(this: var ImDrawDataBuilder)

proc Update*(this: var ImGuiMenuColumns; count: cint; spacing: cfloat; clear: bool)
proc DeclColumns*(this: var ImGuiMenuColumns; w0: cfloat; w1: cfloat; w2: cfloat): cfloat
proc CalcExtraSpace*(this: ImGuiMenuColumns; avail_w: cfloat): cfloat {.noSideEffect.}

proc ClearText*(this: var ImGuiInputTextState)
proc ClearFreeMemory*(this: var ImGuiInputTextState)
proc GetUndoAvailCount*(this: ImGuiInputTextState): cint {.noSideEffect.}
proc GetRedoAvailCount*(this: ImGuiInputTextState): cint {.noSideEffect.}
proc OnKeyPressed*(this: var ImGuiInputTextState; key: cint)
proc CursorAnimReset*(this: var ImGuiInputTextState)
proc CursorClamp*(this: var ImGuiInputTextState)
proc HasSelection*(this: ImGuiInputTextState): bool {.noSideEffect.}
proc ClearSelection*(this: var ImGuiInputTextState)
proc SelectAll*(this: var ImGuiInputTextState)

proc Clear*(this: var ImGuiNavItemData)

proc ClearFlags*(this: var ImGuiNextWindowData)

proc ClearFlags*(this: var ImGuiNextItemData)

proc CalcWorkRectPos*(this: ImGuiViewportP; off_min: ImVec2): ImVec2 {.noSideEffect.}
proc CalcWorkRectSize*(this: ImGuiViewportP; off_min: ImVec2; off_max: ImVec2): ImVec2 {.noSideEffect.}
proc UpdateWorkRect*(this: var ImGuiViewportP)
proc GetMainRect*(this: ImGuiViewportP): ImRect {.noSideEffect.}
proc GetWorkRect*(this: ImGuiViewportP): ImRect {.noSideEffect.}
proc GetBuildWorkRect*(this: ImGuiViewportP): ImRect {.noSideEffect.}

proc GetName*(this: var ImGuiWindowSettings): cstring

proc SetToCurrentState*(this: var ImGuiStackSizes)
proc CompareWithCurrentState*(this: var ImGuiStackSizes)

proc GetID*(this: var ImGuiWindow; str: cstring; str_end: cstring = nil): ImGuiID
proc GetID*(this: var ImGuiWindow; `ptr`: pointer): ImGuiID
proc GetID*(this: var ImGuiWindow; n: cint): ImGuiID
proc GetIDNoKeepAlive*(this: var ImGuiWindow; str: cstring; str_end: cstring = nil): ImGuiID
proc GetIDNoKeepAlive*(this: var ImGuiWindow; `ptr`: pointer): ImGuiID
proc GetIDNoKeepAlive*(this: var ImGuiWindow; n: cint): ImGuiID
proc GetIDFromRectangle*(this: var ImGuiWindow; r_abs: ImRect): ImGuiID
proc Rect*(this: ImGuiWindow): ImRect {.noSideEffect.}
proc CalcFontSize*(this: ImGuiWindow): cfloat {.noSideEffect.}
proc TitleBarHeight*(this: ImGuiWindow): cfloat {.noSideEffect.}
proc TitleBarRect*(this: ImGuiWindow): ImRect {.noSideEffect.}
proc MenuBarHeight*(this: ImGuiWindow): cfloat {.noSideEffect.}
proc MenuBarRect*(this: ImGuiWindow): ImRect {.noSideEffect.}

proc Backup*(this: var ImGuiLastItemDataBackup)
proc Restore*(this: ImGuiLastItemDataBackup) {.noSideEffect.}

proc GetTabOrder*(this: ImGuiTabBar; tab: ptr ImGuiTabItem): cint {.noSideEffect.}
proc GetTabName*(this: ImGuiTabBar; tab: ptr ImGuiTabItem): cstring {.noSideEffect.}

proc GetColumnSettings*(this: var ImGuiTableSettings): ptr ImGuiTableColumnSettings

proc ImFontAtlasGetBuilderForStbTruetype*(): ptr ImFontBuilderIO
proc ImFontAtlasBuildInit*(atlas: ptr ImFontAtlas)
proc ImFontAtlasBuildSetupFont*(atlas: ptr ImFontAtlas; font: ptr ImFont; font_config: ptr ImFontConfig; ascent: cfloat; descent: cfloat)
proc ImFontAtlasBuildPackCustomRects*(atlas: ptr ImFontAtlas; stbrp_context_opaque: pointer)
proc ImFontAtlasBuildFinish*(atlas: ptr ImFontAtlas)
proc ImFontAtlasBuildRender8bppRectFromString*(atlas: ptr ImFontAtlas; x: cint; y: cint; w: cint; h: cint; in_str: cstring; in_marker_char: char; in_marker_pixel_value: cuchar)
proc ImFontAtlasBuildRender32bppRectFromString*(atlas: ptr ImFontAtlas; x: cint; y: cint; w: cint; h: cint; in_str: cstring; in_marker_char: char; in_marker_pixel_value: cuint)
proc ImFontAtlasBuildMultiplyCalcLookupTable*(out_table: array[256, cuchar]; in_multiply_factor: cfloat)
proc ImFontAtlasBuildMultiplyRectAlpha8*(table: array[256, cuchar]; pixels: ptr cuchar; x: cint; y: cint; w: cint; h: cint; stride: cint)

{.pop.}