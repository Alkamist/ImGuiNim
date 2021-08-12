import std/os

const imguiDir = currentSourcePath().splitPath.head / "imgui"

when defined(windows):
  # import winim/lean

  when defined vcc:
    {.passL: "imm32.lib dwmapi.lib gdi32.lib".}
  else:
    {.passL: "-limm32 -ldwmapi -lgdi32".}

  # {.compile: imguiDir / "imgui_impl_win32.cpp".}

  # {.push importc, cdecl, discardable.}

  # proc ImGui_ImplWin32_Init*(hWnd: pointer): bool
  # proc ImGui_ImplWin32_Shutdown*()
  # proc ImGui_ImplWin32_NewFrame*()
  # proc ImGui_ImplWin32_WndProcHandler*(hWnd: HWND, msg: UINT, wParam: WPARAM, lParam: LPARAM): LRESULT

  # {.pop.}

{.passC: "-DIMGUI_DISABLE_OBSOLETE_FUNCTIONS=1",
  compile: imguiDir / "imgui.cpp",
  compile: imguiDir / "imgui_tables.cpp",
  compile: imguiDir / "imgui_widgets.cpp",
  compile: imguiDir / "imgui_draw.cpp",
  compile: imguiDir / "imgui_demo.cpp".}

{.passC: "-I" & imguiDir.}