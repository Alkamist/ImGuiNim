import winim/lean

const
  XINPUT_FLAG_GAMEPAD* = 0x00000001
  XINPUT_GAMEPAD_DPAD_UP* = 0x0001
  XINPUT_GAMEPAD_DPAD_DOWN* = 0x0002
  XINPUT_GAMEPAD_DPAD_LEFT* = 0x0004
  XINPUT_GAMEPAD_DPAD_RIGHT* = 0x0008
  XINPUT_GAMEPAD_START* = 0x0010
  XINPUT_GAMEPAD_BACK* = 0x0020
  XINPUT_GAMEPAD_LEFT_THUMB* = 0x0040
  XINPUT_GAMEPAD_RIGHT_THUMB* = 0x0080
  XINPUT_GAMEPAD_LEFT_SHOULDER* = 0x0100
  XINPUT_GAMEPAD_RIGHT_SHOULDER* = 0x0200
  XINPUT_GAMEPAD_A* = 0x1000
  XINPUT_GAMEPAD_B* = 0x2000
  XINPUT_GAMEPAD_X* = 0x4000
  XINPUT_GAMEPAD_Y* = 0x8000
  XINPUT_GAMEPAD_LEFT_THUMB_DEADZONE* = 7849
  XINPUT_GAMEPAD_RIGHT_THUMB_DEADZONE* = 8689

type
  XINPUT_VIBRATION* {.bycopy.} = object
    wLeftMotorSpeed*: WORD
    wRightMotorSpeed*: WORD
  PXINPUT_VIBRATION* = ptr XINPUT_GAMEPAD

  XINPUT_GAMEPAD* {.bycopy.} = object
    wButtons*: WORD
    bLeftTrigger*: BYTE
    bRightTrigger*: BYTE
    sThumbLX*: SHORT
    sThumbLY*: SHORT
    sThumbRX*: SHORT
    sThumbRY*: SHORT
  PXINPUT_GAMEPAD* = ptr XINPUT_GAMEPAD

  XINPUT_CAPABILITIES* {.bycopy.} = object
    Type*: BYTE
    SubType*: BYTE
    Flags*: WORD
    Gamepad*: XINPUT_GAMEPAD
    Vibration*: XINPUT_VIBRATION
  PXINPUT_CAPABILITIES* = ptr XINPUT_CAPABILITIES

  XINPUT_STATE* {.bycopy.}  = object
    dwPacketNumber*: DWORD
    Gamepad*: XINPUT_GAMEPAD
  PXINPUT_STATE* = ptr XINPUT_STATE

# Windows 8+: "xinput1_4.dll"
# DirectX SDK: "xinput1_3.dll", "xinput1_2.dll", "xinput1_1.dll"
# Windows Vista, Windows 7: "xinput9_1_0.dll"
const xInputDll = "xinput(1_4|1_3|1_2|1_1|9_1_0).dll"

{.push discardable, stdcall, importc, dynlib: xInputDll.}

proc XInputGetCapabilities*(dwUserIndex: DWORD, dwFlags: DWORD, pCapabilities: ptr XINPUT_CAPABILITIES): DWORD
proc XInputGetState*(dwUserIndex: DWORD, pState: ptr XINPUT_STATE): DWORD

{.pop.}