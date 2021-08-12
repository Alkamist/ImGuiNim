import std/os

const imguiDir = currentSourcePath().splitPath.head / "imgui"

when defined(windows):
  when defined vcc:
    {.passL: "imm32.lib dwmapi.lib gdi32.lib".}
  else:
    {.passL: "-limm32 -ldwmapi -lgdi32".}

{.passC: "-DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1",
  compile: imguiDir / "imgui.cpp",
  compile: imguiDir / "imgui_tables.cpp",
  compile: imguiDir / "imgui_widgets.cpp",
  compile: imguiDir / "imgui_draw.cpp",
  compile: imguiDir / "imgui_demo.cpp".}

{.passC: "-I" & imguiDir.}