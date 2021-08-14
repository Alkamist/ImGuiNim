import
  winim/lean,
  flags, enums, types, functions, methods

when not defined(IMGUI_IMPL_WIN32_DISABLE_GAMEPAD):
  import xinput

type
  BackendData = object
    hWnd: HWND
    MouseHwnd: HWND
    MouseTracked: bool
    Time: INT64
    TicksPerSecond: INT64
    LastMouseCursor: ImGuiMouseCursor
    HasGamepad: bool
    WantUpdateHasGamepad: bool

var
  bd: BackendData
  initialized = false

proc init*(hWnd: pointer) =
  var io = GetIO()

  assert(not initialized, "Already initialized a platform backend!")

  var
    perfFrequency: INT64
    perfCounter: INT64

  if QueryPerformanceFrequency(cast[ptr LARGE_INTEGER](perfFrequency.addr)) == 0:
    raise newException(IOError, "Failed to initialize implwin32.")

  if QueryPerformanceCounter(cast[ptr LARGE_INTEGER](perfCounter.addr)) == 0:
    raise newException(IOError, "Failed to initialize implwin32.")

  # Setup backend capabilities flags
  io.BackendPlatformUserData = bd.addr
  io.BackendPlatformName = "imgui_impl_win32"
  io.BackendFlags = io.BackendFlags or ImGuiBackendFlag.HasMouseCursors
  io.BackendFlags = io.BackendFlags or ImGuiBackendFlag.HasSetMousePos

  bd.hWnd = cast[HWND](hWnd)
  bd.WantUpdateHasGamepad = true
  bd.TicksPerSecond = perfFrequency
  bd.Time = perfCounter
  bd.LastMouseCursor = ImGuiMouseCursor_COUNT

  io.ImeWindowHandle = hWnd

  io.KeyMap[ImGuiKey_Tab] = VK_TAB
  io.KeyMap[ImGuiKey_LeftArrow] = VK_LEFT
  io.KeyMap[ImGuiKey_RightArrow] = VK_RIGHT
  io.KeyMap[ImGuiKey_UpArrow] = VK_UP
  io.KeyMap[ImGuiKey_DownArrow] = VK_DOWN
  io.KeyMap[ImGuiKey_PageUp] = VK_PRIOR
  io.KeyMap[ImGuiKey_PageDown] = VK_NEXT
  io.KeyMap[ImGuiKey_Home] = VK_HOME
  io.KeyMap[ImGuiKey_End] = VK_END
  io.KeyMap[ImGuiKey_Insert] = VK_INSERT
  io.KeyMap[ImGuiKey_Delete] = VK_DELETE
  io.KeyMap[ImGuiKey_Backspace] = VK_BACK
  io.KeyMap[ImGuiKey_Space] = VK_SPACE
  io.KeyMap[ImGuiKey_Enter] = VK_RETURN
  io.KeyMap[ImGuiKey_Escape] = VK_ESCAPE
  io.KeyMap[ImGuiKey_KeyPadEnter] = VK_RETURN
  io.KeyMap[ImGuiKey_A] = 'A'.int32
  io.KeyMap[ImGuiKey_C] = 'C'.int32
  io.KeyMap[ImGuiKey_V] = 'V'.int32
  io.KeyMap[ImGuiKey_X] = 'X'.int32
  io.KeyMap[ImGuiKey_Y] = 'Y'.int32
  io.KeyMap[ImGuiKey_Z] = 'Z'.int32

  initialized = true

proc shutdown*() =
  initialized = false

