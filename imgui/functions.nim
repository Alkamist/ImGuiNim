import
  std/macros,
  flags, types, constructors

macro withNamespace(namespace: static[string], n: untyped): untyped =
  for procedure in n:
    procedure.addPragma(
      nnkExprColonExpr.newTree(
        ident "importcpp",
        newStrLitNode(namespace & "::" & procedure.name.strVal & "(@)"),
      ),
    )
  n

###############################################################
# imgui.h
###############################################################

# API functions:
{.push discardable, header: "imgui.h".}

withNamespace("ImGui"):
  proc CreateContext*(shared_font_atlas: ptr ImFontAtlas = nil): ptr ImGuiContext
  proc DestroyContext*(ctx: ptr ImGuiContext = nil)
  proc GetCurrentContext*(): ptr ImGuiContext
  proc SetCurrentContext*(ctx: ptr ImGuiContext)
  proc GetIO*(): var ImGuiIO
  proc GetStyle*(): var ImGuiStyle
  proc NewFrame*()
  proc EndFrame*()
  proc Render*()
  proc GetDrawData*(): ptr ImDrawData
  proc ShowDemoWindow*(p_open: ptr bool = nil)
  proc ShowMetricsWindow*(p_open: ptr bool = nil)
  proc ShowAboutWindow*(p_open: ptr bool = nil)
  proc ShowStyleEditor*(`ref`: ptr ImGuiStyle = nil)
  proc ShowStyleSelector*(label: cstring): bool
  proc ShowFontSelector*(label: cstring)
  proc ShowUserGuide*()
  proc GetVersion*(): cstring
  proc StyleColorsDark*(dst: ptr ImGuiStyle = nil)
  proc StyleColorsLight*(dst: ptr ImGuiStyle = nil)
  proc StyleColorsClassic*(dst: ptr ImGuiStyle = nil)
  proc Begin*(name: cstring; p_open: ptr bool = nil; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc End*()
  proc BeginChild*(str_id: cstring; size: ImVec2 = constructImVec2(0, 0); border: bool = false; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc BeginChild*(id: ImGuiID; size: ImVec2 = constructImVec2(0, 0); border: bool = false; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc EndChild*()
  proc IsWindowAppearing*(): bool
  proc IsWindowCollapsed*(): bool
  proc IsWindowFocused*(flags: ImGuiFocusedFlags = ImGuiFocusedFlags_None): bool
  proc IsWindowHovered*(flags: ImGuiHoveredFlags = ImGuiHoveredFlags_None): bool
  proc GetWindowDrawList*(): ptr ImDrawList
  proc GetWindowPos*(): ImVec2
  proc GetWindowSize*(): ImVec2
  proc GetWindowWidth*(): cfloat
  proc GetWindowHeight*(): cfloat
  proc SetNextWindowPos*(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None; pivot: ImVec2 = constructImVec2(0, 0))
  proc SetNextWindowSize*(size: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetNextWindowSizeConstraints*(size_min: ImVec2; size_max: ImVec2; custom_callback: ImGuiSizeCallback = nil; custom_callback_data: pointer = nil)
  proc SetNextWindowContentSize*(size: ImVec2)
  proc SetNextWindowCollapsed*(collapsed: bool; cond: ImGuiCond = ImGuiCond_None)
  proc SetNextWindowFocus*()
  proc SetNextWindowBgAlpha*(alpha: cfloat)
  proc SetWindowPos*(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowSize*(size: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowCollapsed*(collapsed: bool; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowFocus*()
  proc SetWindowFontScale*(scale: cfloat)
  proc SetWindowPos*(name: cstring; pos: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowSize*(name: cstring; size: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowCollapsed*(name: cstring; collapsed: bool; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowFocus*(name: cstring)
  proc GetContentRegionAvail*(): ImVec2
  proc GetContentRegionMax*(): ImVec2
  proc GetWindowContentRegionMin*(): ImVec2
  proc GetWindowContentRegionMax*(): ImVec2
  proc GetWindowContentRegionWidth*(): cfloat
  proc GetScrollX*(): cfloat
  proc GetScrollY*(): cfloat
  proc SetScrollX*(scroll_x: cfloat)
  proc SetScrollY*(scroll_y: cfloat)
  proc GetScrollMaxX*(): cfloat
  proc GetScrollMaxY*(): cfloat
  proc SetScrollHereX*(center_x_ratio: cfloat = 0.5f)
  proc SetScrollHereY*(center_y_ratio: cfloat = 0.5f)
  proc SetScrollFromPosX*(local_x: cfloat; center_x_ratio: cfloat = 0.5f)
  proc SetScrollFromPosY*(local_y: cfloat; center_y_ratio: cfloat = 0.5f)
  proc PushFont*(font: ptr ImFont)
  proc PopFont*()
  proc PushStyleColor*(idx: ImGuiCol; col: ImU32)
  proc PushStyleColor*(idx: ImGuiCol; col: ImVec4)
  proc PopStyleColor*(count: cint = 1)
  proc PushStyleVar*(idx: ImGuiStyleVar; val: cfloat)
  proc PushStyleVar*(idx: ImGuiStyleVar; val: ImVec2)
  proc PopStyleVar*(count: cint = 1)
  proc PushAllowKeyboardFocus*(allow_keyboard_focus: bool)
  proc PopAllowKeyboardFocus*()
  proc PushButtonRepeat*(repeat: bool)
  proc PopButtonRepeat*()
  proc PushItemWidth*(item_width: cfloat)
  proc PopItemWidth*()
  proc SetNextItemWidth*(item_width: cfloat)
  proc CalcItemWidth*(): cfloat
  proc PushTextWrapPos*(wrap_local_pos_x: cfloat = 0.0f)
  proc PopTextWrapPos*()
  proc GetFont*(): ptr ImFont
  proc GetFontSize*(): cfloat
  proc GetFontTexUvWhitePixel*(): ImVec2
  proc GetColorU32*(idx: ImGuiCol; alpha_mul: cfloat = 1.0f): ImU32
  proc GetColorU32*(col: ImVec4): ImU32
  proc GetColorU32*(col: ImU32): ImU32
  proc GetStyleColorVec4*(idx: ImGuiCol): var ImVec4
  proc Separator*()
  proc SameLine*(offset_from_start_x: cfloat = 0.0f; spacing: cfloat = -1.0f)
  proc NewLine*()
  proc Spacing*()
  proc Dummy*(size: ImVec2)
  proc Indent*(indent_w: cfloat = 0.0f)
  proc Unindent*(indent_w: cfloat = 0.0f)
  proc BeginGroup*()
  proc EndGroup*()
  proc GetCursorPos*(): ImVec2
  proc GetCursorPosX*(): cfloat
  proc GetCursorPosY*(): cfloat
  proc SetCursorPos*(local_pos: ImVec2)
  proc SetCursorPosX*(local_x: cfloat)
  proc SetCursorPosY*(local_y: cfloat)
  proc GetCursorStartPos*(): ImVec2
  proc GetCursorScreenPos*(): ImVec2
  proc SetCursorScreenPos*(pos: ImVec2)
  proc AlignTextToFramePadding*()
  proc GetTextLineHeight*(): cfloat
  proc GetTextLineHeightWithSpacing*(): cfloat
  proc GetFrameHeight*(): cfloat
  proc GetFrameHeightWithSpacing*(): cfloat
  proc PushID*(str_id: cstring)
  proc PushID*(str_id_begin: cstring; str_id_end: cstring)
  proc PushID*(ptr_id: pointer)
  proc PushID*(int_id: cint)
  proc PopID*()
  proc GetID*(str_id: cstring): ImGuiID
  proc GetID*(str_id_begin: cstring; str_id_end: cstring): ImGuiID
  proc GetID*(ptr_id: pointer): ImGuiID
  proc TextUnformatted*(text: cstring; text_end: cstring = nil)
  proc Text*(fmt: cstring) {.varargs.}
  # proc TextV*(fmt: cstring; args: va_list)
  proc TextColored*(col: ImVec4; fmt: cstring) {.varargs.}
  # proc TextColoredV*(col: ImVec4; fmt: cstring; args: va_list)
  proc TextDisabled*(fmt: cstring) {.varargs.}
  # proc TextDisabledV*(fmt: cstring; args: va_list)
  proc TextWrapped*(fmt: cstring) {.varargs.}
  # proc TextWrappedV*(fmt: cstring; args: va_list)
  proc LabelText*(label: cstring; fmt: cstring) {.varargs.}
  # proc LabelTextV*(label: cstring; fmt: cstring; args: va_list)
  proc BulletText*(fmt: cstring) {.varargs.}
  # proc BulletTextV*(fmt: cstring; args: va_list)
  proc Button*(label: cstring; size: ImVec2 = constructImVec2(0, 0)): bool
  proc SmallButton*(label: cstring): bool
  proc InvisibleButton*(str_id: cstring; size: ImVec2; flags: ImGuiButtonFlags = ImGuiButtonFlags_None): bool
  proc ArrowButton*(str_id: cstring; dir: ImGuiDir): bool
  proc Image*(user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2 = constructImVec2(0, 0); uv1: ImVec2 = constructImVec2(1, 1); tint_col: ImVec4 = constructImVec4(1, 1, 1, 1); border_col: ImVec4 = constructImVec4(0, 0, 0, 0))
  proc ImageButton*(user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2 = constructImVec2(0, 0); uv1: ImVec2 = constructImVec2(1, 1); frame_padding: cint = -1; bg_col: ImVec4 = constructImVec4(0, 0, 0, 0); tint_col: ImVec4 = constructImVec4(1, 1, 1, 1)): bool
  proc Checkbox*(label: cstring; v: ptr bool): bool
  proc CheckboxFlags*(label: cstring; flags: ptr cint; flags_value: cint): bool
  proc CheckboxFlags*(label: cstring; flags: ptr cuint; flags_value: cuint): bool
  proc RadioButton*(label: cstring; active: bool): bool
  proc RadioButton*(label: cstring; v: ptr cint; v_button: cint): bool
  proc ProgressBar*(fraction: cfloat; size_arg: ImVec2 = constructImVec2(-FLT_MIN, 0); overlay: cstring = nil)
  proc Bullet*()
  proc BeginCombo*(label: cstring; preview_value: cstring; flags: ImGuiComboFlags = ImGuiComboFlags_None): bool
  proc EndCombo*()
  proc Combo*(label: cstring; current_item: ptr cint; items: ptr cstring; items_count: cint; popup_max_height_in_items: cint = -1): bool
  proc Combo*(label: cstring; current_item: ptr cint; items_separated_by_zeros: cstring; popup_max_height_in_items: cint = -1): bool
  proc Combo*(label: cstring; current_item: ptr cint; items_getter: proc (data: pointer; idx: cint; out_text: cstringArray): bool; data: pointer; items_count: cint; popup_max_height_in_items: cint = -1): bool
  proc DragFloat*(label: cstring; v: ptr cfloat; v_speed: cfloat = 1.0f; v_min: cfloat = 0.0f; v_max: cfloat = 0.0f; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragFloat2*(label: cstring; v: array[2, cfloat]; v_speed: cfloat = 1.0f; v_min: cfloat = 0.0f; v_max: cfloat = 0.0f; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragFloat3*(label: cstring; v: array[3, cfloat]; v_speed: cfloat = 1.0f; v_min: cfloat = 0.0f; v_max: cfloat = 0.0f; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragFloat4*(label: cstring; v: array[4, cfloat]; v_speed: cfloat = 1.0f; v_min: cfloat = 0.0f; v_max: cfloat = 0.0f; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragFloatRange2*(label: cstring; v_current_min: ptr cfloat; v_current_max: ptr cfloat; v_speed: cfloat = 1.0f; v_min: cfloat = 0.0f; v_max: cfloat = 0.0f; format: cstring = "%.3f"; format_max: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragInt*(label: cstring; v: ptr cint; v_speed: cfloat = 1.0f; v_min: cint = 0; v_max: cint = 0; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragInt2*(label: cstring; v: array[2, cint]; v_speed: cfloat = 1.0f; v_min: cint = 0; v_max: cint = 0; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragInt3*(label: cstring; v: array[3, cint]; v_speed: cfloat = 1.0f; v_min: cint = 0; v_max: cint = 0; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragInt4*(label: cstring; v: array[4, cint]; v_speed: cfloat = 1.0f; v_min: cint = 0; v_max: cint = 0; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragIntRange2*(label: cstring; v_current_min: ptr cint; v_current_max: ptr cint; v_speed: cfloat = 1.0f; v_min: cint = 0; v_max: cint = 0; format: cstring = "%d"; format_max: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragScalar*(label: cstring; data_type: ImGuiDataType; p_data: pointer; v_speed: cfloat = 1.0f; p_min: pointer = nil; p_max: pointer = nil; format: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc DragScalarN*(label: cstring; data_type: ImGuiDataType; p_data: pointer; components: cint; v_speed: cfloat = 1.0f; p_min: pointer = nil; p_max: pointer = nil; format: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderFloat*(label: cstring; v: ptr cfloat; v_min: cfloat; v_max: cfloat; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderFloat2*(label: cstring; v: array[2, cfloat]; v_min: cfloat; v_max: cfloat; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderFloat3*(label: cstring; v: array[3, cfloat]; v_min: cfloat; v_max: cfloat; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderFloat4*(label: cstring; v: array[4, cfloat]; v_min: cfloat; v_max: cfloat; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderAngle*(label: cstring; v_rad: ptr cfloat; v_degrees_min: cfloat = -360.0f; v_degrees_max: cfloat = +360.0f; format: cstring = "%.0f deg"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderInt*(label: cstring; v: ptr cint; v_min: cint; v_max: cint; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderInt2*(label: cstring; v: array[2, cint]; v_min: cint; v_max: cint; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderInt3*(label: cstring; v: array[3, cint]; v_min: cint; v_max: cint; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderInt4*(label: cstring; v: array[4, cint]; v_min: cint; v_max: cint; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderScalar*(label: cstring; data_type: ImGuiDataType; p_data: pointer; p_min: pointer; p_max: pointer; format: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc SliderScalarN*(label: cstring; data_type: ImGuiDataType; p_data: pointer; components: cint; p_min: pointer; p_max: pointer; format: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc VSliderFloat*(label: cstring; size: ImVec2; v: ptr cfloat; v_min: cfloat; v_max: cfloat; format: cstring = "%.3f"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc VSliderInt*(label: cstring; size: ImVec2; v: ptr cint; v_min: cint; v_max: cint; format: cstring = "%d"; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc VSliderScalar*(label: cstring; size: ImVec2; data_type: ImGuiDataType; p_data: pointer; p_min: pointer; p_max: pointer; format: cstring = nil; flags: ImGuiSliderFlags = ImGuiSliderFlags_None): bool
  proc InputText*(label: cstring; buf: cstring; buf_size: csize_t; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None; callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): bool
  proc InputTextMultiline*(label: cstring; buf: cstring; buf_size: csize_t; size: ImVec2 = constructImVec2(0, 0); flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None; callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): bool
  proc InputTextWithHint*(label: cstring; hint: cstring; buf: cstring; buf_size: csize_t; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None; callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): bool
  proc InputFloat*(label: cstring; v: ptr cfloat; step: cfloat = 0.0f; step_fast: cfloat = 0.0f; format: cstring = "%.3f"; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputFloat2*(label: cstring; v: array[2, cfloat]; format: cstring = "%.3f"; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputFloat3*(label: cstring; v: array[3, cfloat]; format: cstring = "%.3f"; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputFloat4*(label: cstring; v: array[4, cfloat]; format: cstring = "%.3f"; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputInt*(label: cstring; v: ptr cint; step: cint = 1; step_fast: cint = 100; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputInt2*(label: cstring; v: array[2, cint]; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputInt3*(label: cstring; v: array[3, cint]; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputInt4*(label: cstring; v: array[4, cint]; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputDouble*(label: cstring; v: ptr cdouble; step: cdouble = 0.0; step_fast: cdouble = 0.0; format: cstring = "%.6f"; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputScalar*(label: cstring; data_type: ImGuiDataType; p_data: pointer; p_step: pointer = nil; p_step_fast: pointer = nil; format: cstring = nil; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc InputScalarN*(label: cstring; data_type: ImGuiDataType; p_data: pointer; components: cint; p_step: pointer = nil; p_step_fast: pointer = nil; format: cstring = nil; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None): bool
  proc ColorEdit3*(label: cstring; col: array[3, cfloat]; flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): bool
  proc ColorEdit4*(label: cstring; col: array[4, cfloat]; flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): bool
  proc ColorPicker3*(label: cstring; col: array[3, cfloat]; flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): bool
  proc ColorPicker4*(label: cstring; col: array[4, cfloat]; flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None; ref_col: ptr cfloat = nil): bool
  proc ColorButton*(desc_id: cstring; col: ImVec4; flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None; size: ImVec2 = constructImVec2(0, 0)): bool
  proc SetColorEditOptions*(flags: ImGuiColorEditFlags)
  proc TreeNode*(label: cstring): bool
  proc TreeNode*(str_id: cstring; fmt: cstring): bool {.varargs.}
  proc TreeNode*(ptr_id: pointer; fmt: cstring): bool {.varargs.}
  # proc TreeNodeV*(str_id: cstring; fmt: cstring; args: va_list): bool
  # proc TreeNodeV*(ptr_id: pointer; fmt: cstring; args: va_list): bool
  proc TreeNodeEx*(label: cstring; flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): bool
  proc TreeNodeEx*(str_id: cstring; flags: ImGuiTreeNodeFlags; fmt: cstring): bool {.varargs.}
  proc TreeNodeEx*(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: cstring): bool {.varargs.}
  # proc TreeNodeExV*(str_id: cstring; flags: ImGuiTreeNodeFlags; fmt: cstring; args: va_list): bool
  # proc TreeNodeExV*(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: cstring; args: va_list): bool
  proc TreePush*(str_id: cstring)
  proc TreePush*(ptr_id: pointer = nil)
  proc TreePop*()
  proc GetTreeNodeToLabelSpacing*(): cfloat
  proc CollapsingHeader*(label: cstring; flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): bool
  proc CollapsingHeader*(label: cstring; p_visible: ptr bool; flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): bool
  proc SetNextItemOpen*(is_open: bool; cond: ImGuiCond = ImGuiCond_None)
  proc Selectable*(label: cstring; selected: bool = false; flags: ImGuiSelectableFlags = ImGuiSelectableFlags_None; size: ImVec2 = constructImVec2(0, 0)): bool
  proc Selectable*(label: cstring; p_selected: ptr bool; flags: ImGuiSelectableFlags = ImGuiSelectableFlags_None; size: ImVec2 = constructImVec2(0, 0)): bool
  proc BeginListBox*(label: cstring; size: ImVec2 = constructImVec2(0, 0)): bool
  proc EndListBox*()
  proc ListBox*(label: cstring; current_item: ptr cint; items: ptr cstring; items_count: cint; height_in_items: cint = -1): bool
  proc ListBox*(label: cstring; current_item: ptr cint; items_getter: proc (data: pointer; idx: cint; out_text: cstringArray): bool; data: pointer; items_count: cint; height_in_items: cint = -1): bool
  proc PlotLines*(label: cstring; values: ptr cfloat; values_count: cint; values_offset: cint = 0; overlay_text: cstring = nil; scale_min: cfloat = FLT_MAX; scale_max: cfloat = FLT_MAX; graph_size: ImVec2 = constructImVec2(0, 0); stride: cint = sizeof(cfloat).cint)
  proc PlotLines*(label: cstring; values_getter: proc (data: pointer; idx: cint): cfloat; data: pointer; values_count: cint; values_offset: cint = 0; overlay_text: cstring = nil; scale_min: cfloat = FLT_MAX; scale_max: cfloat = FLT_MAX; graph_size: ImVec2 = constructImVec2(0, 0))
  proc PlotHistogram*(label: cstring; values: ptr cfloat; values_count: cint; values_offset: cint = 0; overlay_text: cstring = nil; scale_min: cfloat = FLT_MAX; scale_max: cfloat = FLT_MAX; graph_size: ImVec2 = constructImVec2(0, 0); stride: cint = sizeof(cfloat).cint)
  proc PlotHistogram*(label: cstring; values_getter: proc (data: pointer; idx: cint): cfloat; data: pointer; values_count: cint; values_offset: cint = 0; overlay_text: cstring = nil; scale_min: cfloat = FLT_MAX; scale_max: cfloat = FLT_MAX; graph_size: ImVec2 = constructImVec2(0, 0))
  proc Value*(prefix: cstring; b: bool)
  proc Value*(prefix: cstring; v: cint)
  proc Value*(prefix: cstring; v: cuint)
  proc Value*(prefix: cstring; v: cfloat; float_format: cstring = nil)
  proc BeginMenuBar*(): bool
  proc EndMenuBar*()
  proc BeginMainMenuBar*(): bool
  proc EndMainMenuBar*()
  proc BeginMenu*(label: cstring; enabled: bool = true): bool
  proc EndMenu*()
  proc MenuItem*(label: cstring; shortcut: cstring = nil; selected: bool = false; enabled: bool = true): bool
  proc MenuItem*(label: cstring; shortcut: cstring; p_selected: ptr bool; enabled: bool = true): bool
  proc BeginTooltip*()
  proc EndTooltip*()
  proc SetTooltip*(fmt: cstring) {.varargs.}
  # proc SetTooltipV*(fmt: cstring; args: va_list)
  proc BeginPopup*(str_id: cstring; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc BeginPopupModal*(name: cstring; p_open: ptr bool = nil; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc EndPopup*()
  proc OpenPopup*(str_id: cstring; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_None)
  proc OpenPopup*(id: ImGuiID; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_None)
  proc OpenPopupOnItemClick*(str_id: cstring = nil; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight)
  proc CloseCurrentPopup*()
  proc BeginPopupContextItem*(str_id: cstring = nil; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): bool
  proc BeginPopupContextWindow*(str_id: cstring = nil; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): bool
  proc BeginPopupContextVoid*(str_id: cstring = nil; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): bool
  proc IsPopupOpen*(str_id: cstring; flags: ImGuiPopupFlags = ImGuiPopupFlags_None): bool
  proc BeginTable*(str_id: cstring; column: cint; flags: ImGuiTableFlags = ImGuiTableFlags_None; outer_size: ImVec2 = constructImVec2(0.0f, 0.0f); inner_width: cfloat = 0.0f): bool
  proc EndTable*()
  proc TableNextRow*(row_flags: ImGuiTableRowFlags = ImGuiTableRowFlags_None; min_row_height: cfloat = 0.0f)
  proc TableNextColumn*(): bool
  proc TableSetColumnIndex*(column_n: cint): bool
  proc TableSetupColumn*(label: cstring; flags: ImGuiTableColumnFlags = ImGuiTableColumnFlags_None; init_width_or_weight: cfloat = 0.0f; user_id: ImGuiID = 0)
  proc TableSetupScrollFreeze*(cols: cint; rows: cint)
  proc TableHeadersRow*()
  proc TableHeader*(label: cstring)
  proc TableGetSortSpecs*(): ptr ImGuiTableSortSpecs
  proc TableGetColumnCount*(): cint
  proc TableGetColumnIndex*(): cint
  proc TableGetRowIndex*(): cint
  proc TableGetColumnName*(column_n: cint = -1): cstring
  proc TableGetColumnFlags*(column_n: cint = -1): ImGuiTableColumnFlags
  proc TableSetColumnEnabled*(column_n: cint; v: bool)
  proc TableSetBgColor*(target: ImGuiTableBgTarget; color: ImU32; column_n: cint = -1)
  proc Columns*(count: cint = 1; id: cstring = nil; border: bool = true)
  proc NextColumn*()
  proc GetColumnIndex*(): cint
  proc GetColumnWidth*(column_index: cint = -1): cfloat
  proc SetColumnWidth*(column_index: cint; width: cfloat)
  proc GetColumnOffset*(column_index: cint = -1): cfloat
  proc SetColumnOffset*(column_index: cint; offset_x: cfloat)
  proc GetColumnsCount*(): cint
  proc BeginTabBar*(str_id: cstring; flags: ImGuiTabBarFlags = ImGuiTabBarFlags_None): bool
  proc EndTabBar*()
  proc BeginTabItem*(label: cstring; p_open: ptr bool = nil; flags: ImGuiTabItemFlags = ImGuiTabItemFlags_None): bool
  proc EndTabItem*()
  proc TabItemButton*(label: cstring; flags: ImGuiTabItemFlags = ImGuiTabItemFlags_None): bool
  proc SetTabItemClosed*(tab_or_docked_window_label: cstring)
  proc LogToTTY*(auto_open_depth: cint = -1)
  proc LogToFile*(auto_open_depth: cint = -1; filename: cstring = nil)
  proc LogToClipboard*(auto_open_depth: cint = -1)
  proc LogFinish*()
  proc LogButtons*()
  proc LogText*(fmt: cstring) {.varargs.}
  # proc LogTextV*(fmt: cstring; args: va_list)
  proc BeginDragDropSource*(flags: ImGuiDragDropFlags = ImGuiDragDropFlags_None): bool
  proc SetDragDropPayload*(`type`: cstring; data: pointer; sz: csize_t; cond: ImGuiCond = ImGuiCond_None): bool
  proc EndDragDropSource*()
  proc BeginDragDropTarget*(): bool
  proc AcceptDragDropPayload*(`type`: cstring; flags: ImGuiDragDropFlags = ImGuiDragDropFlags_None): ptr ImGuiPayload
  proc EndDragDropTarget*()
  proc GetDragDropPayload*(): ptr ImGuiPayload
  proc PushClipRect*(clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: bool)
  proc PopClipRect*()
  proc SetItemDefaultFocus*()
  proc SetKeyboardFocusHere*(offset: cint = 0)
  proc IsItemHovered*(flags: ImGuiHoveredFlags = ImGuiHoveredFlags_None): bool
  proc IsItemActive*(): bool
  proc IsItemFocused*(): bool
  proc IsItemClicked*(mouse_button: ImGuiMouseButton = ImGuiMouseButton_Left): bool
  proc IsItemVisible*(): bool
  proc IsItemEdited*(): bool
  proc IsItemActivated*(): bool
  proc IsItemDeactivated*(): bool
  proc IsItemDeactivatedAfterEdit*(): bool
  proc IsItemToggledOpen*(): bool
  proc IsAnyItemHovered*(): bool
  proc IsAnyItemActive*(): bool
  proc IsAnyItemFocused*(): bool
  proc GetItemRectMin*(): ImVec2
  proc GetItemRectMax*(): ImVec2
  proc GetItemRectSize*(): ImVec2
  proc SetItemAllowOverlap*()
  proc GetMainViewport*(): ptr ImGuiViewport
  proc IsRectVisible*(size: ImVec2): bool
  proc IsRectVisible*(rect_min: ImVec2; rect_max: ImVec2): bool
  proc GetTime*(): cdouble
  proc GetFrameCount*(): cint
  proc GetBackgroundDrawList*(): ptr ImDrawList
  proc GetForegroundDrawList*(): ptr ImDrawList
  proc GetDrawListSharedData*(): ptr ImDrawListSharedData
  proc GetStyleColorName*(idx: ImGuiCol): cstring
  proc SetStateStorage*(storage: ptr ImGuiStorage)
  proc GetStateStorage*(): ptr ImGuiStorage
  proc CalcListClipping*(items_count: cint; items_height: cfloat; out_items_display_start: ptr cint; out_items_display_end: ptr cint)
  proc BeginChildFrame*(id: ImGuiID; size: ImVec2; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): bool
  proc EndChildFrame*()
  proc CalcTextSize*(text: cstring; text_end: cstring = nil; hide_text_after_double_hash: bool = false; wrap_width: cfloat = -1.0f): ImVec2
  proc ColorConvertU32ToFloat4*(`in`: ImU32): ImVec4
  proc ColorConvertFloat4ToU32*(`in`: ImVec4): ImU32
  proc ColorConvertRGBtoHSV*(r: cfloat; g: cfloat; b: cfloat; out_h: var cfloat; out_s: var cfloat; out_v: var cfloat)
  proc ColorConvertHSVtoRGB*(h: cfloat; s: cfloat; v: cfloat; out_r: var cfloat; out_g: var cfloat; out_b: var cfloat)
  proc GetKeyIndex*(imgui_key: ImGuiKey): cint
  proc IsKeyDown*(user_key_index: cint): bool
  proc IsKeyPressed*(user_key_index: cint; repeat: bool = true): bool
  proc IsKeyReleased*(user_key_index: cint): bool
  proc GetKeyPressedAmount*(key_index: cint; repeat_delay: cfloat; rate: cfloat): cint
  proc CaptureKeyboardFromApp*(want_capture_keyboard_value: bool = true)
  proc IsMouseDown*(button: ImGuiMouseButton): bool
  proc IsMouseClicked*(button: ImGuiMouseButton; repeat: bool = false): bool
  proc IsMouseReleased*(button: ImGuiMouseButton): bool
  proc IsMouseDoubleClicked*(button: ImGuiMouseButton): bool
  proc IsMouseHoveringRect*(r_min: ImVec2; r_max: ImVec2; clip: bool = true): bool
  proc IsMousePosValid*(mouse_pos: ptr ImVec2 = nil): bool
  proc IsAnyMouseDown*(): bool
  proc GetMousePos*(): ImVec2
  proc GetMousePosOnOpeningCurrentPopup*(): ImVec2
  proc IsMouseDragging*(button: ImGuiMouseButton; lock_threshold: cfloat = -1.0f): bool
  proc GetMouseDragDelta*(button: ImGuiMouseButton = ImGuiMouseButton_Left; lock_threshold: cfloat = -1.0f): ImVec2
  proc ResetMouseDragDelta*(button: ImGuiMouseButton = ImGuiMouseButton_Left)
  proc GetMouseCursor*(): ImGuiMouseCursor
  proc SetMouseCursor*(cursor_type: ImGuiMouseCursor)
  proc CaptureMouseFromApp*(want_capture_mouse_value: bool = true)
  proc GetClipboardText*(): cstring
  proc SetClipboardText*(text: cstring)
  proc LoadIniSettingsFromDisk*(ini_filename: cstring)
  proc LoadIniSettingsFromMemory*(ini_data: cstring; ini_size: csize_t = 0)
  proc SaveIniSettingsToDisk*(ini_filename: cstring)
  proc SaveIniSettingsToMemory*(out_ini_size: ptr csize_t = nil): cstring
  proc DebugCheckVersionAndDataLayout*(version_str: cstring; sz_io: csize_t; sz_style: csize_t; sz_vec2: csize_t; sz_vec4: csize_t; sz_drawvert: csize_t; sz_drawidx: csize_t): bool
  proc SetAllocatorFunctions*(alloc_func: ImGuiMemAllocFunc; free_func: ImGuiMemFreeFunc; user_data: pointer = nil)
  proc GetAllocatorFunctions*(p_alloc_func: ptr ImGuiMemAllocFunc; p_free_func: ptr ImGuiMemFreeFunc; p_user_data: ptr pointer)
  proc MemAlloc*(size: csize_t): pointer
  proc MemFree*(`ptr`: pointer)

{.pop.}

###############################################################
# imgui_internal.h
###############################################################

# Regular and inline functions:
{.push discardable, importc, header: "imgui.h".}

proc ImHashData*(data: pointer; data_size: csize_t; seed: ImU32 = 0): ImGuiID
proc ImHashStr*(data: cstring; data_size: csize_t = 0; seed: ImU32 = 0): ImGuiID
proc ImAlphaBlendColors*(col_a: ImU32; col_b: ImU32): ImU32
proc ImIsPowerOfTwo*(v: cint): bool
proc ImIsPowerOfTwo*(v: ImU64): bool
proc ImUpperPowerOfTwo*(v: cint): cint
proc ImStricmp*(str1: cstring; str2: cstring): cint
proc ImStrnicmp*(str1: cstring; str2: cstring; count: csize_t): cint
proc ImStrncpy*(dst: cstring; src: cstring; count: csize_t)
proc ImStrdup*(str: cstring): cstring
proc ImStrdupcpy*(dst: cstring; p_dst_size: ptr csize_t; str: cstring): cstring
proc ImStrchrRange*(str_begin: cstring; str_end: cstring; c: char): cstring
proc ImStrlenW*(str: ptr ImWchar): cint
proc ImStreolRange*(str: cstring; str_end: cstring): cstring
proc ImStrbolW*(buf_mid_line: ptr ImWchar; buf_begin: ptr ImWchar): ptr ImWchar
proc ImStristr*(haystack: cstring; haystack_end: cstring; needle: cstring; needle_end: cstring): cstring
proc ImStrTrimBlanks*(str: cstring)
proc ImStrSkipBlank*(str: cstring): cstring
proc ImFormatString*(buf: cstring; buf_size: csize_t; fmt: cstring): cint {.varargs.}
# proc ImFormatStringV*(buf: cstring; buf_size: csize_t; fmt: cstring; args: va_list): cint
proc ImParseFormatFindStart*(format: cstring): cstring
proc ImParseFormatFindEnd*(format: cstring): cstring
proc ImParseFormatTrimDecorations*(format: cstring; buf: cstring; buf_size: csize_t): cstring
proc ImParseFormatPrecision*(format: cstring; default_value: cint): cint
proc ImCharIsBlankA*(c: char): bool
proc ImCharIsBlankW*(c: cuint): bool
proc ImTextStrToUtf8*(buf: cstring; buf_size: cint; in_text: ptr ImWchar; in_text_end: ptr ImWchar): cint
proc ImTextCharFromUtf8*(out_char: ptr cuint; in_text: cstring; in_text_end: cstring): cint
proc ImTextStrFromUtf8*(buf: ptr ImWchar; buf_size: cint; in_text: cstring; in_text_end: cstring; in_remaining: cstringArray = nil): cint
proc ImTextCountCharsFromUtf8*(in_text: cstring; in_text_end: cstring): cint
proc ImTextCountUtf8BytesFromChar*(in_text: cstring; in_text_end: cstring): cint
proc ImTextCountUtf8BytesFromStr*(in_text: ptr ImWchar; in_text_end: ptr ImWchar): cint
proc `*`*(lhs: ImVec2; rhs: cfloat): ImVec2
proc `/`*(lhs: ImVec2; rhs: cfloat): ImVec2
proc `+`*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc `-`*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc `*`*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc `/`*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc `*=`*(lhs: var ImVec2; rhs: cfloat)
proc `/=`*(lhs: var ImVec2; rhs: cfloat)
proc `+=`*(lhs: var ImVec2; rhs: ImVec2)
proc `-=`*(lhs: var ImVec2; rhs: ImVec2)
proc `*=`*(lhs: var ImVec2; rhs: ImVec2)
proc `/=`*(lhs: var ImVec2; rhs: ImVec2)
proc `+`*(lhs: ImVec4; rhs: ImVec4): ImVec4
proc `-`*(lhs: ImVec4; rhs: ImVec4): ImVec4
proc `*`*(lhs: ImVec4; rhs: ImVec4): ImVec4
proc ImFileOpen*(a1: cstring; a2: cstring): ImFileHandle
proc ImFileClose*(a1: ImFileHandle): bool
proc ImFileGetSize*(a1: ImFileHandle): ImU64
proc ImFileRead*(a1: pointer; a2: ImU64; a3: ImU64; a4: ImFileHandle): ImU64
proc ImFileWrite*(a1: pointer; a2: ImU64; a3: ImU64; a4: ImFileHandle): ImU64
proc ImFileOpen*(filename: cstring; mode: cstring): ImFileHandle
proc ImFileClose*(file: ImFileHandle): bool
proc ImFileGetSize*(file: ImFileHandle): ImU64
proc ImFileRead*(data: pointer; size: ImU64; count: ImU64; file: ImFileHandle): ImU64
proc ImFileWrite*(data: pointer; size: ImU64; count: ImU64; file: ImFileHandle): ImU64
proc ImFileLoadToMemory*(filename: cstring; mode: cstring; out_file_size: ptr csize_t = nil; padding_bytes: cint = 0): pointer
proc ImPow*(x: cfloat; y: cfloat): cfloat
proc ImPow*(x: cdouble; y: cdouble): cdouble
proc ImLog*(x: cfloat): cfloat
proc ImLog*(x: cdouble): cdouble
proc ImAbs*(x: cint): cint
proc ImAbs*(x: cfloat): cfloat
proc ImAbs*(x: cdouble): cdouble
proc ImSign*(x: cfloat): cfloat
proc ImSign*(x: cdouble): cdouble
proc ImMin*[T](lhs: T; rhs: T): T
proc ImMax*[T](lhs: T; rhs: T): T
proc ImClamp*[T](v: T; mn: T; mx: T): T
proc ImLerp*[T](a: T; b: T; t: cfloat): T
proc ImSwap*[T](a: var T; b: var T)
proc ImAddClampOverflow*[T](a: T; b: T; mn: T; mx: T): T
proc ImSubClampOverflow*[T](a: T; b: T; mn: T; mx: T): T
proc ImMin*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc ImMax*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc ImClamp*(v: ImVec2; mn: ImVec2; mx: ImVec2): ImVec2
proc ImLerp*(a: ImVec2; b: ImVec2; t: cfloat): ImVec2
proc ImLerp*(a: ImVec2; b: ImVec2; t: ImVec2): ImVec2
proc ImLerp*(a: ImVec4; b: ImVec4; t: cfloat): ImVec4
proc ImSaturate*(f: cfloat): cfloat
proc ImLengthSqr*(lhs: ImVec2): cfloat
proc ImLengthSqr*(lhs: ImVec4): cfloat
proc ImInvLength*(lhs: ImVec2; fail_value: cfloat): cfloat
proc ImFloor*(f: cfloat): cfloat
proc ImFloorSigned*(f: cfloat): cfloat
proc ImFloor*(v: ImVec2): ImVec2
proc ImModPositive*(a: cint; b: cint): cint
proc ImDot*(a: ImVec2; b: ImVec2): cfloat
proc ImRotate*(v: ImVec2; cos_a: cfloat; sin_a: cfloat): ImVec2
proc ImLinearSweep*(current: cfloat; target: cfloat; speed: cfloat): cfloat
proc ImMul*(lhs: ImVec2; rhs: ImVec2): ImVec2
proc ImBezierCubicCalc*(p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; t: cfloat): ImVec2
proc ImBezierCubicClosestPoint*(p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; num_segments: cint): ImVec2
proc ImBezierCubicClosestPointCasteljau*(p1: ImVec2; p2: ImVec2; p3: ImVec2; p4: ImVec2; p: ImVec2; tess_tol: cfloat): ImVec2
proc ImBezierQuadraticCalc*(p1: ImVec2; p2: ImVec2; p3: ImVec2; t: cfloat): ImVec2
proc ImLineClosestPoint*(a: ImVec2; b: ImVec2; p: ImVec2): ImVec2
proc ImTriangleContainsPoint*(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2): bool
proc ImTriangleClosestPoint*(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2): ImVec2
proc ImTriangleBarycentricCoords*(a: ImVec2; b: ImVec2; c: ImVec2; p: ImVec2; out_u: var cfloat; out_v: var cfloat; out_w: var cfloat)
proc ImTriangleArea*(a: ImVec2; b: ImVec2; c: ImVec2): cfloat
proc ImGetDirQuadrantFromDelta*(dx: cfloat; dy: cfloat): ImGuiDir

{.pop.}

# API functions:
{.push discardable, header: "imgui.h".}

withNamespace("ImGui"):
  proc GetCurrentWindowRead*(): ptr ImGuiWindow
  proc GetCurrentWindow*(): ptr ImGuiWindow
  proc FindWindowByID*(id: ImGuiID): ptr ImGuiWindow
  proc FindWindowByName*(name: cstring): ptr ImGuiWindow
  proc UpdateWindowParentAndRootLinks*(window: ptr ImGuiWindow; flags: ImGuiWindowFlags; parent_window: ptr ImGuiWindow)
  proc CalcWindowNextAutoFitSize*(window: ptr ImGuiWindow): ImVec2
  proc IsWindowChildOf*(window: ptr ImGuiWindow; potential_parent: ptr ImGuiWindow): bool
  proc IsWindowAbove*(potential_above: ptr ImGuiWindow; potential_below: ptr ImGuiWindow): bool
  proc IsWindowNavFocusable*(window: ptr ImGuiWindow): bool
  proc GetWindowAllowedExtentRect*(window: ptr ImGuiWindow): ImRect
  proc SetWindowPos*(window: ptr ImGuiWindow; pos: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowSize*(window: ptr ImGuiWindow; size: ImVec2; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowCollapsed*(window: ptr ImGuiWindow; collapsed: bool; cond: ImGuiCond = ImGuiCond_None)
  proc SetWindowHitTestHole*(window: ptr ImGuiWindow; pos: ImVec2; size: ImVec2)
  proc FocusWindow*(window: ptr ImGuiWindow)
  proc FocusTopMostWindowUnderOne*(under_this_window: ptr ImGuiWindow; ignore_window: ptr ImGuiWindow)
  proc BringWindowToFocusFront*(window: ptr ImGuiWindow)
  proc BringWindowToDisplayFront*(window: ptr ImGuiWindow)
  proc BringWindowToDisplayBack*(window: ptr ImGuiWindow)
  proc SetCurrentFont*(font: ptr ImFont)
  proc GetDefaultFont*(): ptr ImFont
  proc GetForegroundDrawList*(window: ptr ImGuiWindow): ptr ImDrawList
  proc GetBackgroundDrawList*(viewport: ptr ImGuiViewport): ptr ImDrawList
  proc GetForegroundDrawList*(viewport: ptr ImGuiViewport): ptr ImDrawList
  proc Initialize*(context: ptr ImGuiContext)
  proc Shutdown*(context: ptr ImGuiContext)
  proc UpdateHoveredWindowAndCaptureFlags*()
  proc StartMouseMovingWindow*(window: ptr ImGuiWindow)
  proc UpdateMouseMovingWindowNewFrame*()
  proc UpdateMouseMovingWindowEndFrame*()
  proc AddContextHook*(context: ptr ImGuiContext; hook: ptr ImGuiContextHook): ImGuiID
  proc RemoveContextHook*(context: ptr ImGuiContext; hook_to_remove: ImGuiID)
  proc CallContextHooks*(context: ptr ImGuiContext; `type`: ImGuiContextHookType)
  proc MarkIniSettingsDirty*()
  proc MarkIniSettingsDirty*(window: ptr ImGuiWindow)
  proc ClearIniSettings*()
  proc CreateNewWindowSettings*(name: cstring): ptr ImGuiWindowSettings
  proc FindWindowSettings*(id: ImGuiID): ptr ImGuiWindowSettings
  proc FindOrCreateWindowSettings*(name: cstring): ptr ImGuiWindowSettings
  proc FindSettingsHandler*(type_name: cstring): ptr ImGuiSettingsHandler
  proc SetNextWindowScroll*(scroll: ImVec2)
  proc SetScrollX*(window: ptr ImGuiWindow; scroll_x: cfloat)
  proc SetScrollY*(window: ptr ImGuiWindow; scroll_y: cfloat)
  proc SetScrollFromPosX*(window: ptr ImGuiWindow; local_x: cfloat; center_x_ratio: cfloat)
  proc SetScrollFromPosY*(window: ptr ImGuiWindow; local_y: cfloat; center_y_ratio: cfloat)
  proc ScrollToBringRectIntoView*(window: ptr ImGuiWindow; item_rect: ImRect): ImVec2
  proc GetItemID*(): ImGuiID
  proc GetItemStatusFlags*(): ImGuiItemStatusFlags
  proc GetActiveID*(): ImGuiID
  proc GetFocusID*(): ImGuiID
  proc GetItemFlags*(): ImGuiItemFlags
  proc SetActiveID*(id: ImGuiID; window: ptr ImGuiWindow)
  proc SetFocusID*(id: ImGuiID; window: ptr ImGuiWindow)
  proc ClearActiveID*()
  proc GetHoveredID*(): ImGuiID
  proc SetHoveredID*(id: ImGuiID)
  proc KeepAliveID*(id: ImGuiID)
  proc MarkItemEdited*(id: ImGuiID)
  proc PushOverrideID*(id: ImGuiID)
  proc GetIDWithSeed*(str_id_begin: cstring; str_id_end: cstring; seed: ImGuiID): ImGuiID
  proc ItemSize*(size: ImVec2; text_baseline_y: cfloat = -1.0f)
  proc ItemSize*(bb: ImRect; text_baseline_y: cfloat = -1.0f)
  proc ItemAdd*(bb: ImRect; id: ImGuiID; nav_bb: ptr ImRect = nil; flags: ImGuiItemAddFlags = ImGuiItemAddFlags_None): bool
  proc ItemHoverable*(bb: ImRect; id: ImGuiID): bool
  proc ItemFocusable*(window: ptr ImGuiWindow; id: ImGuiID)
  proc IsClippedEx*(bb: ImRect; id: ImGuiID; clip_even_when_logged: bool): bool
  proc SetLastItemData*(window: ptr ImGuiWindow; item_id: ImGuiID; status_flags: ImGuiItemStatusFlags; item_rect: ImRect)
  proc CalcItemSize*(size: ImVec2; default_w: cfloat; default_h: cfloat): ImVec2
  proc CalcWrapWidthForPos*(pos: ImVec2; wrap_pos_x: cfloat): cfloat
  proc PushMultiItemsWidths*(components: cint; width_full: cfloat)
  proc PushItemFlag*(option: ImGuiItemFlags; enabled: bool)
  proc PopItemFlag*()
  proc IsItemToggledSelection*(): bool
  proc GetContentRegionMaxAbs*(): ImVec2
  proc ShrinkWidths*(items: ptr ImGuiShrinkWidthItem; count: cint; width_excess: cfloat)
  proc LogBegin*(`type`: ImGuiLogType; auto_open_depth: cint)
  proc LogToBuffer*(auto_open_depth: cint = -1)
  proc LogRenderedText*(ref_pos: ptr ImVec2; text: cstring; text_end: cstring = nil)
  proc LogSetNextTextDecoration*(prefix: cstring; suffix: cstring)
  proc BeginChildEx*(name: cstring; id: ImGuiID; size_arg: ImVec2; border: bool; flags: ImGuiWindowFlags): bool
  proc OpenPopupEx*(id: ImGuiID; popup_flags: ImGuiPopupFlags = ImGuiPopupFlags_None)
  proc ClosePopupToLevel*(remaining: cint; restore_focus_to_window_under_popup: bool)
  proc ClosePopupsOverWindow*(ref_window: ptr ImGuiWindow; restore_focus_to_window_under_popup: bool)
  proc IsPopupOpen*(id: ImGuiID; popup_flags: ImGuiPopupFlags): bool
  proc BeginPopupEx*(id: ImGuiID; extra_flags: ImGuiWindowFlags): bool
  proc BeginTooltipEx*(extra_flags: ImGuiWindowFlags; tooltip_flags: ImGuiTooltipFlags)
  proc GetTopMostPopupModal*(): ptr ImGuiWindow
  proc FindBestWindowPosForPopup*(window: ptr ImGuiWindow): ImVec2
  proc FindBestWindowPosForPopupEx*(ref_pos: ImVec2; size: ImVec2; last_dir: ptr ImGuiDir; r_outer: ImRect; r_avoid: ImRect; policy: ImGuiPopupPositionPolicy): ImVec2
  proc BeginViewportSideBar*(name: cstring; viewport: ptr ImGuiViewport; dir: ImGuiDir; size: cfloat; window_flags: ImGuiWindowFlags): bool
  proc NavInitWindow*(window: ptr ImGuiWindow; force_reinit: bool)
  proc NavMoveRequestButNoResultYet*(): bool
  proc NavMoveRequestCancel*()
  proc NavMoveRequestForward*(move_dir: ImGuiDir; clip_dir: ImGuiDir; bb_rel: ImRect; move_flags: ImGuiNavMoveFlags)
  proc NavMoveRequestTryWrapping*(window: ptr ImGuiWindow; move_flags: ImGuiNavMoveFlags)
  proc GetNavInputAmount*(n: ImGuiNavInput; mode: ImGuiInputReadMode): cfloat
  proc GetNavInputAmount2d*(dir_sources: ImGuiNavDirSourceFlags; mode: ImGuiInputReadMode; slow_factor: cfloat = 0.0f; fast_factor: cfloat = 0.0f): ImVec2
  proc CalcTypematicRepeatAmount*(t0: cfloat; t1: cfloat; repeat_delay: cfloat; repeat_rate: cfloat): cint
  proc ActivateItem*(id: ImGuiID)
  proc SetNavID*(id: ImGuiID; nav_layer: ImGuiNavLayer; focus_scope_id: ImGuiID; rect_rel: ImRect)
  proc PushFocusScope*(id: ImGuiID)
  proc PopFocusScope*()
  proc GetFocusedFocusScope*(): ImGuiID
  proc GetFocusScope*(): ImGuiID
  proc SetItemUsingMouseWheel*()
  proc IsActiveIdUsingNavDir*(dir: ImGuiDir): bool
  proc IsActiveIdUsingNavInput*(input: ImGuiNavInput): bool
  proc IsActiveIdUsingKey*(key: ImGuiKey): bool
  proc IsMouseDragPastThreshold*(button: ImGuiMouseButton; lock_threshold: cfloat = -1.0f): bool
  proc IsKeyPressedMap*(key: ImGuiKey; repeat: bool = true): bool
  proc IsNavInputDown*(n: ImGuiNavInput): bool
  proc IsNavInputTest*(n: ImGuiNavInput; rm: ImGuiInputReadMode): bool
  proc GetMergedKeyModFlags*(): ImGuiKeyModFlags
  proc BeginDragDropTargetCustom*(bb: ImRect; id: ImGuiID): bool
  proc ClearDragDrop*()
  proc IsDragDropPayloadBeingAccepted*(): bool
  proc SetWindowClipRectBeforeSetChannel*(window: ptr ImGuiWindow; clip_rect: ImRect)
  proc BeginColumns*(str_id: cstring; count: cint; flags: ImGuiOldColumnFlags = ImGuiOldColumnFlags_None)
  proc EndColumns*()
  proc PushColumnClipRect*(column_index: cint)
  proc PushColumnsBackground*()
  proc PopColumnsBackground*()
  proc GetColumnsID*(str_id: cstring; count: cint): ImGuiID
  proc FindOrCreateColumns*(window: ptr ImGuiWindow; id: ImGuiID): ptr ImGuiOldColumns
  proc GetColumnOffsetFromNorm*(columns: ptr ImGuiOldColumns; offset_norm: cfloat): cfloat
  proc GetColumnNormFromOffset*(columns: ptr ImGuiOldColumns; offset: cfloat): cfloat
  proc TableOpenContextMenu*(column_n: cint = -1)
  proc TableSetColumnWidth*(column_n: cint; width: cfloat)
  proc TableSetColumnSortDirection*(column_n: cint; sort_direction: ImGuiSortDirection; append_to_sort_specs: bool)
  proc TableGetHoveredColumn*(): cint
  proc TableGetHeaderRowHeight*(): cfloat
  proc TablePushBackgroundChannel*()
  proc TablePopBackgroundChannel*()
  proc GetCurrentTable*(): ptr ImGuiTable
  proc TableFindByID*(id: ImGuiID): ptr ImGuiTable
  proc BeginTableEx*(name: cstring; id: ImGuiID; columns_count: cint; flags: ImGuiTableFlags = ImGuiTableFlags_None; outer_size: ImVec2 = constructImVec2(0, 0); inner_width: cfloat = 0.0f): bool
  proc TableBeginInitMemory*(table: ptr ImGuiTable; columns_count: cint)
  proc TableBeginApplyRequests*(table: ptr ImGuiTable)
  proc TableSetupDrawChannels*(table: ptr ImGuiTable)
  proc TableUpdateLayout*(table: ptr ImGuiTable)
  proc TableUpdateBorders*(table: ptr ImGuiTable)
  proc TableUpdateColumnsWeightFromWidth*(table: ptr ImGuiTable)
  proc TableDrawBorders*(table: ptr ImGuiTable)
  proc TableDrawContextMenu*(table: ptr ImGuiTable)
  proc TableMergeDrawChannels*(table: ptr ImGuiTable)
  proc TableSortSpecsSanitize*(table: ptr ImGuiTable)
  proc TableSortSpecsBuild*(table: ptr ImGuiTable)
  proc TableGetColumnNextSortDirection*(column: ptr ImGuiTableColumn): ImGuiSortDirection
  proc TableFixColumnSortDirection*(table: ptr ImGuiTable; column: ptr ImGuiTableColumn)
  proc TableGetColumnWidthAuto*(table: ptr ImGuiTable; column: ptr ImGuiTableColumn): cfloat
  proc TableBeginRow*(table: ptr ImGuiTable)
  proc TableEndRow*(table: ptr ImGuiTable)
  proc TableBeginCell*(table: ptr ImGuiTable; column_n: cint)
  proc TableEndCell*(table: ptr ImGuiTable)
  proc TableGetCellBgRect*(table: ptr ImGuiTable; column_n: cint): ImRect
  proc TableGetColumnName*(table: ptr ImGuiTable; column_n: cint): cstring
  proc TableGetColumnResizeID*(table: ptr ImGuiTable; column_n: cint; instance_no: cint = 0): ImGuiID
  proc TableGetMaxColumnWidth*(table: ptr ImGuiTable; column_n: cint): cfloat
  proc TableSetColumnWidthAutoSingle*(table: ptr ImGuiTable; column_n: cint)
  proc TableSetColumnWidthAutoAll*(table: ptr ImGuiTable)
  proc TableRemove*(table: ptr ImGuiTable)
  proc TableGcCompactTransientBuffers*(table: ptr ImGuiTable)
  proc TableGcCompactTransientBuffers*(table: ptr ImGuiTableTempData)
  proc TableGcCompactSettings*()
  proc TableLoadSettings*(table: ptr ImGuiTable)
  proc TableSaveSettings*(table: ptr ImGuiTable)
  proc TableResetSettings*(table: ptr ImGuiTable)
  proc TableGetBoundSettings*(table: ptr ImGuiTable): ptr ImGuiTableSettings
  proc TableSettingsInstallHandler*(context: ptr ImGuiContext)
  proc TableSettingsCreate*(id: ImGuiID; columns_count: cint): ptr ImGuiTableSettings
  proc TableSettingsFindByID*(id: ImGuiID): ptr ImGuiTableSettings
  proc BeginTabBarEx*(tab_bar: ptr ImGuiTabBar; bb: ImRect; flags: ImGuiTabBarFlags): bool
  proc TabBarFindTabByID*(tab_bar: ptr ImGuiTabBar; tab_id: ImGuiID): ptr ImGuiTabItem
  proc TabBarRemoveTab*(tab_bar: ptr ImGuiTabBar; tab_id: ImGuiID)
  proc TabBarCloseTab*(tab_bar: ptr ImGuiTabBar; tab: ptr ImGuiTabItem)
  proc TabBarQueueReorder*(tab_bar: ptr ImGuiTabBar; tab: ptr ImGuiTabItem; offset: cint)
  proc TabBarQueueReorderFromMousePos*(tab_bar: ptr ImGuiTabBar; tab: ptr ImGuiTabItem; mouse_pos: ImVec2)
  proc TabBarProcessReorder*(tab_bar: ptr ImGuiTabBar): bool
  proc TabItemEx*(tab_bar: ptr ImGuiTabBar; label: cstring; p_open: ptr bool; flags: ImGuiTabItemFlags): bool
  proc TabItemCalcSize*(label: cstring; has_close_button: bool): ImVec2
  proc TabItemBackground*(draw_list: ptr ImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; col: ImU32)
  proc TabItemLabelAndCloseButton*(draw_list: ptr ImDrawList; bb: ImRect; flags: ImGuiTabItemFlags; frame_padding: ImVec2; label: cstring; tab_id: ImGuiID; close_button_id: ImGuiID; is_contents_visible: bool; out_just_closed: ptr bool; out_text_clipped: ptr bool)
  proc RenderText*(pos: ImVec2; text: cstring; text_end: cstring = nil; hide_text_after_hash: bool = true)
  proc RenderTextWrapped*(pos: ImVec2; text: cstring; text_end: cstring; wrap_width: cfloat)
  proc RenderTextClipped*(pos_min: ImVec2; pos_max: ImVec2; text: cstring; text_end: cstring; text_size_if_known: ptr ImVec2; align: ImVec2 = constructImVec2(0, 0); clip_rect: ptr ImRect = nil)
  proc RenderTextClippedEx*(draw_list: ptr ImDrawList; pos_min: ImVec2; pos_max: ImVec2; text: cstring; text_end: cstring; text_size_if_known: ptr ImVec2; align: ImVec2 = constructImVec2(0, 0); clip_rect: ptr ImRect = nil)
  proc RenderTextEllipsis*(draw_list: ptr ImDrawList; pos_min: ImVec2; pos_max: ImVec2; clip_max_x: cfloat; ellipsis_max_x: cfloat; text: cstring; text_end: cstring; text_size_if_known: ptr ImVec2)
  proc RenderFrame*(p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; border: bool = true; rounding: cfloat = 0.0f)
  proc RenderFrameBorder*(p_min: ImVec2; p_max: ImVec2; rounding: cfloat = 0.0f)
  proc RenderColorRectWithAlphaCheckerboard*(draw_list: ptr ImDrawList; p_min: ImVec2; p_max: ImVec2; fill_col: ImU32; grid_step: cfloat; grid_off: ImVec2; rounding: cfloat = 0.0f; flags: ImDrawFlags = ImDrawFlags_None)
  proc RenderNavHighlight*(bb: ImRect; id: ImGuiID; flags: ImGuiNavHighlightFlags = ImGuiNavHighlightFlags_TypeDefault)
  proc FindRenderedTextEnd*(text: cstring; text_end: cstring = nil): cstring
  proc RenderArrow*(draw_list: ptr ImDrawList; pos: ImVec2; col: ImU32; dir: ImGuiDir; scale: cfloat = 1.0f)
  proc RenderBullet*(draw_list: ptr ImDrawList; pos: ImVec2; col: ImU32)
  proc RenderCheckMark*(draw_list: ptr ImDrawList; pos: ImVec2; col: ImU32; sz: cfloat)
  proc RenderMouseCursor*(draw_list: ptr ImDrawList; pos: ImVec2; scale: cfloat; mouse_cursor: ImGuiMouseCursor; col_fill: ImU32; col_border: ImU32; col_shadow: ImU32)
  proc RenderArrowPointingAt*(draw_list: ptr ImDrawList; pos: ImVec2; half_sz: ImVec2; direction: ImGuiDir; col: ImU32)
  proc RenderRectFilledRangeH*(draw_list: ptr ImDrawList; rect: ImRect; col: ImU32; x_start_norm: cfloat; x_end_norm: cfloat; rounding: cfloat)
  proc RenderRectFilledWithHole*(draw_list: ptr ImDrawList; outer: ImRect; inner: ImRect; col: ImU32; rounding: cfloat)
  proc TextEx*(text: cstring; text_end: cstring = nil; flags: ImGuiTextFlags = ImGuiTextFlags_None)
  proc ButtonEx*(label: cstring; size_arg: ImVec2 = constructImVec2(0, 0); flags: ImGuiButtonFlags = ImGuiButtonFlags_None): bool
  proc CloseButton*(id: ImGuiID; pos: ImVec2): bool
  proc CollapseButton*(id: ImGuiID; pos: ImVec2): bool
  proc ArrowButtonEx*(str_id: cstring; dir: ImGuiDir; size_arg: ImVec2; flags: ImGuiButtonFlags = ImGuiButtonFlags_None): bool
  proc Scrollbar*(axis: ImGuiAxis)
  proc ScrollbarEx*(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; p_scroll_v: ptr cfloat; avail_v: cfloat; contents_v: cfloat; flags: ImDrawFlags): bool
  proc ImageButtonEx*(id: ImGuiID; texture_id: ImTextureID; size: ImVec2; uv0: ImVec2; uv1: ImVec2; padding: ImVec2; bg_col: ImVec4; tint_col: ImVec4): bool
  proc GetWindowScrollbarRect*(window: ptr ImGuiWindow; axis: ImGuiAxis): ImRect
  proc GetWindowScrollbarID*(window: ptr ImGuiWindow; axis: ImGuiAxis): ImGuiID
  proc GetWindowResizeCornerID*(window: ptr ImGuiWindow; n: cint): ImGuiID
  proc GetWindowResizeBorderID*(window: ptr ImGuiWindow; dir: ImGuiDir): ImGuiID
  proc SeparatorEx*(flags: ImGuiSeparatorFlags)
  proc CheckboxFlags*(label: cstring; flags: ptr ImS64; flags_value: ImS64): bool
  proc CheckboxFlags*(label: cstring; flags: ptr ImU64; flags_value: ImU64): bool
  proc ButtonBehavior*(bb: ImRect; id: ImGuiID; out_hovered: ptr bool; out_held: ptr bool; flags: ImGuiButtonFlags = ImGuiButtonFlags_None): bool
  proc DragBehavior*(id: ImGuiID; data_type: ImGuiDataType; p_v: pointer; v_speed: cfloat; p_min: pointer; p_max: pointer; format: cstring; flags: ImGuiSliderFlags): bool
  proc SliderBehavior*(bb: ImRect; id: ImGuiID; data_type: ImGuiDataType; p_v: pointer; p_min: pointer; p_max: pointer; format: cstring; flags: ImGuiSliderFlags; out_grab_bb: ptr ImRect): bool
  proc SplitterBehavior*(bb: ImRect; id: ImGuiID; axis: ImGuiAxis; size1: ptr cfloat; size2: ptr cfloat; min_size1: cfloat; min_size2: cfloat; hover_extend: cfloat = 0.0f; hover_visibility_delay: cfloat = 0.0f): bool
  proc TreeNodeBehavior*(id: ImGuiID; flags: ImGuiTreeNodeFlags; label: cstring; label_end: cstring = nil): bool
  proc TreeNodeBehaviorIsOpen*(id: ImGuiID; flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): bool
  proc TreePushOverrideID*(id: ImGuiID)
  proc ScaleRatioFromValueT*[T; SIGNED_T; FLOAT_T](data_type: ImGuiDataType; v: T; v_min: T; v_max: T; is_logarithmic: bool; logarithmic_zero_epsilon: cfloat; zero_deadzone_size: cfloat): cfloat
  proc ScaleValueFromRatioT*[T; SIGNED_T; FLOAT_T](data_type: ImGuiDataType; t: cfloat; v_min: T; v_max: T; is_logarithmic: bool; logarithmic_zero_epsilon: cfloat; zero_deadzone_size: cfloat): T
  proc DragBehaviorT*[T; SIGNED_T; FLOAT_T](data_type: ImGuiDataType; v: ptr T; v_speed: cfloat; v_min: T; v_max: T; format: cstring; flags: ImGuiSliderFlags): bool
  proc SliderBehaviorT*[T; SIGNED_T; FLOAT_T](bb: ImRect; id: ImGuiID; data_type: ImGuiDataType; v: ptr T; v_min: T; v_max: T; format: cstring; flags: ImGuiSliderFlags; out_grab_bb: ptr ImRect): bool
  proc RoundScalarWithFormatT*[T; SIGNED_T](format: cstring; data_type: ImGuiDataType; v: T): T
  proc CheckboxFlagsT*[T](label: cstring; flags: ptr T; flags_value: T): bool
  proc DataTypeGetInfo*(data_type: ImGuiDataType): ptr ImGuiDataTypeInfo
  proc DataTypeFormatString*(buf: cstring; buf_size: cint; data_type: ImGuiDataType; p_data: pointer; format: cstring): cint
  proc DataTypeApplyOp*(data_type: ImGuiDataType; op: cint; output: pointer; arg_1: pointer; arg_2: pointer)
  proc DataTypeApplyOpFromText*(buf: cstring; initial_value_buf: cstring; data_type: ImGuiDataType; p_data: pointer; format: cstring): bool
  proc DataTypeCompare*(data_type: ImGuiDataType; arg_1: pointer; arg_2: pointer): cint
  proc DataTypeClamp*(data_type: ImGuiDataType; p_data: pointer; p_min: pointer; p_max: pointer): bool
  proc InputTextEx*(label: cstring; hint: cstring; buf: cstring; buf_size: cint; size_arg: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): bool
  proc TempInputText*(bb: ImRect; id: ImGuiID; label: cstring; buf: cstring; buf_size: cint; flags: ImGuiInputTextFlags): bool
  proc TempInputScalar*(bb: ImRect; id: ImGuiID; label: cstring; data_type: ImGuiDataType; p_data: pointer; format: cstring; p_clamp_min: pointer = nil; p_clamp_max: pointer = nil): bool
  proc TempInputIsActive*(id: ImGuiID): bool
  proc GetInputTextState*(id: ImGuiID): ptr ImGuiInputTextState
  proc ColorTooltip*(text: cstring; col: ptr cfloat; flags: ImGuiColorEditFlags)
  proc ColorEditOptionsPopup*(col: ptr cfloat; flags: ImGuiColorEditFlags)
  proc ColorPickerOptionsPopup*(ref_col: ptr cfloat; flags: ImGuiColorEditFlags)
  proc PlotEx*(plot_type: ImGuiPlotType; label: cstring; values_getter: proc (data: pointer; idx: cint): cfloat; data: pointer; values_count: cint; values_offset: cint; overlay_text: cstring; scale_min: cfloat; scale_max: cfloat; frame_size: ImVec2): cint
  proc ShadeVertsLinearColorGradientKeepAlpha*(draw_list: ptr ImDrawList; vert_start_idx: cint; vert_end_idx: cint; gradient_p0: ImVec2; gradient_p1: ImVec2; col0: ImU32; col1: ImU32)
  proc ShadeVertsLinearUV*(draw_list: ptr ImDrawList; vert_start_idx: cint; vert_end_idx: cint; a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2; clamp: bool)
  proc GcCompactTransientMiscBuffers*()
  proc GcCompactTransientWindowBuffers*(window: ptr ImGuiWindow)
  proc GcAwakeTransientWindowBuffers*(window: ptr ImGuiWindow)
  proc ErrorCheckEndFrameRecover*(log_callback: ImGuiErrorLogCallback; user_data: pointer = nil)
  # proc DebugDrawItemRect*(col: ImU32 = IM_COL32(255, 0, 0, 255))
  # proc DebugStartItemPicker*()
  # proc DebugNodeColumns*(columns: ptr ImGuiOldColumns)
  # proc DebugNodeDrawList*(window: ptr ImGuiWindow; draw_list: ptr ImDrawList; label: cstring)
  # proc DebugNodeDrawCmdShowMeshAndBoundingBox*(out_draw_list: ptr ImDrawList; draw_list: ptr ImDrawList; draw_cmd: ptr ImDrawCmd; show_mesh: bool; show_aabb: bool)
  # proc DebugNodeStorage*(storage: ptr ImGuiStorage; label: cstring)
  # proc DebugNodeTabBar*(tab_bar: ptr ImGuiTabBar; label: cstring)
  # proc DebugNodeTable*(table: ptr ImGuiTable)
  # proc DebugNodeTableSettings*(settings: ptr ImGuiTableSettings)
  # proc DebugNodeWindow*(window: ptr ImGuiWindow; label: cstring)
  # proc DebugNodeWindowSettings*(settings: ptr ImGuiWindowSettings)
  # proc DebugNodeWindowsList*(windows: ptr ImVector[ptr ImGuiWindow]; label: cstring)
  # proc DebugNodeViewport*(viewport: ptr ImGuiViewportP)
  # proc DebugRenderViewportThumbnail*(draw_list: ptr ImDrawList; viewport: ptr ImGuiViewportP; bb: ImRect)

{.pop.}