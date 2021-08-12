import types

###############################################################
# imgui.h
###############################################################

{.push importcpp, header: "imgui.h".}

proc destroyImVector*[T](this: var ImVector[T])

proc destroyImGuiListClipper*(this: var ImGuiListClipper)

proc destroyImDrawListSplitter*(this: var ImDrawListSplitter)

proc destroyImDrawList*(this: var ImDrawList)

proc destroyImFontAtlas*(this: var ImFontAtlas)

proc destroyImFont*(this: var ImFont)

{.pop.}

###############################################################
# imgui_internal.h
###############################################################

{.push importcpp, header: "imgui.h".}

proc destroyImPool*[T](this: var ImPool[T])

proc destroyImGuiViewportP*(this: var ImGuiViewportP)

proc destroyImGuiWindow*(this: var ImGuiWindow)

proc destroyImGuiTable*(this: var ImGuiTable)

{.pop.}