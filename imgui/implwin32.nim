import
  std/os,
  winim/lean

const backendDir = currentSourcePath().splitPath.head / "imgui"

{.compile: backendDir / "imgui_impl_win32.cpp".}

{.push discardable, importc, header: backendDir / "imgui_impl_win32.h".}

proc ImGui_ImplWin32_Init*(hWnd: pointer): bool
proc ImGui_ImplWin32_Shutdown*()
proc ImGui_ImplWin32_NewFrame*()
proc ImGui_ImplWin32_WndProcHandler*(hWnd: HWND, msg: UINT, wParam: WPARAM, lParam: LPARAM): LRESULT

{.pop.}