proc updateMouseCursor(): bool =
  var io = GetIO()
  if (io.ConfigFlags and ImGuiConfigFlag.NoMouseCursorChange).int != 0:
    return false

  var imguiCursor = GetMouseCursor()
  if (imguiCursor == ImGuiMouseCursor.None) or io.MouseDrawCursor:
    # Hide OS mouse cursor if imgui is drawing it or if it wants no cursor
    SetCursor(0)

  else:
    # Show OS mouse cursor
    var win32Cursor =
      case imguiCursor:
      of ImGuiMouseCursor.Arrow: IDC_ARROW
      of ImGuiMouseCursor.TextInput: IDC_IBEAM
      of ImGuiMouseCursor.ResizeAll: IDC_SIZEALL
      of ImGuiMouseCursor.ResizeEW: IDC_SIZEWE
      of ImGuiMouseCursor.ResizeNS: IDC_SIZENS
      of ImGuiMouseCursor.ResizeNESW: IDC_SIZENESW
      of ImGuiMouseCursor.ResizeNWSE: IDC_SIZENWSE
      of ImGuiMouseCursor.Hand: IDC_HAND
      of ImGuiMouseCursor.NotAllowed: IDC_NO
      else: IDC_ARROW

    SetCursor(LoadCursor(0, win32Cursor))

  return true

proc updateMousePosition() =
  var io = GetIO()

  assert(bd.hWnd != 0)

  let previousMousePosition = io.MousePos
  io.MousePos = constructImVec2(-FLT_MAX, -FLT_MAX)

  # Obtain focused and hovered window. We forward mouse input when focused or when hovered (and no other window is capturing)
  var
    focusedWindow = GetForegroundWindow()
    hoveredWindow = bd.MouseHwnd
    mouseWindow = 0.HWND

  if (hoveredWindow != 0).BOOL and ((hoveredWindow == bd.hWnd).BOOL or IsChild(hoveredWindow, bd.hWnd)):
    mouseWindow = hoveredWindow

  elif (focusedWindow != 0).BOOL and ((focusedWindow == bd.hWnd).BOOL or IsChild(focusedWindow, bd.hWnd)):
    mouseWindow = focusedWindow

  if mouseWindow == 0:
    return

  # Set OS mouse position from Dear ImGui if requested (rarely used, only when ImGuiConfigFlags_NavEnableSetMousePos is enabled by user)
  if io.WantSetMousePos:
    var pos = POINT(x: previousMousePosition.x.int32,
                    y: previousMousePosition.y.int32)
    if ClientToScreen(bd.hWnd, pos.addr):
      SetCursorPos(pos.x, pos.y)

  # Set Dear ImGui mouse position from OS position
  var pos: POINT
  if GetCursorPos(pos.addr) and ScreenToClient(mouseWindow, pos.addr):
    io.MousePos = constructImVec2(pos.x.cfloat, pos.y.cfloat)

