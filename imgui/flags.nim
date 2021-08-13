type
  ImGuiItemFlags* = distinct cint
  ImGuiItemAddFlags* = distinct cint
  ImGuiItemStatusFlags* = distinct cint
  ImGuiInputTextFlags* = distinct cint
  ImGuiButtonFlags* = distinct cint
  ImGuiSliderFlags* = distinct cint
  ImGuiSelectableFlags* = distinct cint
  ImGuiTreeNodeFlags* = distinct cint
  ImGuiSeparatorFlags* = distinct cint
  ImGuiTextFlags* = distinct cint
  ImGuiTooltipFlags* = distinct cint
  ImGuiLayoutType* = distinct cint
  ImGuiLogType* = distinct cint
  ImGuiAxis* = distinct cint
  ImGuiPlotType* = distinct cint
  ImGuiInputSource* = distinct cint
  ImGuiInputReadMode* = distinct cint
  ImGuiNavHighlightFlags* = distinct cint
  ImGuiNavDirSourceFlags* = distinct cint
  ImGuiNavMoveFlags* = distinct cint
  ImGuiNavForward* = distinct cint
  ImGuiNavLayer* = distinct cint
  ImGuiPopupPositionPolicy* = distinct cint
  ImGuiNextWindowDataFlags* = distinct cint
  ImGuiNextItemDataFlags* = distinct cint
  ImGuiOldColumnFlags* = distinct cint
  ImGuiContextHookType* = distinct cint
  ImGuiTabBarFlags* = distinct cint
  ImGuiWindowFlags* = distinct cint
  ImGuiPopupFlags* = distinct cint
  ImGuiComboFlags* = distinct cint
  ImGuiTabItemFlags* = distinct cint
  ImGuiTableFlags* = distinct cint
  ImGuiTableColumnFlags* = distinct cint
  ImGuiTableRowFlags* = distinct cint
  ImGuiTableBgTarget* = distinct cint
  ImGuiFocusedFlags* = distinct cint
  ImGuiHoveredFlags* = distinct cint
  ImGuiDragDropFlags* = distinct cint
  ImGuiDataType* = distinct cint
  ImGuiDir* = distinct cint
  ImGuiSortDirection* = distinct cint
  ImGuiKey* = distinct cint
  ImGuiKeyModFlags* = distinct cint
  ImGuiNavInput* = distinct cint
  ImGuiConfigFlags* = distinct cint
  ImGuiBackendFlags* = distinct cint
  ImGuiCol* = distinct cint
  ImGuiStyleVar* = distinct cint
  ImGuiColorEditFlags* = distinct cint
  ImGuiMouseButton* = distinct cint
  ImGuiMouseCursor* = distinct cint
  ImGuiCond* = distinct cint
  ImDrawFlags* = distinct cint
  ImDrawListFlags* = distinct cint
  ImGuiViewportFlags* = distinct cint
  ImFontAtlasFlags* = distinct cint

template implementFlag(F): untyped =
  proc `not`*(a: F): F {.inline.} = (not a.cint).F
  proc `and`*(a, b: F): F {.inline.} = (a.cint and b.cint).F
  proc `or`*(a, b: F): F {.inline.} = (a.cint or b.cint).F
  proc `==`*(a, b: F): bool {.inline.} = a.cint == b.cint
  proc `==`*(a: F, b: int): bool {.inline.} = a.cint == b

implementFlag(ImGuiItemFlags)
implementFlag(ImGuiItemAddFlags)
implementFlag(ImGuiItemStatusFlags)
implementFlag(ImGuiInputTextFlags)
implementFlag(ImGuiButtonFlags)
implementFlag(ImGuiSliderFlags)
implementFlag(ImGuiSelectableFlags)
implementFlag(ImGuiTreeNodeFlags)
implementFlag(ImGuiSeparatorFlags)
implementFlag(ImGuiTextFlags)
implementFlag(ImGuiTooltipFlags)
implementFlag(ImGuiLayoutType)
implementFlag(ImGuiLogType)
implementFlag(ImGuiAxis)
implementFlag(ImGuiPlotType)
implementFlag(ImGuiInputSource)
implementFlag(ImGuiInputReadMode)
implementFlag(ImGuiNavHighlightFlags)
implementFlag(ImGuiNavDirSourceFlags)
implementFlag(ImGuiNavMoveFlags)
implementFlag(ImGuiNavForward)
implementFlag(ImGuiNavLayer)
implementFlag(ImGuiPopupPositionPolicy)
implementFlag(ImGuiNextWindowDataFlags)
implementFlag(ImGuiNextItemDataFlags)
implementFlag(ImGuiOldColumnFlags)
implementFlag(ImGuiContextHookType)
implementFlag(ImGuiTabBarFlags)
implementFlag(ImGuiWindowFlags)
implementFlag(ImGuiPopupFlags)
implementFlag(ImGuiComboFlags)
implementFlag(ImGuiTabItemFlags)
implementFlag(ImGuiTableFlags)
implementFlag(ImGuiTableColumnFlags)
implementFlag(ImGuiTableRowFlags)
implementFlag(ImGuiTableBgTarget)
implementFlag(ImGuiFocusedFlags)
implementFlag(ImGuiHoveredFlags)
implementFlag(ImGuiDragDropFlags)
implementFlag(ImGuiDataType)
implementFlag(ImGuiDir)
implementFlag(ImGuiSortDirection)
implementFlag(ImGuiKey)
implementFlag(ImGuiKeyModFlags)
implementFlag(ImGuiNavInput)
implementFlag(ImGuiConfigFlags)
implementFlag(ImGuiBackendFlags)
implementFlag(ImGuiCol)
implementFlag(ImGuiStyleVar)
implementFlag(ImGuiColorEditFlags)
implementFlag(ImGuiMouseButton)
implementFlag(ImGuiMouseCursor)
implementFlag(ImGuiCond)
implementFlag(ImDrawFlags)
implementFlag(ImDrawListFlags)
implementFlag(ImGuiViewportFlags)
implementFlag(ImFontAtlasFlags)