proc updateGamepads() =
  var io = GetIO()

  for i in io.NavInputs.low .. io.NavInputs.high:
    io.NavInputs[i] = 0.0

  if (io.ConfigFlags and ImGuiConfigFlag.NavEnableGamepad).int == 0:
    return

  # Calling XInputGetState() every frame on disconnected gamepads is unfortunately too slow.
  # Instead we refresh gamepad availability by calling XInputGetCapabilities() _only_ after receiving WM_DEVICECHANGE.
  if (bd.WantUpdateHasGamepad):
    var caps: XINPUT_CAPABILITIES
    bd.HasGamepad = XInputGetCapabilities(0, XINPUT_FLAG_GAMEPAD, caps.addr) == ERROR_SUCCESS
    bd.WantUpdateHasGamepad = false

  io.BackendFlags = io.BackendFlags and not ImGuiBackendFlag.HasGamepad

  var xInputState: XINPUT_STATE

  if bd.HasGamepad and XInputGetState(0, xInputState.addr) == ERROR_SUCCESS:
    var gamepad = xInputState.Gamepad
    io.BackendFlags = io.BackendFlags or ImGuiBackendFlag.HasGamepad

    template mapButton(navId, button): untyped =
      io.NavInputs[navId] =
        if (gamepad.wButtons and button) != 0:
          1.0
        else:
          0.0

    template mapAnalog(navId, value, v0, v1): untyped =
      var vn = value.float - v0.float / v1.float - v0.float
      if vn > 1.0:
        vn = 1.0
      if vn > 0.0 and io.NavInputs[navId] < vn:
        io.NavInputs[navId] = vn

    mapButton(ImGuiNavInput.Activate, XINPUT_GAMEPAD_A) # Cross / A
    mapButton(ImGuiNavInput.Cancel, XINPUT_GAMEPAD_B) # Circle / B
    mapButton(ImGuiNavInput.Menu, XINPUT_GAMEPAD_X) # Square / X
    mapButton(ImGuiNavInput.Input, XINPUT_GAMEPAD_Y) # Triangle / Y
    mapButton(ImGuiNavInput.DpadLeft, XINPUT_GAMEPAD_DPAD_LEFT) # D-Pad Left
    mapButton(ImGuiNavInput.DpadRight, XINPUT_GAMEPAD_DPAD_RIGHT) # D-Pad Right
    mapButton(ImGuiNavInput.DpadUp, XINPUT_GAMEPAD_DPAD_UP) # D-Pad Up
    mapButton(ImGuiNavInput.DpadDown, XINPUT_GAMEPAD_DPAD_DOWN) # D-Pad Down
    mapButton(ImGuiNavInput.FocusPrev, XINPUT_GAMEPAD_LEFT_SHOULDER) # L1 / LB
    mapButton(ImGuiNavInput.FocusNext, XINPUT_GAMEPAD_RIGHT_SHOULDER) # R1 / RB
    mapButton(ImGuiNavInput.TweakSlow, XINPUT_GAMEPAD_LEFT_SHOULDER) # L1 / LB
    mapButton(ImGuiNavInput.TweakFast, XINPUT_GAMEPAD_RIGHT_SHOULDER) # R1 / RB
    mapAnalog(ImGuiNavInput.LStickLeft, gamepad.sThumbLX, -XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE, -32768)
    mapAnalog(ImGuiNavInput.LStickRight, gamepad.sThumbLX, +XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE, +32767)
    mapAnalog(ImGuiNavInput.LStickUp, gamepad.sThumbLY, +XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE, +32767)
    mapAnalog(ImGuiNavInput.LStickDown, gamepad.sThumbLY, -XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE, -32767)

proc newFrame*() =
  var io = GetIO()

  assert(initialized, "Did you call init()?")

  # Setup display size (every frame to accommodate for window resizing)
  var rect: RECT
  GetClientRect(bd.hWnd, rect)
  io.DisplaySize = constructImVec2(
    (rect.right - rect.left).float,
    (rect.bottom - rect.top).float,
  )

  # Setup time step
  var currentTime: INT64
  QueryPerformanceCounter(cast[ptr LARGE_INTEGER](currentTime.addr))
  io.DeltaTime = (currentTime - bd.Time).float / bd.TicksPerSecond
  bd.Time = currentTime

  # Update OS mouse position
  updateMousePosition()

  # Update OS mouse cursor with the cursor requested by imgui
  var mouseCursor =
    if io.MouseDrawCursor != 0:
      ImGuiMouseCursor_None
    else:
      GetMouseCursor()

  if bd.LastMouseCursor != mouseCursor:
    bd.LastMouseCursor = mouseCursor
    updateMouseCursor()

  when not defined(IMGUI_IMPL_WIN32_DISABLE_GAMEPAD):
    updateGamepads()

# Allow compilation with old Windows SDK. MinGW doesn't have default _WIN32_WINNT/WINVER versions.
when not declared(WM_MOUSEHWHEEL):
  const WM_MOUSEHWHEEL* = 0x020E
when not declared(DBT_DEVNODES_CHANGED):
  const DBT_DEVNODES_CHANGED* = 0x0007