const
  ImGuiItemFlags_None* = 0.ImGuiItemFlags
  ImGuiItemFlags_NoTabStop* = (1 shl 0).ImGuiItemFlags
  ImGuiItemFlags_ButtonRepeat* = (1 shl 1).ImGuiItemFlags
  ImGuiItemFlags_Disabled* = (1 shl 2).ImGuiItemFlags
  ImGuiItemFlags_NoNav* = (1 shl 3).ImGuiItemFlags
  ImGuiItemFlags_NoNavDefaultFocus* = (1 shl 4).ImGuiItemFlags
  ImGuiItemFlags_SelectableDontClosePopup* = (1 shl 5).ImGuiItemFlags
  ImGuiItemFlags_MixedValue* = (1 shl 6).ImGuiItemFlags
  ImGuiItemFlags_ReadOnly* = (1 shl 7).ImGuiItemFlags

  ImGuiItemAddFlags_None* = 0.ImGuiItemAddFlags
  ImGuiItemAddFlags_Focusable* = (1 shl 0).ImGuiItemAddFlags

  ImGuiItemStatusFlags_None* = 0.ImGuiItemStatusFlags
  ImGuiItemStatusFlags_HoveredRect* = (1 shl 0).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_HasDisplayRect* = (1 shl 1).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_Edited* = (1 shl 2).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_ToggledSelection* = (1 shl 3).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_ToggledOpen* = (1 shl 4).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_HasDeactivated* = (1 shl 5).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_Deactivated* = (1 shl 6).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_HoveredWindow* = (1 shl 7).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_FocusedByCode* = (1 shl 8).ImGuiItemStatusFlags
  ImGuiItemStatusFlags_FocusedByTabbing* = (1 shl 9).ImGuiItemStatusFlags

  ImGuiSelectableFlags_None* = 0.ImGuiSelectableFlags
  ImGuiSelectableFlags_DontClosePopups* = (1 shl 0).ImGuiSelectableFlags
  ImGuiSelectableFlags_SpanAllColumns* = (1 shl 1).ImGuiSelectableFlags
  ImGuiSelectableFlags_AllowDoubleClick* = (1 shl 2).ImGuiSelectableFlags
  ImGuiSelectableFlags_Disabled* = (1 shl 3).ImGuiSelectableFlags
  ImGuiSelectableFlags_AllowItemOverlap* = (1 shl 4).ImGuiSelectableFlags
  ImGuiSelectableFlags_NoHoldingActiveID* = (1 shl 20).ImGuiSelectableFlags
  ImGuiSelectableFlags_SelectOnClick* = (1 shl 21).ImGuiSelectableFlags
  ImGuiSelectableFlags_SelectOnRelease* = (1 shl 22).ImGuiSelectableFlags
  ImGuiSelectableFlags_SpanAvailWidth* = (1 shl 23).ImGuiSelectableFlags
  ImGuiSelectableFlags_DrawHoveredWhenHeld* = (1 shl 24).ImGuiSelectableFlags
  ImGuiSelectableFlags_SetNavIdOnHover* = (1 shl 25).ImGuiSelectableFlags
  ImGuiSelectableFlags_NoPadWithHalfSpacing* = (1 shl 26).ImGuiSelectableFlags

  ImGuiSeparatorFlags_None* = 0.ImGuiSeparatorFlags
  ImGuiSeparatorFlags_Horizontal* = (1 shl 0).ImGuiSeparatorFlags
  ImGuiSeparatorFlags_Vertical* = (1 shl 1).ImGuiSeparatorFlags
  ImGuiSeparatorFlags_SpanAllColumns* = (1 shl 2).ImGuiSeparatorFlags

  ImGuiTextFlags_None* = 0.ImGuiTextFlags
  ImGuiTextFlags_NoWidthForLargeClippedText* = (1 shl 0).ImGuiTextFlags

  ImGuiTooltipFlags_None* = 0.ImGuiTooltipFlags
  ImGuiTooltipFlags_OverridePreviousTooltip* = (1 shl 0).ImGuiTooltipFlags

  ImGuiLayoutType_Horizontal* = 0.ImGuiLayoutType
  ImGuiLayoutType_Vertical* = 1.ImGuiLayoutType

  ImGuiLogType_None* = 0.ImGuiLogType
  ImGuiLogType_TTY* = 1.ImGuiLogType
  ImGuiLogType_File* = 2.ImGuiLogType
  ImGuiLogType_Buffer* = 3.ImGuiLogType
  ImGuiLogType_Clipboard* = 4.ImGuiLogType

  ImGuiAxis_None* = (-1).ImGuiAxis
  ImGuiAxis_X* = 0.ImGuiAxis
  ImGuiAxis_Y* = 1.ImGuiAxis

  ImGuiPlotType_Lines* = 0.ImGuiPlotType
  ImGuiPlotType_Histogram* = 1.ImGuiPlotType

  ImGuiInputSource_None* = 0.ImGuiInputSource
  ImGuiInputSource_Mouse* = 1.ImGuiInputSource
  ImGuiInputSource_Keyboard* = 2.ImGuiInputSource
  ImGuiInputSource_Gamepad* = 3.ImGuiInputSource
  ImGuiInputSource_Nav* = 4.ImGuiInputSource
  ImGuiInputSource_Clipboard* = 5.ImGuiInputSource
  ImGuiInputSource_COUNT* = 6.ImGuiInputSource

  ImGuiInputReadMode_Down* = 0.ImGuiInputReadMode
  ImGuiInputReadMode_Pressed* = 1.ImGuiInputReadMode
  ImGuiInputReadMode_Released* = 2.ImGuiInputReadMode
  ImGuiInputReadMode_Repeat* = 3.ImGuiInputReadMode
  ImGuiInputReadMode_RepeatSlow* = 4.ImGuiInputReadMode
  ImGuiInputReadMode_RepeatFast* = 5.ImGuiInputReadMode

  ImGuiNavHighlightFlags_None* = 0.ImGuiNavHighlightFlags
  ImGuiNavHighlightFlags_TypeDefault* = (1 shl 0).ImGuiNavHighlightFlags
  ImGuiNavHighlightFlags_TypeThin* = (1 shl 1).ImGuiNavHighlightFlags
  ImGuiNavHighlightFlags_AlwaysDraw* = (1 shl 2).ImGuiNavHighlightFlags
  ImGuiNavHighlightFlags_NoRounding* = (1 shl 3).ImGuiNavHighlightFlags

  ImGuiNavDirSourceFlags_None* = 0.ImGuiNavDirSourceFlags
  ImGuiNavDirSourceFlags_Keyboard* = (1 shl 0).ImGuiNavDirSourceFlags
  ImGuiNavDirSourceFlags_PadDPad* = (1 shl 1).ImGuiNavDirSourceFlags
  ImGuiNavDirSourceFlags_PadLStick* = (1 shl 2).ImGuiNavDirSourceFlags

  ImGuiNavMoveFlags_None* = 0.ImGuiNavMoveFlags
  ImGuiNavMoveFlags_LoopX* = (1 shl 0).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_LoopY* = (1 shl 1).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_WrapX* = (1 shl 2).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_WrapY* = (1 shl 3).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_AllowCurrentNavId* = (1 shl 4).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_AlsoScoreVisibleSet* = (1 shl 5).ImGuiNavMoveFlags
  ImGuiNavMoveFlags_ScrollToEdge* = (1 shl 6).ImGuiNavMoveFlags

  ImGuiNavForward_None* = 0.ImGuiNavForward
  ImGuiNavForward_ForwardQueued* = 1.ImGuiNavForward
  ImGuiNavForward_ForwardActive* = 2.ImGuiNavForward

  ImGuiNavLayer_Main* = 0.ImGuiNavLayer
  ImGuiNavLayer_Menu* = 1.ImGuiNavLayer
  ImGuiNavLayer_COUNT* = 2.ImGuiNavLayer

  ImGuiPopupPositionPolicy_Default* = 0.ImGuiPopupPositionPolicy
  ImGuiPopupPositionPolicy_ComboBox* = 1.ImGuiPopupPositionPolicy
  ImGuiPopupPositionPolicy_Tooltip* = 2.ImGuiPopupPositionPolicy

  ImGuiNextWindowDataFlags_None* = 0.ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasPos* = (1 shl 0).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasSize* = (1 shl 1).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasContentSize* = (1 shl 2).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasCollapsed* = (1 shl 3).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasSizeConstraint* = (1 shl 4).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasFocus* = (1 shl 5).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasBgAlpha* = (1 shl 6).ImGuiNextWindowDataFlags
  ImGuiNextWindowDataFlags_HasScroll* = (1 shl 7).ImGuiNextWindowDataFlags

  ImGuiNextItemDataFlags_None* = 0.ImGuiNextItemDataFlags
  ImGuiNextItemDataFlags_HasWidth* = (1 shl 0).ImGuiNextItemDataFlags
  ImGuiNextItemDataFlags_HasOpen* = (1 shl 1).ImGuiNextItemDataFlags

  ImGuiOldColumnFlags_None* = 0.ImGuiOldColumnFlags
  ImGuiOldColumnFlags_NoBorder* = (1 shl 0).ImGuiOldColumnFlags
  ImGuiOldColumnFlags_NoResize* = (1 shl 1).ImGuiOldColumnFlags
  ImGuiOldColumnFlags_NoPreserveWidths* = (1 shl 2).ImGuiOldColumnFlags
  ImGuiOldColumnFlags_NoForceWithinWindow* = (1 shl 3).ImGuiOldColumnFlags
  ImGuiOldColumnFlags_GrowParentContentsSize* = (1 shl 4).ImGuiOldColumnFlags

  ImGuiContextHookType_NewFramePre* = 0.ImGuiContextHookType
  ImGuiContextHookType_NewFramePost* = 1.ImGuiContextHookType
  ImGuiContextHookType_EndFramePre* = 2.ImGuiContextHookType
  ImGuiContextHookType_EndFramePost* = 3.ImGuiContextHookType
  ImGuiContextHookType_RenderPre* = 4.ImGuiContextHookType
  ImGuiContextHookType_RenderPost* = 5.ImGuiContextHookType
  ImGuiContextHookType_Shutdown* = 6.ImGuiContextHookType
  ImGuiContextHookType_PendingRemoval* = 7.ImGuiContextHookType

  ImGuiWindowFlags_None* = 0.ImGuiWindowFlags
  ImGuiWindowFlags_NoTitleBar* = (1 shl 0).ImGuiWindowFlags
  ImGuiWindowFlags_NoResize* = (1 shl 1).ImGuiWindowFlags
  ImGuiWindowFlags_NoMove* = (1 shl 2).ImGuiWindowFlags
  ImGuiWindowFlags_NoScrollbar* = (1 shl 3).ImGuiWindowFlags
  ImGuiWindowFlags_NoScrollWithMouse* = (1 shl 4).ImGuiWindowFlags
  ImGuiWindowFlags_NoCollapse* = (1 shl 5).ImGuiWindowFlags
  ImGuiWindowFlags_AlwaysAutoResize* = (1 shl 6).ImGuiWindowFlags
  ImGuiWindowFlags_NoBackground* = (1 shl 7).ImGuiWindowFlags
  ImGuiWindowFlags_NoSavedSettings* = (1 shl 8).ImGuiWindowFlags
  ImGuiWindowFlags_NoMouseInputs* = (1 shl 9).ImGuiWindowFlags
  ImGuiWindowFlags_MenuBar* = (1 shl 10).ImGuiWindowFlags
  ImGuiWindowFlags_HorizontalScrollbar* = (1 shl 11).ImGuiWindowFlags
  ImGuiWindowFlags_NoFocusOnAppearing* = (1 shl 12).ImGuiWindowFlags
  ImGuiWindowFlags_NoBringToFrontOnFocus* = (1 shl 13).ImGuiWindowFlags
  ImGuiWindowFlags_AlwaysVerticalScrollbar* = (1 shl 14).ImGuiWindowFlags
  ImGuiWindowFlags_AlwaysHorizontalScrollbar* = (1 shl 15).ImGuiWindowFlags
  ImGuiWindowFlags_AlwaysUseWindowPadding* = (1 shl 16).ImGuiWindowFlags
  ImGuiWindowFlags_NoNavInputs* = (1 shl 18).ImGuiWindowFlags
  ImGuiWindowFlags_NoNavFocus* = (1 shl 19).ImGuiWindowFlags
  ImGuiWindowFlags_UnsavedDocument* = (1 shl 20).ImGuiWindowFlags
  ImGuiWindowFlags_NavFlattened* = (1 shl 23).ImGuiWindowFlags
  ImGuiWindowFlags_ChildWindow* = (1 shl 24).ImGuiWindowFlags
  ImGuiWindowFlags_Tooltip* = (1 shl 25).ImGuiWindowFlags
  ImGuiWindowFlags_Popup* = (1 shl 26).ImGuiWindowFlags
  ImGuiWindowFlags_Modal* = (1 shl 27).ImGuiWindowFlags
  ImGuiWindowFlags_ChildMenu* = (1 shl 28).ImGuiWindowFlags
  ImGuiWindowFlags_NoNav* = (ImGuiWindowFlags_NoNavInputs.cint or
                             ImGuiWindowFlags_NoNavFocus.cint).ImGuiWindowFlags
  ImGuiWindowFlags_NoDecoration* = (ImGuiWindowFlags_NoTitleBar.cint or
                                    ImGuiWindowFlags_NoResize.cint or
                                    ImGuiWindowFlags_NoScrollbar.cint or
                                    ImGuiWindowFlags_NoCollapse.cint).ImGuiWindowFlags
  ImGuiWindowFlags_NoInputs* = (ImGuiWindowFlags_NoMouseInputs.cint or
                                ImGuiWindowFlags_NoNavInputs.cint or
                                ImGuiWindowFlags_NoNavFocus.cint).ImGuiWindowFlags

  ImGuiInputTextFlags_None* = 0.ImGuiInputTextFlags
  ImGuiInputTextFlags_CharsDecimal* = (1 shl 0).ImGuiInputTextFlags
  ImGuiInputTextFlags_CharsHexadecimal* = (1 shl 1).ImGuiInputTextFlags
  ImGuiInputTextFlags_CharsUppercase* = (1 shl 2).ImGuiInputTextFlags
  ImGuiInputTextFlags_CharsNoBlank* = (1 shl 3).ImGuiInputTextFlags
  ImGuiInputTextFlags_AutoSelectAll* = (1 shl 4).ImGuiInputTextFlags
  ImGuiInputTextFlags_EnterReturnsTrue* = (1 shl 5).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackCompletion* = (1 shl 6).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackHistory* = (1 shl 7).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackAlways* = (1 shl 8).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackCharFilter* = (1 shl 9).ImGuiInputTextFlags
  ImGuiInputTextFlags_AllowTabInput* = (1 shl 10).ImGuiInputTextFlags
  ImGuiInputTextFlags_CtrlEnterForNewLine* = (1 shl 11).ImGuiInputTextFlags
  ImGuiInputTextFlags_NoHorizontalScroll* = (1 shl 12).ImGuiInputTextFlags
  ImGuiInputTextFlags_AlwaysOverwrite* = (1 shl 13).ImGuiInputTextFlags
  ImGuiInputTextFlags_ReadOnly* = (1 shl 14).ImGuiInputTextFlags
  ImGuiInputTextFlags_Password* = (1 shl 15).ImGuiInputTextFlags
  ImGuiInputTextFlags_NoUndoRedo* = (1 shl 16).ImGuiInputTextFlags
  ImGuiInputTextFlags_CharsScientific* = (1 shl 17).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackResize* = (1 shl 18).ImGuiInputTextFlags
  ImGuiInputTextFlags_CallbackEdit* = (1 shl 19).ImGuiInputTextFlags
  ImGuiInputTextFlags_Multiline* = (1 shl 26).ImGuiInputTextFlags
  ImGuiInputTextFlags_NoMarkEdited* = (1 shl 27).ImGuiInputTextFlags
  ImGuiInputTextFlags_MergedItem* = (1 shl 28).ImGuiInputTextFlags

  ImGuiTreeNodeFlags_None* = 0.ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_Selected* = (1 shl 0).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_Framed* = (1 shl 1).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_AllowItemOverlap* = (1 shl 2).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_NoTreePushOnOpen* = (1 shl 3).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_NoAutoOpenOnLog* = (1 shl 4).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_DefaultOpen* = (1 shl 5).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_OpenOnDoubleClick* = (1 shl 6).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_OpenOnArrow* = (1 shl 7).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_Leaf* = (1 shl 8).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_Bullet* = (1 shl 9).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_FramePadding* = (1 shl 10).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_SpanAvailWidth* = (1 shl 11).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_SpanFullWidth* = (1 shl 12).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_NavLeftJumpsBackHere* = (1 shl 13).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_ClipLabelForTrailingButton* = (1 shl 20).ImGuiTreeNodeFlags
  ImGuiTreeNodeFlags_CollapsingHeader* = (ImGuiTreeNodeFlags_Framed.cint or
                                          ImGuiTreeNodeFlags_NoTreePushOnOpen.cint).ImGuiTreeNodeFlags

  ImGuiPopupFlags_None* = 0.ImGuiPopupFlags
  ImGuiPopupFlags_MouseButtonRight* = 1.ImGuiPopupFlags
  ImGuiPopupFlags_MouseButtonMiddle* = 2.ImGuiPopupFlags
  ImGuiPopupFlags_NoOpenOverExistingPopup* = (1 shl 5).ImGuiPopupFlags
  ImGuiPopupFlags_NoOpenOverItems* = (1 shl 6).ImGuiPopupFlags
  ImGuiPopupFlags_AnyPopupId* = (1 shl 7).ImGuiPopupFlags
  ImGuiPopupFlags_AnyPopupLevel* = (1 shl 8).ImGuiPopupFlags
  ImGuiPopupFlags_MouseButtonMask* = 0x1F
  ImGuiPopupFlags_MouseButtonLeft* = ImGuiPopupFlags_None
  ImGuiPopupFlags_MouseButtonDefault* = ImGuiPopupFlags_MouseButtonRight
  ImGuiPopupFlags_AnyPopup* = (ImGuiPopupFlags_AnyPopupId.cint or
                               ImGuiPopupFlags_AnyPopupLevel.cint).ImGuiPopupFlags

  ImGuiComboFlags_None* = 0.ImGuiComboFlags
  ImGuiComboFlags_PopupAlignLeft* = (1 shl 0).ImGuiComboFlags
  ImGuiComboFlags_HeightSmall* = (1 shl 1).ImGuiComboFlags
  ImGuiComboFlags_HeightRegular* = (1 shl 2).ImGuiComboFlags
  ImGuiComboFlags_HeightLarge* = (1 shl 3).ImGuiComboFlags
  ImGuiComboFlags_HeightLargest* = (1 shl 4).ImGuiComboFlags
  ImGuiComboFlags_NoArrowButton* = (1 shl 5).ImGuiComboFlags
  ImGuiComboFlags_NoPreview* = (1 shl 6).ImGuiComboFlags
  ImGuiComboFlags_HeightMask* = (ImGuiComboFlags_HeightSmall.cint or
                                 ImGuiComboFlags_HeightRegular.cint or
                                 ImGuiComboFlags_HeightLarge.cint or
                                 ImGuiComboFlags_HeightLargest.cint). ImGuiComboFlags

  ImGuiTabBarFlags_None* = 0.ImGuiTabBarFlags
  ImGuiTabBarFlags_Reorderable* = (1 shl 0).ImGuiTabBarFlags
  ImGuiTabBarFlags_AutoSelectNewTabs* = (1 shl 1).ImGuiTabBarFlags
  ImGuiTabBarFlags_TabListPopupButton* = (1 shl 2).ImGuiTabBarFlags
  ImGuiTabBarFlags_NoCloseWithMiddleMouseButton* = (1 shl 3).ImGuiTabBarFlags
  ImGuiTabBarFlags_NoTabListScrollingButtons* = (1 shl 4).ImGuiTabBarFlags
  ImGuiTabBarFlags_NoTooltip* = (1 shl 5).ImGuiTabBarFlags
  ImGuiTabBarFlags_FittingPolicyResizeDown* = (1 shl 6).ImGuiTabBarFlags
  ImGuiTabBarFlags_FittingPolicyScroll* = (1 shl 7).ImGuiTabBarFlags
  ImGuiTabBarFlags_DockNode* = (1 shl 20).ImGuiTabBarFlags
  ImGuiTabBarFlags_IsFocused* = (1 shl 21).ImGuiTabBarFlags
  ImGuiTabBarFlags_SaveSettings* = (1 shl 22).ImGuiTabBarFlags
  ImGuiTabBarFlags_FittingPolicyDefault* = ImGuiTabBarFlags_FittingPolicyResizeDown
  ImGuiTabBarFlags_FittingPolicyMask* = (ImGuiTabBarFlags_FittingPolicyResizeDown.cint or
                                         ImGuiTabBarFlags_FittingPolicyScroll.cint).ImGuiTabBarFlags

  ImGuiTabItemFlags_None* = 0.ImGuiTabItemFlags
  ImGuiTabItemFlags_UnsavedDocument* = (1 shl 0).ImGuiTabItemFlags
  ImGuiTabItemFlags_SetSelected* = (1 shl 1).ImGuiTabItemFlags
  ImGuiTabItemFlags_NoCloseWithMiddleMouseButton* = (1 shl 2).ImGuiTabItemFlags
  ImGuiTabItemFlags_NoPushId* = (1 shl 3).ImGuiTabItemFlags
  ImGuiTabItemFlags_NoTooltip* = (1 shl 4).ImGuiTabItemFlags
  ImGuiTabItemFlags_NoReorder* = (1 shl 5).ImGuiTabItemFlags
  ImGuiTabItemFlags_Leading* = (1 shl 6).ImGuiTabItemFlags
  ImGuiTabItemFlags_Trailing* = (1 shl 7).ImGuiTabItemFlags
  ImGuiTabItemFlags_NoCloseButton* = (1 shl 20).ImGuiTabItemFlags
  ImGuiTabItemFlags_Button* = (1 shl 21).ImGuiTabItemFlags
  ImGuiTabItemFlags_SectionMask* = (ImGuiTabItemFlags_Leading.cint or
                                    ImGuiTabItemFlags_Trailing.cint).ImGuiTabItemFlags

  ImGuiTableFlags_None* = 0.ImGuiTableFlags
  ImGuiTableFlags_Resizable* = (1 shl 0).ImGuiTableFlags
  ImGuiTableFlags_Reorderable* = (1 shl 1).ImGuiTableFlags
  ImGuiTableFlags_Hideable* = (1 shl 2).ImGuiTableFlags
  ImGuiTableFlags_Sortable* = (1 shl 3).ImGuiTableFlags
  ImGuiTableFlags_NoSavedSettings* = (1 shl 4).ImGuiTableFlags
  ImGuiTableFlags_ContextMenuInBody* = (1 shl 5).ImGuiTableFlags
  ImGuiTableFlags_RowBg* = (1 shl 6).ImGuiTableFlags
  ImGuiTableFlags_BordersInnerH* = (1 shl 7).ImGuiTableFlags
  ImGuiTableFlags_BordersOuterH* = (1 shl 8).ImGuiTableFlags
  ImGuiTableFlags_BordersInnerV* = (1 shl 9).ImGuiTableFlags
  ImGuiTableFlags_BordersOuterV* = (1 shl 10).ImGuiTableFlags
  ImGuiTableFlags_NoBordersInBody* = (1 shl 11).ImGuiTableFlags
  ImGuiTableFlags_NoBordersInBodyUntilResize* = (1 shl 12).ImGuiTableFlags
  ImGuiTableFlags_SizingFixedFit* = (1 shl 13).ImGuiTableFlags
  ImGuiTableFlags_SizingFixedSame* = (2 shl 13).ImGuiTableFlags
  ImGuiTableFlags_SizingStretchProp* = (3 shl 13).ImGuiTableFlags
  ImGuiTableFlags_SizingStretchSame* = (4 shl 13).ImGuiTableFlags
  ImGuiTableFlags_NoHostExtendX* = (1 shl 16).ImGuiTableFlags
  ImGuiTableFlags_NoHostExtendY* = (1 shl 17).ImGuiTableFlags
  ImGuiTableFlags_NoKeepColumnsVisible* = (1 shl 18).ImGuiTableFlags
  ImGuiTableFlags_PreciseWidths* = (1 shl 19).ImGuiTableFlags
  ImGuiTableFlags_NoClip* = (1 shl 20).ImGuiTableFlags
  ImGuiTableFlags_PadOuterX* = (1 shl 21).ImGuiTableFlags
  ImGuiTableFlags_NoPadOuterX* = (1 shl 22).ImGuiTableFlags
  ImGuiTableFlags_NoPadInnerX* = (1 shl 23).ImGuiTableFlags
  ImGuiTableFlags_ScrollX* = (1 shl 24).ImGuiTableFlags
  ImGuiTableFlags_ScrollY* = (1 shl 25).ImGuiTableFlags
  ImGuiTableFlags_SortMulti* = (1 shl 26).ImGuiTableFlags
  ImGuiTableFlags_SortTristate* = (1 shl 27).ImGuiTableFlags
  ImGuiTableFlags_BordersH* = (ImGuiTableFlags_BordersInnerH.cint or
                               ImGuiTableFlags_BordersOuterH.cint).ImGuiTableFlags
  ImGuiTableFlags_BordersV* = (ImGuiTableFlags_BordersInnerV.cint or
                               ImGuiTableFlags_BordersOuterV.cint).ImGuiTableFlags
  ImGuiTableFlags_BordersInner* = (ImGuiTableFlags_BordersInnerV.cint or
                                   ImGuiTableFlags_BordersInnerH.cint).ImGuiTableFlags
  ImGuiTableFlags_BordersOuter* = (ImGuiTableFlags_BordersOuterV.cint or
                                   ImGuiTableFlags_BordersOuterH.cint).ImGuiTableFlags
  ImGuiTableFlags_Borders* = (ImGuiTableFlags_BordersInner.cint or
                              ImGuiTableFlags_BordersOuter.cint).ImGuiTableFlags
  ImGuiTableFlags_SizingMask* = (ImGuiTableFlags_SizingFixedFit.cint or
                                 ImGuiTableFlags_SizingFixedSame.cint or
                                 ImGuiTableFlags_SizingStretchProp.cint or
                                 ImGuiTableFlags_SizingStretchSame.cint).ImGuiTableFlags

  ImGuiTableColumnFlags_None* = 0.ImGuiTableColumnFlags
  ImGuiTableColumnFlags_DefaultHide* = (1 shl 0).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_DefaultSort* = (1 shl 1).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_WidthStretch* = (1 shl 2).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_WidthFixed* = (1 shl 3).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoResize* = (1 shl 4).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoReorder* = (1 shl 5).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoHide* = (1 shl 6).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoClip* = (1 shl 7).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoSort* = (1 shl 8).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoSortAscending* = (1 shl 9).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoSortDescending* = (1 shl 10).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoHeaderWidth* = (1 shl 11).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_PreferSortAscending* = (1 shl 12).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_PreferSortDescending* = (1 shl 13).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IndentEnable* = (1 shl 14).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IndentDisable* = (1 shl 15).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IsEnabled* = (1 shl 20).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IsVisible* = (1 shl 21).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IsSorted* = (1 shl 22).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IsHovered* = (1 shl 23).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_NoDirectResize* = (1 shl 30).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_WidthMask* = (ImGuiTableColumnFlags_WidthStretch.cint or
                                      ImGuiTableColumnFlags_WidthFixed.cint).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_IndentMask* = (ImGuiTableColumnFlags_IndentEnable.cint or
                                       ImGuiTableColumnFlags_IndentDisable.cint).ImGuiTableColumnFlags
  ImGuiTableColumnFlags_StatusMask* = (ImGuiTableColumnFlags_IsEnabled.cint or
                                       ImGuiTableColumnFlags_IsVisible.cint or
                                       ImGuiTableColumnFlags_IsSorted.cint or
                                       ImGuiTableColumnFlags_IsHovered.cint).ImGuiTableColumnFlags

  ImGuiTableRowFlags_None* = 0.ImGuiTableRowFlags
  ImGuiTableRowFlags_Headers* = (1 shl 0).ImGuiTableRowFlags

  ImGuiTableBgTarget_None* = 0.ImGuiTableBgTarget
  ImGuiTableBgTarget_RowBg0* = 1.ImGuiTableBgTarget
  ImGuiTableBgTarget_RowBg1* = 2.ImGuiTableBgTarget
  ImGuiTableBgTarget_CellBg* = 3.ImGuiTableBgTarget

  ImGuiFocusedFlags_None* = 0.ImGuiFocusedFlags
  ImGuiFocusedFlags_ChildWindows* = (1 shl 0).ImGuiFocusedFlags
  ImGuiFocusedFlags_RootWindow* = (1 shl 1).ImGuiFocusedFlags
  ImGuiFocusedFlags_AnyWindow* = (1 shl 2).ImGuiFocusedFlags
  ImGuiFocusedFlags_RootAndChildWindows* = (ImGuiFocusedFlags_RootWindow.cint or
                                            ImGuiFocusedFlags_ChildWindows.cint).ImGuiFocusedFlags

  ImGuiHoveredFlags_None* = 0.ImGuiHoveredFlags
  ImGuiHoveredFlags_ChildWindows* = (1 shl 0).ImGuiHoveredFlags
  ImGuiHoveredFlags_RootWindow* = (1 shl 1).ImGuiHoveredFlags
  ImGuiHoveredFlags_AnyWindow* = (1 shl 2).ImGuiHoveredFlags
  ImGuiHoveredFlags_AllowWhenBlockedByPopup* = (1 shl 3).ImGuiHoveredFlags
  ImGuiHoveredFlags_AllowWhenBlockedByActiveItem* = (1 shl 5).ImGuiHoveredFlags
  ImGuiHoveredFlags_AllowWhenOverlapped* = (1 shl 6).ImGuiHoveredFlags
  ImGuiHoveredFlags_AllowWhenDisabled* = (1 shl 7).ImGuiHoveredFlags
  ImGuiHoveredFlags_RectOnly* = (ImGuiHoveredFlags_AllowWhenBlockedByPopup.cint or
                                 ImGuiHoveredFlags_AllowWhenBlockedByActiveItem.cint or
                                 ImGuiHoveredFlags_AllowWhenOverlapped.cint).ImGuiHoveredFlags
  ImGuiHoveredFlags_RootAndChildWindows* = (ImGuiHoveredFlags_RootWindow.cint or
                                            ImGuiHoveredFlags_ChildWindows.cint).ImGuiHoveredFlags

  ImGuiDragDropFlags_None* = 0.ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceNoPreviewTooltip* = (1 shl 0).ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceNoDisableHover* = (1 shl 1).ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceNoHoldToOpenOthers* = (1 shl 2).ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceAllowNullID* = (1 shl 3).ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceExtern* = (1 shl 4).ImGuiDragDropFlags
  ImGuiDragDropFlags_SourceAutoExpirePayload* = (1 shl 5).ImGuiDragDropFlags
  ImGuiDragDropFlags_AcceptBeforeDelivery* = (1 shl 10).ImGuiDragDropFlags
  ImGuiDragDropFlags_AcceptNoDrawDefaultRect* = (1 shl 11).ImGuiDragDropFlags
  ImGuiDragDropFlags_AcceptNoPreviewTooltip* = (1 shl 12).ImGuiDragDropFlags
  ImGuiDragDropFlags_AcceptPeekOnly* = (ImGuiDragDropFlags_AcceptBeforeDelivery.cint or
                                        ImGuiDragDropFlags_AcceptNoDrawDefaultRect.cint).ImGuiDragDropFlags

  ImGuiDataType_S8* = 0.ImGuiDataType
  ImGuiDataType_U8* = 1.ImGuiDataType
  ImGuiDataType_S16* = 2.ImGuiDataType
  ImGuiDataType_U16* = 3.ImGuiDataType
  ImGuiDataType_S32* = 4.ImGuiDataType
  ImGuiDataType_U32* = 5.ImGuiDataType
  ImGuiDataType_S64* = 6.ImGuiDataType
  ImGuiDataType_U64* = 7.ImGuiDataType
  ImGuiDataType_Float* = 8.ImGuiDataType
  ImGuiDataType_Double* = 9.ImGuiDataType
  ImGuiDataType_COUNT* = 10.ImGuiDataType
  ImGuiDataType_String* = (ImGuiDataType_COUNT.cint + 1).ImGuiDataType
  ImGuiDataType_Pointer* = (ImGuiDataType_COUNT.cint + 2).ImGuiDataType
  ImGuiDataType_ID* = (ImGuiDataType_COUNT.cint + 3).ImGuiDataType

  ImGuiDir_None* = (-1).ImGuiDir
  ImGuiDir_Left* = 0.ImGuiDir
  ImGuiDir_Right* = 1.ImGuiDir
  ImGuiDir_Up* = 2.ImGuiDir
  ImGuiDir_Down* = 3.ImGuiDir
  ImGuiDir_COUNT* = 4.ImGuiDir

  ImGuiSortDirection_None* = 0.ImGuiSortDirection
  ImGuiSortDirection_Ascending* = 1.ImGuiSortDirection
  ImGuiSortDirection_Descending* = 2.ImGuiSortDirection

  ImGuiKey_Tab* = 0.ImGuiKey
  ImGuiKey_LeftArrow* = 1.ImGuiKey
  ImGuiKey_RightArrow* = 2.ImGuiKey
  ImGuiKey_UpArrow* = 3.ImGuiKey
  ImGuiKey_DownArrow* = 4.ImGuiKey
  ImGuiKey_PageUp* = 5.ImGuiKey
  ImGuiKey_PageDown* = 6.ImGuiKey
  ImGuiKey_Home* = 7.ImGuiKey
  ImGuiKey_End* = 8.ImGuiKey
  ImGuiKey_Insert* = 9.ImGuiKey
  ImGuiKey_Delete* = 10.ImGuiKey
  ImGuiKey_Backspace* = 11.ImGuiKey
  ImGuiKey_Space* = 12.ImGuiKey
  ImGuiKey_Enter* = 13.ImGuiKey
  ImGuiKey_Escape* = 14.ImGuiKey
  ImGuiKey_KeyPadEnter* = 15.ImGuiKey
  ImGuiKey_A* = 16.ImGuiKey
  ImGuiKey_C* = 17.ImGuiKey
  ImGuiKey_V* = 18.ImGuiKey
  ImGuiKey_X* = 19.ImGuiKey
  ImGuiKey_Y* = 20.ImGuiKey
  ImGuiKey_Z* = 21.ImGuiKey
  ImGuiKey_COUNT* = 22.ImGuiKey

  ImGuiKeyModFlags_None* = 0.ImGuiKeyModFlags
  ImGuiKeyModFlags_Ctrl* = (1 shl 0).ImGuiKeyModFlags
  ImGuiKeyModFlags_Shift* = (1 shl 1).ImGuiKeyModFlags
  ImGuiKeyModFlags_Alt* = (1 shl 2).ImGuiKeyModFlags
  ImGuiKeyModFlags_Super* = (1 shl 3).ImGuiKeyModFlags

  ImGuiNavInput_Activate* = 0.ImGuiNavInput
  ImGuiNavInput_Cancel* = 1.ImGuiNavInput
  ImGuiNavInput_Input* = 2.ImGuiNavInput
  ImGuiNavInput_Menu* = 3.ImGuiNavInput
  ImGuiNavInput_DpadLeft* = 4.ImGuiNavInput
  ImGuiNavInput_DpadRight* = 5.ImGuiNavInput
  ImGuiNavInput_DpadUp* = 6.ImGuiNavInput
  ImGuiNavInput_DpadDown* = 7.ImGuiNavInput
  ImGuiNavInput_LStickLeft* = 8.ImGuiNavInput
  ImGuiNavInput_LStickRight* = 9.ImGuiNavInput
  ImGuiNavInput_LStickUp* = 10.ImGuiNavInput
  ImGuiNavInput_LStickDown* = 11.ImGuiNavInput
  ImGuiNavInput_FocusPrev* = 12.ImGuiNavInput
  ImGuiNavInput_FocusNext* = 13.ImGuiNavInput
  ImGuiNavInput_TweakSlow* = 14.ImGuiNavInput
  ImGuiNavInput_TweakFast* = 15.ImGuiNavInput
  ImGuiNavInput_KeyMenu* = 16.ImGuiNavInput
  ImGuiNavInput_KeyLeft* = 17.ImGuiNavInput
  ImGuiNavInput_KeyRight* = 18.ImGuiNavInput
  ImGuiNavInput_KeyUp* = 19.ImGuiNavInput
  ImGuiNavInput_KeyDown* = 20.ImGuiNavInput
  ImGuiNavInput_COUNT* = 21.ImGuiNavInput
  ImGuiNavInput_InternalStart* = ImGuiNavInput_KeyMenu

  ImGuiConfigFlags_None* = 0.ImGuiConfigFlags
  ImGuiConfigFlags_NavEnableKeyboard* = (1 shl 0).ImGuiConfigFlags
  ImGuiConfigFlags_NavEnableGamepad* = (1 shl 1).ImGuiConfigFlags
  ImGuiConfigFlags_NavEnableSetMousePos* = (1 shl 2).ImGuiConfigFlags
  ImGuiConfigFlags_NavNoCaptureKeyboard* = (1 shl 3).ImGuiConfigFlags
  ImGuiConfigFlags_NoMouse* = (1 shl 4).ImGuiConfigFlags
  ImGuiConfigFlags_NoMouseCursorChange* = (1 shl 5).ImGuiConfigFlags
  ImGuiConfigFlags_IsSRGB* = (1 shl 20).ImGuiConfigFlags
  ImGuiConfigFlags_IsTouchScreen* = (1 shl 21).ImGuiConfigFlags

  ImGuiBackendFlags_None* = 0.ImGuiBackendFlags
  ImGuiBackendFlags_HasGamepad* = (1 shl 0).ImGuiBackendFlags
  ImGuiBackendFlags_HasMouseCursors* = (1 shl 1).ImGuiBackendFlags
  ImGuiBackendFlags_HasSetMousePos* = (1 shl 2).ImGuiBackendFlags
  ImGuiBackendFlags_RendererHasVtxOffset* = (1 shl 3).ImGuiBackendFlags

  ImGuiCol_Text* = 0.ImGuiCol
  ImGuiCol_TextDisabled* = 1.ImGuiCol
  ImGuiCol_WindowBg* = 2.ImGuiCol
  ImGuiCol_ChildBg* = 3.ImGuiCol
  ImGuiCol_PopupBg* = 4.ImGuiCol
  ImGuiCol_Border* = 5.ImGuiCol
  ImGuiCol_BorderShadow* = 6.ImGuiCol
  ImGuiCol_FrameBg* = 7.ImGuiCol
  ImGuiCol_FrameBgHovered* = 8.ImGuiCol
  ImGuiCol_FrameBgActive* = 9.ImGuiCol
  ImGuiCol_TitleBg* = 10.ImGuiCol
  ImGuiCol_TitleBgActive* = 11.ImGuiCol
  ImGuiCol_TitleBgCollapsed* = 12.ImGuiCol
  ImGuiCol_MenuBarBg* = 13.ImGuiCol
  ImGuiCol_ScrollbarBg* = 14.ImGuiCol
  ImGuiCol_ScrollbarGrab* = 15.ImGuiCol
  ImGuiCol_ScrollbarGrabHovered* = 16.ImGuiCol
  ImGuiCol_ScrollbarGrabActive* = 17.ImGuiCol
  ImGuiCol_CheckMark* = 18.ImGuiCol
  ImGuiCol_SliderGrab* = 19.ImGuiCol
  ImGuiCol_SliderGrabActive* = 20.ImGuiCol
  ImGuiCol_Button* = 21.ImGuiCol
  ImGuiCol_ButtonHovered* = 22.ImGuiCol
  ImGuiCol_ButtonActive* = 23.ImGuiCol
  ImGuiCol_Header* = 24.ImGuiCol
  ImGuiCol_HeaderHovered* = 25.ImGuiCol
  ImGuiCol_HeaderActive* = 26.ImGuiCol
  ImGuiCol_Separator* = 27.ImGuiCol
  ImGuiCol_SeparatorHovered* = 28.ImGuiCol
  ImGuiCol_SeparatorActive* = 29.ImGuiCol
  ImGuiCol_ResizeGrip* = 30.ImGuiCol
  ImGuiCol_ResizeGripHovered* = 31.ImGuiCol
  ImGuiCol_ResizeGripActive* = 32.ImGuiCol
  ImGuiCol_Tab* = 33.ImGuiCol
  ImGuiCol_TabHovered* = 34.ImGuiCol
  ImGuiCol_TabActive* = 35.ImGuiCol
  ImGuiCol_TabUnfocused* = 36.ImGuiCol
  ImGuiCol_TabUnfocusedActive* = 37.ImGuiCol
  ImGuiCol_PlotLines* = 38.ImGuiCol
  ImGuiCol_PlotLinesHovered* = 39.ImGuiCol
  ImGuiCol_PlotHistogram* = 40.ImGuiCol
  ImGuiCol_PlotHistogramHovered* = 41.ImGuiCol
  ImGuiCol_TableHeaderBg* = 42.ImGuiCol
  ImGuiCol_TableBorderStrong* = 43.ImGuiCol
  ImGuiCol_TableBorderLight* = 44.ImGuiCol
  ImGuiCol_TableRowBg* = 45.ImGuiCol
  ImGuiCol_TableRowBgAlt* = 46.ImGuiCol
  ImGuiCol_TextSelectedBg* = 47.ImGuiCol
  ImGuiCol_DragDropTarget* = 48.ImGuiCol
  ImGuiCol_NavHighlight* = 49.ImGuiCol
  ImGuiCol_NavWindowingHighlight* = 50.ImGuiCol
  ImGuiCol_NavWindowingDimBg* = 51.ImGuiCol
  ImGuiCol_ModalWindowDimBg* = 52.ImGuiCol
  ImGuiCol_COUNT* = 53.ImGuiCol

  ImGuiStyleVar_Alpha* = 0.ImGuiStyleVar
  ImGuiStyleVar_WindowPadding* = 1.ImGuiStyleVar
  ImGuiStyleVar_WindowRounding* = 2.ImGuiStyleVar
  ImGuiStyleVar_WindowBorderSize* = 3.ImGuiStyleVar
  ImGuiStyleVar_WindowMinSize* = 4.ImGuiStyleVar
  ImGuiStyleVar_WindowTitleAlign* = 5.ImGuiStyleVar
  ImGuiStyleVar_ChildRounding* = 6.ImGuiStyleVar
  ImGuiStyleVar_ChildBorderSize* = 7.ImGuiStyleVar
  ImGuiStyleVar_PopupRounding* = 8.ImGuiStyleVar
  ImGuiStyleVar_PopupBorderSize* = 9.ImGuiStyleVar
  ImGuiStyleVar_FramePadding* = 10.ImGuiStyleVar
  ImGuiStyleVar_FrameRounding* = 11.ImGuiStyleVar
  ImGuiStyleVar_FrameBorderSize* = 12.ImGuiStyleVar
  ImGuiStyleVar_ItemSpacing* = 13.ImGuiStyleVar
  ImGuiStyleVar_ItemInnerSpacing* = 14.ImGuiStyleVar
  ImGuiStyleVar_IndentSpacing* = 15.ImGuiStyleVar
  ImGuiStyleVar_CellPadding* = 16.ImGuiStyleVar
  ImGuiStyleVar_ScrollbarSize* = 17.ImGuiStyleVar
  ImGuiStyleVar_ScrollbarRounding* = 18.ImGuiStyleVar
  ImGuiStyleVar_GrabMinSize* = 19.ImGuiStyleVar
  ImGuiStyleVar_GrabRounding* = 20.ImGuiStyleVar
  ImGuiStyleVar_TabRounding* = 21.ImGuiStyleVar
  ImGuiStyleVar_ButtonTextAlign* = 22.ImGuiStyleVar
  ImGuiStyleVar_SelectableTextAlign* = 23.ImGuiStyleVar
  ImGuiStyleVar_COUNT* = 24.ImGuiStyleVar

  ImGuiButtonFlags_None* = 0.ImGuiButtonFlags
  ImGuiButtonFlags_MouseButtonLeft* = (1 shl 0).ImGuiButtonFlags
  ImGuiButtonFlags_MouseButtonRight* = (1 shl 1).ImGuiButtonFlags
  ImGuiButtonFlags_MouseButtonMiddle* = (1 shl 2).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnClick* = (1 shl 4).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnClickRelease* = (1 shl 5).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnClickReleaseAnywhere* = (1 shl 6).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnRelease* = (1 shl 7).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnDoubleClick* = (1 shl 8).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnDragDropHold* = (1 shl 9).ImGuiButtonFlags
  ImGuiButtonFlags_Repeat* = (1 shl 10).ImGuiButtonFlags
  ImGuiButtonFlags_FlattenChildren* = (1 shl 11).ImGuiButtonFlags
  ImGuiButtonFlags_AllowItemOverlap* = (1 shl 12).ImGuiButtonFlags
  ImGuiButtonFlags_DontClosePopups* = (1 shl 13).ImGuiButtonFlags
  ImGuiButtonFlags_Disabled* = (1 shl 14).ImGuiButtonFlags
  ImGuiButtonFlags_AlignTextBaseLine* = (1 shl 15).ImGuiButtonFlags
  ImGuiButtonFlags_NoKeyModifiers* = (1 shl 16).ImGuiButtonFlags
  ImGuiButtonFlags_NoHoldingActiveId* = (1 shl 17).ImGuiButtonFlags
  ImGuiButtonFlags_NoNavFocus* = (1 shl 18).ImGuiButtonFlags
  ImGuiButtonFlags_NoHoveredOnFocus* = (1 shl 19).ImGuiButtonFlags
  ImGuiButtonFlags_PressedOnDefault* = ImGuiButtonFlags_PressedOnClickRelease
  ImGuiButtonFlags_MouseButtonDefault* = ImGuiButtonFlags_MouseButtonLeft
  ImGuiButtonFlags_PressedOnMask* = (ImGuiButtonFlags_PressedOnClick.cint or
                                     ImGuiButtonFlags_PressedOnClickRelease.cint or
                                     ImGuiButtonFlags_PressedOnClickReleaseAnywhere.cint or
                                     ImGuiButtonFlags_PressedOnRelease.cint or
                                     ImGuiButtonFlags_PressedOnDoubleClick.cint or
                                     ImGuiButtonFlags_PressedOnDragDropHold.cint).ImGuiButtonFlags
  ImGuiButtonFlags_MouseButtonMask* = (ImGuiButtonFlags_MouseButtonLeft.cint or
                                       ImGuiButtonFlags_MouseButtonRight.cint or
                                       ImGuiButtonFlags_MouseButtonMiddle.cint).ImGuiButtonFlags

  ImGuiColorEditFlags_None* = 0.ImGuiColorEditFlags
  ImGuiColorEditFlags_NoAlpha* = (1 shl 1).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoPicker* = (1 shl 2).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoOptions* = (1 shl 3).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoSmallPreview* = (1 shl 4).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoInputs* = (1 shl 5).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoTooltip* = (1 shl 6).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoLabel* = (1 shl 7).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoSidePreview* = (1 shl 8).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoDragDrop* = (1 shl 9).ImGuiColorEditFlags
  ImGuiColorEditFlags_NoBorder* = (1 shl 10).ImGuiColorEditFlags
  ImGuiColorEditFlags_AlphaBar* = (1 shl 16).ImGuiColorEditFlags
  ImGuiColorEditFlags_AlphaPreview* = (1 shl 17).ImGuiColorEditFlags
  ImGuiColorEditFlags_AlphaPreviewHalf* = (1 shl 18).ImGuiColorEditFlags
  ImGuiColorEditFlags_HDR* = (1 shl 19).ImGuiColorEditFlags
  ImGuiColorEditFlags_DisplayRGB* = (1 shl 20).ImGuiColorEditFlags
  ImGuiColorEditFlags_DisplayHSV* = (1 shl 21).ImGuiColorEditFlags
  ImGuiColorEditFlags_DisplayHex* = (1 shl 22).ImGuiColorEditFlags
  ImGuiColorEditFlags_Uint8* = (1 shl 23).ImGuiColorEditFlags
  ImGuiColorEditFlags_Float* = (1 shl 24).ImGuiColorEditFlags
  ImGuiColorEditFlags_PickerHueBar* = (1 shl 25).ImGuiColorEditFlags
  ImGuiColorEditFlags_PickerHueWheel* = (1 shl 26).ImGuiColorEditFlags
  ImGuiColorEditFlags_InputRGB* = (1 shl 27).ImGuiColorEditFlags
  ImGuiColorEditFlags_InputHSV* = (1 shl 28).ImGuiColorEditFlags
  ImGuiColorEditFlags_OptionsDefault* = (ImGuiColorEditFlags_Uint8.cint or
                                         ImGuiColorEditFlags_DisplayRGB.cint or
                                         ImGuiColorEditFlags_InputRGB.cint or
                                         ImGuiColorEditFlags_PickerHueBar.cint).ImGuiColorEditFlags
  ImGuiColorEditFlags_DisplayMask* = (ImGuiColorEditFlags_DisplayRGB.cint or
                                      ImGuiColorEditFlags_DisplayHSV.cint or
                                      ImGuiColorEditFlags_DisplayHex.cint).ImGuiColorEditFlags
  ImGuiColorEditFlags_DataTypeMask* = (ImGuiColorEditFlags_Uint8.cint or
                                       ImGuiColorEditFlags_Float.cint).ImGuiColorEditFlags
  ImGuiColorEditFlags_PickerMask* = (ImGuiColorEditFlags_PickerHueWheel.cint or
                                     ImGuiColorEditFlags_PickerHueBar.cint).ImGuiColorEditFlags
  ImGuiColorEditFlags_InputMask* = (ImGuiColorEditFlags_InputRGB.cint or
                                    ImGuiColorEditFlags_InputHSV.cint).ImGuiColorEditFlags

  ImGuiSliderFlags_None* = 0.ImGuiSliderFlags
  ImGuiSliderFlags_AlwaysClamp* = (1 shl 4).ImGuiSliderFlags
  ImGuiSliderFlags_Logarithmic* = (1 shl 5).ImGuiSliderFlags
  ImGuiSliderFlags_NoRoundToFormat* = (1 shl 6).ImGuiSliderFlags
  ImGuiSliderFlags_NoInput* = (1 shl 7).ImGuiSliderFlags
  ImGuiSliderFlags_Vertical* = (1 shl 20).ImGuiSliderFlags
  ImGuiSliderFlags_ReadOnly* = (1 shl 21).ImGuiSliderFlags
  ImGuiSliderFlags_InvalidMask* = 0x7000000F

  ImGuiMouseButton_Left* = 0.ImGuiMouseButton
  ImGuiMouseButton_Right* = 1.ImGuiMouseButton
  ImGuiMouseButton_Middle* = 2.ImGuiMouseButton
  ImGuiMouseButton_COUNT* = 5.ImGuiMouseButton

  ImGuiMouseCursor_None* = (-1).ImGuiMouseCursor
  ImGuiMouseCursor_Arrow* = 0.ImGuiMouseCursor
  ImGuiMouseCursor_TextInput* = 1.ImGuiMouseCursor
  ImGuiMouseCursor_ResizeAll* = 2.ImGuiMouseCursor
  ImGuiMouseCursor_ResizeNS* = 3.ImGuiMouseCursor
  ImGuiMouseCursor_ResizeEW* = 4.ImGuiMouseCursor
  ImGuiMouseCursor_ResizeNESW* = 5.ImGuiMouseCursor
  ImGuiMouseCursor_ResizeNWSE* = 6.ImGuiMouseCursor
  ImGuiMouseCursor_Hand* = 7.ImGuiMouseCursor
  ImGuiMouseCursor_NotAllowed* = 8.ImGuiMouseCursor
  ImGuiMouseCursor_COUNT* = 9.ImGuiMouseCursor

  ImGuiCond_None* = 0.ImGuiCond
  ImGuiCond_Always* = (1 shl 0).ImGuiCond
  ImGuiCond_Once* = (1 shl 1).ImGuiCond
  ImGuiCond_FirstUseEver* = (1 shl 2).ImGuiCond
  ImGuiCond_Appearing* = (1 shl 3).ImGuiCond

  ImDrawFlags_None* = 0.ImDrawFlags
  ImDrawFlags_Closed* = (1 shl 0).ImDrawFlags
  ImDrawFlags_RoundCornersTopLeft* = (1 shl 4).ImDrawFlags
  ImDrawFlags_RoundCornersTopRight* = (1 shl 5).ImDrawFlags
  ImDrawFlags_RoundCornersBottomLeft* = (1 shl 6).ImDrawFlags
  ImDrawFlags_RoundCornersBottomRight* = (1 shl 7).ImDrawFlags
  ImDrawFlags_RoundCornersNone* = (1 shl 8).ImDrawFlags
  ImDrawFlags_RoundCornersTop* = (ImDrawFlags_RoundCornersTopLeft.cint or
                                  ImDrawFlags_RoundCornersTopRight.cint).ImDrawFlags
  ImDrawFlags_RoundCornersBottom* = (ImDrawFlags_RoundCornersBottomLeft.cint or
                                     ImDrawFlags_RoundCornersBottomRight.cint).ImDrawFlags
  ImDrawFlags_RoundCornersLeft* = (ImDrawFlags_RoundCornersBottomLeft.cint or
                                   ImDrawFlags_RoundCornersTopLeft.cint).ImDrawFlags
  ImDrawFlags_RoundCornersRight* = (ImDrawFlags_RoundCornersBottomRight.cint or
                                    ImDrawFlags_RoundCornersTopRight.cint).ImDrawFlags
  ImDrawFlags_RoundCornersAll* = (ImDrawFlags_RoundCornersTopLeft.cint or
                                  ImDrawFlags_RoundCornersTopRight.cint or
                                  ImDrawFlags_RoundCornersBottomLeft.cint or
                                  ImDrawFlags_RoundCornersBottomRight.cint).ImDrawFlags
  ImDrawFlags_RoundCornersMask* = (ImDrawFlags_RoundCornersAll.cint or
                                   ImDrawFlags_RoundCornersNone.cint).ImDrawFlags
  ImDrawFlags_RoundCornersDefault* = ImDrawFlags_RoundCornersAll

  ImDrawListFlags_None* = 0.ImDrawListFlags
  ImDrawListFlags_AntiAliasedLines* = (1 shl 0).ImDrawListFlags
  ImDrawListFlags_AntiAliasedLinesUseTex* = (1 shl 1).ImDrawListFlags
  ImDrawListFlags_AntiAliasedFill* = (1 shl 2).ImDrawListFlags
  ImDrawListFlags_AllowVtxOffset* = (1 shl 3).ImDrawListFlags

  ImGuiViewportFlags_None* = 0.ImGuiViewportFlags
  ImGuiViewportFlags_IsPlatformWindow* = (1 shl 0).ImGuiViewportFlags
  ImGuiViewportFlags_IsPlatformMonitor* = (1 shl 1).ImGuiViewportFlags
  ImGuiViewportFlags_OwnedByApp* = (1 shl 2).ImGuiViewportFlags

  ImFontAtlasFlags_None* = 0.ImFontAtlasFlags
  ImFontAtlasFlags_NoPowerOfTwoHeight* = (1 shl 0).ImFontAtlasFlags
  ImFontAtlasFlags_NoMouseCursors* = (1 shl 1).ImFontAtlasFlags
  ImFontAtlasFlags_NoBakedLines* = (1 shl 2).ImFontAtlasFlags