proc procHandler*(hWnd: HWND, msg: UINT, wParam: WPARAM, lParam: LPARAM): LRESULT =
  if GetCurrentContext() == nil:
    return 0

  var io = GetIO()

  case msg:
  of WM_MOUSEMOVE:
    # We need to call TrackMouseEvent in order to receive WM_MOUSELEAVE events
    bd.MouseHwnd = hWnd
    if not bd.MouseTracked:
      var tme = TTRACKMOUSEEVENT(
        cbSize: TTRACKMOUSEEVENT.sizeof.DWORD,
        dwFlags: TME_LEAVE,
        hwndTrack: hWnd,
        dwHoverTime: 0,
      )
      TrackMouseEvent(tme.addr)
      bd.MouseTracked = true

  of WM_MOUSELEAVE:
    if bd.MouseHwnd == hwnd:
      bd.MouseHwnd = 0
    bd.MouseTracked = false

  of WM_LBUTTONDOWN, WM_LBUTTONDBLCLK,
     WM_RBUTTONDOWN, WM_RBUTTONDBLCLK,
     WM_MBUTTONDOWN, WM_MBUTTONDBLCLK,
     WM_XBUTTONDOWN, WM_XBUTTONDBLCLK:
    var button = 0
    if msg in [WM_LBUTTONDOWN, WM_LBUTTONDBLCLK]:
      button = 0
    if msg in [WM_RBUTTONDOWN, WM_RBUTTONDBLCLK]:
      button = 1
    if msg in [WM_MBUTTONDOWN, WM_MBUTTONDBLCLK]:
      button = 2
    if msg in [WM_XBUTTONDOWN, WM_XBUTTONDBLCLK]:
      button =
        if GET_XBUTTON_WPARAM(wParam) == XBUTTON1: 3
        else: 4

    if not IsAnyMouseDown() and GetCapture() == 0:
      SetCapture(hwnd)

    io.MouseDown[button] = true

  of WM_LBUTTONUP, WM_RBUTTONUP, WM_MBUTTONUP, WM_XBUTTONUP:
    var button = 0
    if msg == WM_LBUTTONUP:
      button = 0
    if msg == WM_RBUTTONUP:
      button = 1
    if msg == WM_MBUTTONUP:
      button = 2
    if msg == WM_XBUTTONUP:
      button =
        if GET_XBUTTON_WPARAM(wParam) == XBUTTON1: 3
        else: 4

    io.MouseDown[button] = false;

    if not IsAnyMouseDown() and GetCapture() == hWnd:
      ReleaseCapture()

  of WM_MOUSEWHEEL:
    io.MouseWheel += GET_WHEEL_DELTA_WPARAM(wParam).float / WHEEL_DELTA.float

  of WM_MOUSEHWHEEL:
    io.MouseWheelH += GET_WHEEL_DELTA_WPARAM(wParam).float / WHEEL_DELTA.float

  of WM_KEYDOWN, WM_KEYUP, WM_SYSKEYDOWN, WM_SYSKEYUP:
    let down = msg in [WM_KEYDOWN, WM_SYSKEYDOWN]
    if wParam < 256:
      io.KeysDown[wParam] = down
    if wParam == VK_CONTROL:
      io.KeyCtrl = down
    if wParam == VK_SHIFT:
      io.KeyShift = down
    if wParam == VK_MENU:
      io.KeyAlt = down

  of WM_KILLFOCUS:
    for i in io.KeysDown.low .. io.KeysDown.high:
      io.KeysDown[i] = false
    io.KeyCtrl = false
    io.KeyShift = false
    io.KeyAlt =  false
    io.KeySuper = false

  of WM_CHAR:
    # You can also use ToAscii()+GetKeyboardState() to retrieve characters.
    if wParam > 0 and wParam < 0x10000:
      io.AddInputCharacterUTF16(wParam.ImWchar16)

  of WM_SETCURSOR:
    if LOWORD(lParam) == HTCLIENT and
       updateMouseCursor():
      return 1

  of WM_DEVICECHANGE:
    if wParam.UINT == DBT_DEVNODES_CHANGED:
      bd.WantUpdateHasGamepad = true

  else:
    discard